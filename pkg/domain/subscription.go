package domain

import (
	"errors"
	"time"
)

// ErrInsufficientTokens is returned when a Consume call would exceed the
// monthly token budget. Lives in the domain package so any service (api, ai)
// can both produce and check it without importing service-specific code.
var ErrInsufficientTokens = errors.New("Insufficient tokens: monthly limit reached")

// Plan identifiers. New plans should be added here.
const (
	PlanFree = "free"
)

// DefaultMonthlyTokenLimit is the amount of credits assigned to a free user.
// Each writing/speaking submission consumes 1 token.
const DefaultMonthlyTokenLimit = 60

// TokenKind identifies what consumed the token (used for analytics/audit).
const (
	TokenKindWriting  = "writing"
	TokenKindSpeaking = "speaking"
)

type Subscription struct {
	UUID              string    `json:"uuid" validate:"omitempty,uuid"`
	UserUUID          string    `json:"user_uuid" validate:"required,uuid"`
	Plan              string    `json:"plan" validate:"required"`
	MonthlyTokenLimit int       `json:"monthly_token_limit" validate:"gte=0"`
	TokensUsed        int       `json:"tokens_used" validate:"gte=0"`
	PeriodStart       time.Time `json:"period_start"`
	PeriodEnd         time.Time `json:"period_end"`
	Active            bool      `json:"active"`
	CreatedAt         time.Time `json:"created_at"`
	UpdatedAt         time.Time `json:"updated_at"`
}

// TokensRemaining returns how many tokens the user still has available.
func (s *Subscription) TokensRemaining() int {
	r := s.MonthlyTokenLimit - s.TokensUsed
	if r < 0 {
		return 0
	}
	return r
}

type SubscriptionRepository interface {
	// GetOrCreate returns the user's subscription, creating a default free one if missing.
	// It also rolls the period over if the previous one expired.
	GetOrCreate(userUUID string) (*Subscription, error)
	// Consume increments tokens_used by amount atomically. Returns the updated
	// subscription. Returns ErrInsufficientTokens if not enough credits.
	Consume(userUUID string, amount int, kind string) (*Subscription, error)
	// Refund decrements tokens_used by amount (clamped to 0). Used when an
	// upstream call (e.g. Gemini) fails after we already consumed.
	Refund(userUUID string, amount int, kind string) (*Subscription, error)
}
