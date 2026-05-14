package postgres

import (
	"context"
	"pkg/domain"
)

type ListeningRepository struct {
	client *PostgresRepository
}

func NewListeningRepository(client *PostgresRepository) domain.ListeningRepository {
	return &ListeningRepository{client: client}
}

func (r *ListeningRepository) Get(uuid, language string) (*domain.Listening, error) {
	pool := r.client.getPool(true)

	var l domain.Listening
	var stepOrder int16
	var pathUUID, pathSourceLanguage string
	var category, description *string

	err := pool.QueryRow(context.Background(), `
		SELECT
			l.uuid, l.source_language, l.step_order, l.type, l.category,
			lt.title, lt.description, lt.transcript,
			p.uuid, p.source_language
		FROM listening l
		JOIN listening_translation lt ON lt.listening_uuid = l.uuid AND lt.language = $1
		JOIN path p ON p.uuid = l.path_uuid
		WHERE l.uuid = $2
	`, language, uuid).Scan(
		&l.UUID, &l.SourceLanguage, &stepOrder, &l.Type, &category,
		&l.Title, &description, &l.Transcript,
		&pathUUID, &pathSourceLanguage,
	)
	if err != nil {
		return nil, err
	}

	l.StepOrder = uint8(stepOrder)
	if category != nil {
		l.Category = *category
	}
	if description != nil {
		l.Description = *description
	}
	l.Path = &domain.Path{UUID: pathUUID, SourceLanguage: pathSourceLanguage}

	questions, err := fetchExercises(pool, uuid, language)
	if err != nil {
		return nil, err
	}
	l.Questions = questions

	return &l, nil
}
