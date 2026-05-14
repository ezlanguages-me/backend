package postgres

import (
	"context"
	"pkg/domain"
)

type WritingRepository struct {
	client *PostgresRepository
}

func NewWritingRepository(client *PostgresRepository) domain.WritingRepository {
	return &WritingRepository{client: client}
}

func (r *WritingRepository) Get(uuid, language string) (*domain.Writing, error) {
	pool := r.client.getPool(true)

	var w domain.Writing
	var stepOrder int16
	var pathUUID, pathSourceLanguage string
	var category, description *string

	err := pool.QueryRow(context.Background(), `
		SELECT
			w.uuid, w.source_language, w.step_order, w.type, w.category,
			wt.title, wt.description, wt.prompt,
			p.uuid, p.source_language
		FROM writing w
		JOIN writing_translation wt ON wt.writing_uuid = w.uuid AND wt.language = $1
		JOIN path p ON p.uuid = w.path_uuid
		WHERE w.uuid = $2
	`, language, uuid).Scan(
		&w.UUID, &w.SourceLanguage, &stepOrder, &w.Type, &category,
		&w.Title, &description, &w.Prompt,
		&pathUUID, &pathSourceLanguage,
	)
	if err != nil {
		return nil, err
	}

	w.StepOrder = uint8(stepOrder)
	if category != nil {
		w.Category = *category
	}
	if description != nil {
		w.Description = *description
	}
	w.Path = &domain.Path{UUID: pathUUID, SourceLanguage: pathSourceLanguage}

	return &w, nil
}
