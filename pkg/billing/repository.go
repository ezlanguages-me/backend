// Package billing owns the persistence of user subscriptions and token
// consumption. It is shared between the api service (which exposes
// /subscriptions/me) and the ai service (which decrements tokens around
// every Gemini call). Centralising the SQL here is the only way to keep
// the "exactly-once" token guarantee — the AI service must atomically check
// and consume tokens before paying for an upstream call.
package billing

import (
	"context"
	"errors"

	"pkg/domain"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

const subscriptionColumns = "uuid, user_uuid, plan, monthly_token_limit, tokens_used, period_start, period_end, active, created_at, updated_at"

// Repository is the postgres-backed billing repository. Use NewRepository to
// construct it with an already-initialised pgxpool. The pool must point at
// the master (writable) database — Consume/Refund mutate state.
type Repository struct {
	pool *pgxpool.Pool
}

func NewRepository(pool *pgxpool.Pool) *Repository {
	return &Repository{pool: pool}
}

func scanSubscription(row pgx.Row) (*domain.Subscription, error) {
	var s domain.Subscription
	err := row.Scan(
		&s.UUID,
		&s.UserUUID,
		&s.Plan,
		&s.MonthlyTokenLimit,
		&s.TokensUsed,
		&s.PeriodStart,
		&s.PeriodEnd,
		&s.Active,
		&s.CreatedAt,
		&s.UpdatedAt,
	)
	if err != nil {
		return nil, err
	}
	return &s, nil
}

// GetOrCreate returns the user's subscription, inserting a default free one
// if missing. Rolls the period over (and resets tokens_used) when expired.
func (r *Repository) GetOrCreate(userUUID string) (*domain.Subscription, error) {
	row := r.pool.QueryRow(context.Background(), `
		INSERT INTO user_subscriptions (user_uuid, plan, monthly_token_limit, tokens_used, period_start, period_end, active)
		VALUES ($1, $2, $3, 0, NOW(), NOW() + INTERVAL '1 month', TRUE)
		ON CONFLICT (user_uuid) DO UPDATE
			SET tokens_used = CASE
				WHEN user_subscriptions.period_end <= NOW() THEN 0
				ELSE user_subscriptions.tokens_used
			END,
			    period_start = CASE
				WHEN user_subscriptions.period_end <= NOW() THEN NOW()
				ELSE user_subscriptions.period_start
			END,
			    period_end = CASE
				WHEN user_subscriptions.period_end <= NOW() THEN NOW() + INTERVAL '1 month'
				ELSE user_subscriptions.period_end
			END,
			    updated_at = NOW()
		RETURNING `+subscriptionColumns,
		userUUID, domain.PlanFree, domain.DefaultMonthlyTokenLimit,
	)
	return scanSubscription(row)
}

// Consume atomically increments tokens_used. Returns ErrInsufficientTokens
// when the increment would exceed the monthly cap.
func (r *Repository) Consume(userUUID string, amount int, _ string) (*domain.Subscription, error) {
	if _, err := r.GetOrCreate(userUUID); err != nil {
		return nil, err
	}

	row := r.pool.QueryRow(context.Background(), `
		UPDATE user_subscriptions
		SET tokens_used = tokens_used + $2,
		    updated_at = NOW()
		WHERE user_uuid = $1
		  AND active = TRUE
		  AND tokens_used + $2 <= monthly_token_limit
		RETURNING `+subscriptionColumns,
		userUUID, amount,
	)

	sub, err := scanSubscription(row)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, domain.ErrInsufficientTokens
		}
		return nil, err
	}
	return sub, nil
}

// Refund decrements tokens_used (clamped at 0). Use after an upstream call
// failed and we want to give the credit back. The "_ kind" arg mirrors
// Consume so future analytics can audit refunds without a signature change.
func (r *Repository) Refund(userUUID string, amount int, _ string) (*domain.Subscription, error) {
	row := r.pool.QueryRow(context.Background(), `
		UPDATE user_subscriptions
		SET tokens_used = GREATEST(0, tokens_used - $2),
		    updated_at = NOW()
		WHERE user_uuid = $1
		  AND active = TRUE
		RETURNING `+subscriptionColumns,
		userUUID, amount,
	)

	sub, err := scanSubscription(row)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			// No active subscription. Nothing to refund — surface the row not found.
			return nil, err
		}
		return nil, err
	}
	return sub, nil
}

// EmailToUUID resolves the canonical user UUID for a given email. The ai
// service receives the email through the X-User-Email header (same contract
// as the api service auth middleware) and needs the UUID to act on the
// subscription tables.
func (r *Repository) EmailToUUID(email string) (string, error) {
	var uuid string
	err := r.pool.QueryRow(context.Background(), `
		SELECT uuid::text FROM users WHERE email = $1
	`, email).Scan(&uuid)
	if err != nil {
		return "", err
	}
	return uuid, nil
}
