package application

import (
	"context"
	"errors"
	"pkg/domain"
)

var (
	// ErrInsufficientTokens is re-exported from pkg/domain so existing api
	// code/tests keep using the local name. The underlying error value is
	// the domain one, so cross-service errors.Is checks still work.
	ErrInsufficientTokens = domain.ErrInsufficientTokens
	ErrInvalidAmount      = errors.New("Invalid amount: must be positive")
	ErrInvalidTokenKind   = errors.New("Invalid token kind")
)

type SubscriptionApplication struct {
	Repo     domain.SubscriptionRepository
	UserRepo domain.UserRepository
}

// resolveUserUUID converts the email coming from the auth context into a user UUID.
func (sa *SubscriptionApplication) resolveUserUUID(ctx context.Context) (string, error) {
	email, ok := ctx.Value("email").(string)
	if !ok || email == "" {
		return "", ErrUnauthorized
	}

	user, err := sa.UserRepo.Get(email)
	if err != nil {
		return "", err
	}
	return user.UUID, nil
}

func (sa *SubscriptionApplication) GetMine(ctx context.Context) (*domain.Subscription, error) {
	userUUID, err := sa.resolveUserUUID(ctx)
	if err != nil {
		return nil, err
	}
	return sa.Repo.GetOrCreate(userUUID)
}

func (sa *SubscriptionApplication) Consume(amount int, kind string, ctx context.Context) (*domain.Subscription, error) {
	if amount <= 0 {
		return nil, ErrInvalidAmount
	}
	if kind != domain.TokenKindWriting && kind != domain.TokenKindSpeaking {
		return nil, ErrInvalidTokenKind
	}

	userUUID, err := sa.resolveUserUUID(ctx)
	if err != nil {
		return nil, err
	}
	return sa.Repo.Consume(userUUID, amount, kind)
}
