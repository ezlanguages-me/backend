package postgres

import (
	"context"
	"fmt"
	"log/slog"
	"services/stats_consumer/infrastructure/environment"

	"github.com/jackc/pgx/v5/pgxpool"
)

type PostgresClient struct {
	pool *pgxpool.Pool
}

func NewPostgresClient(ctx context.Context) (*PostgresClient, error) {
	env := environment.Env
	url := fmt.Sprintf(
		"postgres://%s:%s@%s:5432/%s?statement_timeout=10000&lock_timeout=5000",
		env.DB_USER, env.DB_PASSWORD, env.MASTER_POSTGRES_DNS, env.DB_NAME,
	)

	config, err := pgxpool.ParseConfig(url)
	if err != nil {
		return nil, fmt.Errorf("parse postgres config: %w", err)
	}
	config.MaxConns = 10
	config.MinConns = 2

	pool, err := pgxpool.NewWithConfig(ctx, config)
	if err != nil {
		return nil, fmt.Errorf("connect postgres: %w", err)
	}

	if err := pool.Ping(ctx); err != nil {
		return nil, fmt.Errorf("ping postgres: %w", err)
	}

	slog.Info("connected to postgres")
	return &PostgresClient{pool: pool}, nil
}

func (c *PostgresClient) Close() {
	c.pool.Close()
}
