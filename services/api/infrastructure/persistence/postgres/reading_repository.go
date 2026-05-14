package postgres

import (
	"context"
	"pkg/domain"
)

type ReadingRepository struct {
	client *PostgresRepository
}

func NewReadingRepository(client *PostgresRepository) domain.ReadingRepository {
	return &ReadingRepository{client: client}
}

func (r *ReadingRepository) Get(uuid, language string) (*domain.Reading, error) {
	pool := r.client.getPool(true)

	var rd domain.Reading
	var stepOrder int16
	var pathUUID, pathSourceLanguage string
	var category, description *string

	err := pool.QueryRow(context.Background(), `
		SELECT
			r.uuid, r.source_language, r.step_order, r.type, r.category,
			rt.title, rt.description, rt.content,
			p.uuid, p.source_language
		FROM reading r
		JOIN reading_translation rt ON rt.reading_uuid = r.uuid AND rt.language = $1
		JOIN path p ON p.uuid = r.path_uuid
		WHERE r.uuid = $2
	`, language, uuid).Scan(
		&rd.UUID, &rd.SourceLanguage, &stepOrder, &rd.Type, &category,
		&rd.Title, &description, &rd.Content,
		&pathUUID, &pathSourceLanguage,
	)
	if err != nil {
		return nil, err
	}

	rd.StepOrder = uint8(stepOrder)
	if category != nil {
		rd.Category = *category
	}
	if description != nil {
		rd.Description = *description
	}
	rd.Path = &domain.Path{UUID: pathUUID, SourceLanguage: pathSourceLanguage}

	return &rd, nil
}
