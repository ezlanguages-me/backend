package postgres

import (
	"context"
	"pkg/domain"

	"github.com/jackc/pgx/v5/pgxpool"
)

// fetchExercises returns all exercises associated with a given target UUID,
// translated to the requested language.
func fetchExercises(pool *pgxpool.Pool, targetUUID, language string) ([]domain.ExerciseItem, error) {
	rows, err := pool.Query(context.Background(), `
		SELECT (jsonb_build_object('uid', e.uuid::text, 'prompt', et.prompt) || et.specifics)::text
		FROM exercise e
		JOIN exercise_translation et ON et.exercise_uuid = e.uuid AND et.language = $1
		WHERE e.target_uuid = $2
	`, language, targetUUID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var items []domain.ExerciseItem
	for rows.Next() {
		var raw string
		if err := rows.Scan(&raw); err != nil {
			return nil, err
		}
		item, err := domain.ExerciseFromJSON([]byte(raw))
		if err != nil {
			return nil, err
		}
		items = append(items, item)
	}

	if items == nil {
		items = []domain.ExerciseItem{}
	}

	return items, rows.Err()
}
