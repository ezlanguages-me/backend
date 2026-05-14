package postgres

import (
	"context"
	"pkg/domain"
	"time"
)

type LearningSummaryRepository struct {
	client *PostgresRepository
}

func NewLearningSummaryRepository(client *PostgresRepository) domain.LearningSummaryRepository {
	return &LearningSummaryRepository{client: client}
}

func (r *LearningSummaryRepository) Get(userUUID string) (*domain.LearningSummary, error) {
	pool := r.client.getPool(true)

	var s domain.LearningSummary
	var updatedAt *time.Time
	err := pool.QueryRow(context.Background(), `
		SELECT user_uuid, study_records, hourly_stats, rule_stats, stats, updated_at
		FROM v_user_learning_summary
		WHERE user_uuid = $1
	`, userUUID).Scan(&s.UserUUID, &s.StudyRecords, &s.HourlyStats, &s.RuleStats, &s.Stats, &updatedAt)

	if err != nil {
		return nil, err
	}

	if updatedAt != nil {
		str := updatedAt.UTC().Format(time.RFC3339Nano)
		s.UpdatedAt = &str
	}

	return &s, nil
}

func (r *LearningSummaryRepository) GetVersion(userUUID string) (*time.Time, error) {
	pool := r.client.getPool(true)

	var updatedAt *time.Time
	err := pool.QueryRow(context.Background(), `
		SELECT updated_at FROM v_user_learning_summary WHERE user_uuid = $1
	`, userUUID).Scan(&updatedAt)

	if err != nil {
		return nil, err
	}

	return updatedAt, nil
}
