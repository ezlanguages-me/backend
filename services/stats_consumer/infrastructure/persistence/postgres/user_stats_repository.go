package postgres

import (
	"context"
	"fmt"
)

type UserStatsRepository struct {
	client *PostgresClient
}

func NewUserStatsRepository(client *PostgresClient) *UserStatsRepository {
	return &UserStatsRepository{client: client}
}

// Upsert updates the user_stats row incrementally when a new study session arrives.
// Streak logic:
//   - same day  → already counted, just add hours/session
//   - yesterday → streak continues (+1)
//   - older     → streak resets to 1
func (r *UserStatsRepository) Upsert(ctx context.Context, userUUID string, durationHours float64, studyDate string) error {
	_, err := r.client.pool.Exec(ctx, `
		INSERT INTO user_stats (user_uuid, current_streak, longest_streak, total_hours_studied, total_sessions, last_study_date, updated_at)
		VALUES ($1, 1, 1, $2, 1, $3::date, NOW())
		ON CONFLICT (user_uuid) DO UPDATE SET
			current_streak = CASE
				WHEN user_stats.last_study_date = $3::date              THEN user_stats.current_streak
				WHEN user_stats.last_study_date = $3::date - INTERVAL '1 day' THEN user_stats.current_streak + 1
				ELSE 1
			END,
			longest_streak = GREATEST(
				user_stats.longest_streak,
				CASE
					WHEN user_stats.last_study_date = $3::date              THEN user_stats.current_streak
					WHEN user_stats.last_study_date = $3::date - INTERVAL '1 day' THEN user_stats.current_streak + 1
					ELSE 1
				END
			),
			total_hours_studied = user_stats.total_hours_studied + $2,
			total_sessions      = user_stats.total_sessions + CASE WHEN user_stats.last_study_date = $3::date THEN 0 ELSE 1 END,
			last_study_date     = GREATEST(user_stats.last_study_date, $3::date),
			updated_at          = NOW()
	`, userUUID, durationHours, studyDate)

	if err != nil {
		return fmt.Errorf("upsert user_stats user=%s: %w", userUUID, err)
	}
	return nil
}
