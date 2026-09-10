package postgres

import (
	"context"
	"errors"
	"pkg/domain"
	"time"

	"github.com/jackc/pgx/v5"
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

	// No rows → user has no learning data yet. Return an empty summary instead
	// of bubbling ErrNoRows up to the handler as a 500.
	if errors.Is(err, pgx.ErrNoRows) {
		return &domain.LearningSummary{UserUUID: userUUID}, nil
	}
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

	// No rows → no learning data yet, no version. Return nil so the handler
	// emits {updated_at: null} and the client skips its refresh.
	if errors.Is(err, pgx.ErrNoRows) {
		return nil, nil
	}
	if err != nil {
		return nil, err
	}

	return updatedAt, nil
}
