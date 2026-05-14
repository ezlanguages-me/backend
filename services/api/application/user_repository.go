package application

import (
	"context"
	"errors"
	"pkg/domain"
)

var (
	ErrUnauthorized = errors.New("Unauthorized: user does not have permission to access this resource")
)

type UserApplication struct {
	Repo domain.UserRepository
}

func (ua *UserApplication) Create(user *domain.User) error {
	return ua.Repo.Create(user)
}

func (ua *UserApplication) Get(identifier string, ctx context.Context) (*domain.User, error) {
	email, ok := ctx.Value("email").(string)
	if !ok || email == "" {
		return nil, ErrUnauthorized
	}

	user, err := ua.Repo.Get(identifier)
	if err != nil {
		return nil, err
	}

	if user.Email != email {
		return nil, ErrUnauthorized
	}

	return user, nil
}

func (ua *UserApplication) Update(user *domain.User, ctx context.Context) error {
	email, ok := ctx.Value("email").(string)
	if !ok || email == "" {
		return ErrUnauthorized
	}

	if user.Email != email {
		return ErrUnauthorized
	}

	return ua.Repo.Update(user)
}

func (ua *UserApplication) Delete(uuid string, ctx context.Context) error {
	email, ok := ctx.Value("email").(string)
	if !ok || email == "" {
		return ErrUnauthorized
	}

	user, err := ua.Repo.Get(uuid)
	if err != nil {
		return err
	}

	if user.Email != email {
		return ErrUnauthorized
	}

	return ua.Repo.Delete(uuid)
}
