package postgres

import (
	"context"
	"pkg/domain"
)

type PathRepository struct {
	client *PostgresRepository
}

func NewPathRepository(client *PostgresRepository) domain.PathRepository {
	return &PathRepository{client: client}
}

func (pr *PathRepository) Get(language, sourceLanguage string) (*domain.Path, error) {
	pool := pr.client.getPool(true)

	var path domain.Path
	err := pool.QueryRow(context.Background(), `
		SELECT *
		FROM mv_path_full
		WHERE language = $1 AND source_language = $2
	`, language, sourceLanguage).Scan(&path.UUID, &path.SourceLanguage, &path.Language, &path.Steps)

	if err != nil {
		return nil, err
	}

	return &path, nil
}
