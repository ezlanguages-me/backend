package postgres

import (
	"pkg/billing"
	"pkg/domain"
)

// SubscriptionRepository is a thin pass-through to the shared billing
// repository. The actual SQL lives in pkg/billing so the ai service can
// share it. We keep this wrapper so api code keeps depending on a service-
// local symbol and we don't have to wire a pgxpool through every layer.
type SubscriptionRepository struct {
	inner *billing.Repository
}

func NewSubscriptionRepository(client *PostgresRepository) domain.SubscriptionRepository {
	return &SubscriptionRepository{inner: billing.NewRepository(client.getPool(false))}
}

func (r *SubscriptionRepository) GetOrCreate(userUUID string) (*domain.Subscription, error) {
	return r.inner.GetOrCreate(userUUID)
}

func (r *SubscriptionRepository) Consume(userUUID string, amount int, kind string) (*domain.Subscription, error) {
	return r.inner.Consume(userUUID, amount, kind)
}

func (r *SubscriptionRepository) Refund(userUUID string, amount int, kind string) (*domain.Subscription, error) {
	return r.inner.Refund(userUUID, amount, kind)
}
