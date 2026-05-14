// Package persistence builds the postgres pool the ai service needs to
// debit/refund tokens. We only need the master pool — Consume/Refund are
// writes — so the wrapper is much simpler than the api one (no replicas,
// no health-check loop).
package persistence

import (
	"context"
	"fmt"

	"services/ai/infrastructure/environment"

	"github.com/jackc/pgx/v5/pgxpool"
)

func NewPool(ctx context.Context) (*pgxpool.Pool, error) {
	env := environment.Env
	url := fmt.Sprintf(
		"postgres://%s:%s@%s:5432/%s",
		env.DB_USER, env.DB_PASSWORD, env.MASTER_POSTGRES_DNS, env.DB_NAME,
	)
	pool, err := pgxpool.New(ctx, url)
	if err != nil {
		return nil, err
	}
	return pool, nil
}
