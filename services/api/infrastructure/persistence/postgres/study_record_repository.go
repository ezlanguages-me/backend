package postgres

import (
	"context"
	"pkg/domain"

	"github.com/jackc/pgx/v5"
)

type StudyRecordRepository struct {
	client *PostgresRepository
}

func NewStudyRecordRepository(client *PostgresRepository) domain.StudyRecordRepository {
	return &StudyRecordRepository{client: client}
}

func (srr *StudyRecordRepository) Get(userUUID string) ([]*domain.StudyRecord, error) {
	// Read from master to avoid replication lag: after a study session the client
	// immediately re-fetches records to know what to study next. A stale replica
	// would return outdated next_review values and re-serve already-studied items.
	pool := srr.client.getPool(false)

	rows, err := pool.Query(context.Background(), `
		SELECT *
		FROM study_records
		WHERE user_uuid = $1
	`, userUUID)

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var records []*domain.StudyRecord
	for rows.Next() {
		var record domain.StudyRecord
		err := rows.Scan(&record.UUID, &record.UserUUID, &record.TargetUUID, &record.TargetType, &record.LastReview, &record.NextReview, &record.Stability, &record.Difficulty, &record.Repetitions, &record.Status, &record.LastScore, &record.Mastery, &record.CreatedAt, &record.UpdatedAt)
		if err != nil {
			return nil, err
		}
		records = append(records, &record)
	}

	return records, nil
}

func (srr *StudyRecordRepository) Batch(records []*domain.StudyRecord) ([]*domain.StudyRecord, error) {
	pool := srr.client.getPool(false)

	batch := &pgx.Batch{}
	for _, record := range records {
		batch.Queue(`
            INSERT INTO study_records (user_uuid, target_uuid, target_type, last_review, next_review, stability, difficulty, repetitions, status, last_score, created_at, updated_at, mastery)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
            ON CONFLICT (user_uuid, target_uuid, target_type) DO UPDATE SET
                target_type = EXCLUDED.target_type,
                last_review = EXCLUDED.last_review,
                next_review = EXCLUDED.next_review,
                stability = EXCLUDED.stability,
                difficulty = EXCLUDED.difficulty,
                repetitions = EXCLUDED.repetitions,
                status = EXCLUDED.status,
                last_score = EXCLUDED.last_score,
                updated_at = EXCLUDED.updated_at,
				mastery = EXCLUDED.mastery
            RETURNING *
        `, record.UserUUID, record.TargetUUID, record.TargetType, record.LastReview, record.NextReview, record.Stability, record.Difficulty, record.Repetitions, record.Status, record.LastScore, record.CreatedAt, record.UpdatedAt, record.Mastery)
	}

	br := pool.SendBatch(context.Background(), batch)
	defer br.Close()

	var inserted []*domain.StudyRecord
	for range records {
		rows, err := br.Query()
		if err != nil {
			return nil, err
		}
		for rows.Next() {
			var record domain.StudyRecord
			if err := rows.Scan(&record.UUID, &record.UserUUID, &record.TargetUUID, &record.TargetType, &record.LastReview, &record.NextReview, &record.Stability, &record.Difficulty, &record.Repetitions, &record.Status, &record.LastScore, &record.Mastery, &record.CreatedAt, &record.UpdatedAt); err != nil {
				rows.Close()
				return nil, err
			}
			inserted = append(inserted, &record)
		}
		rows.Close()
		if err := rows.Err(); err != nil {
			return nil, err
		}
	}

	return inserted, nil
}
