package postgres

import (
	"context"
	"fmt"
	"pkg/domain"
)

type HourlyStatRepository struct {
	client *PostgresClient
}

func NewHourlyStatRepository(client *PostgresClient) *HourlyStatRepository {
	return &HourlyStatRepository{client: client}
}

// Upsert inserts or accumulates an hourly_stat row using a weighted rolling average.
// When a conflict occurs the existing averages are recalculated across all sessions.
func (r *HourlyStatRepository) Upsert(ctx context.Context, stat *domain.HourlyStat) error {
	_, err := r.client.pool.Exec(ctx, `
		INSERT INTO hourly_stat (user_uuid, hour, average_score, average_response_time, average_energy_level, total_sessions, last_updated)
		VALUES ($1, $2, $3, $4, $5, 1, NOW())
		ON CONFLICT (user_uuid, hour) DO UPDATE SET
			average_score = (
				hourly_stat.average_score * hourly_stat.total_sessions + EXCLUDED.average_score
			) / (hourly_stat.total_sessions + 1),
			average_response_time = (
				hourly_stat.average_response_time * hourly_stat.total_sessions + EXCLUDED.average_response_time
			) / (hourly_stat.total_sessions + 1),
			average_energy_level = (
				hourly_stat.average_energy_level * hourly_stat.total_sessions + EXCLUDED.average_energy_level
			) / (hourly_stat.total_sessions + 1),
			total_sessions = hourly_stat.total_sessions + 1,
			last_updated   = NOW()
	`, stat.UserUUID, stat.Hour, stat.AverageScore, stat.AverageResponseTime, stat.AverageEnergyLevel)

	if err != nil {
		return fmt.Errorf("upsert hourly_stat: %w", err)
	}
	return nil
}
