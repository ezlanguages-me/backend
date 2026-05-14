package postgres

import (
	"context"
	"pkg/domain"
)

type UserStatsRepository struct {
	client *PostgresRepository
}

func NewUserStatsRepository(client *PostgresRepository) domain.UserStatsRepository {
	return &UserStatsRepository{client: client}
}

func (r *UserStatsRepository) Get(userUUID string) (*domain.UserStats, error) {
	pool := r.client.getPool(true)

	var s domain.UserStats
	err := pool.QueryRow(context.Background(), `
		SELECT uuid, user_uuid, current_streak, longest_streak, total_hours_studied, total_sessions, last_study_date::text, updated_at::text
		FROM user_stats
		WHERE user_uuid = $1
	`, userUUID).Scan(&s.UUID, &s.UserUUID, &s.CurrentStreak, &s.LongestStreak, &s.TotalHoursStudied, &s.TotalSessions, &s.LastStudyDate, &s.UpdatedAt)

	if err != nil {
		return nil, err
	}

	return &s, nil
}

func (r *UserStatsRepository) Upsert(userUUID string, durationHours float64, studyDate string) (*domain.UserStats, error) {
	return nil, nil // write path is owned by stats_consumer
}
