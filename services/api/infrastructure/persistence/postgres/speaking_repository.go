package postgres

import (
	"context"
	"pkg/domain"
)

type SpeakingRepository struct {
	client *PostgresRepository
}

func NewSpeakingRepository(client *PostgresRepository) domain.SpeakingRepository {
	return &SpeakingRepository{client: client}
}

func (r *SpeakingRepository) Get(uuid, language string) (*domain.Speaking, error) {
	pool := r.client.getPool(true)

	var s domain.Speaking
	var stepOrder int16
	var pathUUID, pathSourceLanguage string
	var category, description *string

	err := pool.QueryRow(context.Background(), `
		SELECT
			s.uuid, s.source_language, s.step_order, s.type, s.category,
			st.title, st.description, st.prompt,
			p.uuid, p.source_language
		FROM speaking s
		JOIN speaking_translation st ON st.speaking_uuid = s.uuid AND st.language = $1
		JOIN path p ON p.uuid = s.path_uuid
		WHERE s.uuid = $2
	`, language, uuid).Scan(
		&s.UUID, &s.SourceLanguage, &stepOrder, &s.Type, &category,
		&s.Title, &description, &s.Prompt,
		&pathUUID, &pathSourceLanguage,
	)
	if err != nil {
		return nil, err
	}

	s.StepOrder = uint8(stepOrder)
	if category != nil {
		s.Category = *category
	}
	if description != nil {
		s.Description = *description
	}
	s.Path = &domain.Path{UUID: pathUUID, SourceLanguage: pathSourceLanguage}

	return &s, nil
}
