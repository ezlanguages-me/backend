package application

import (
	"context"
	"errors"
	"pkg/domain"
	"testing"
)

type mockSubRepo struct {
	getOrCreate func(string) (*domain.Subscription, error)
	consume     func(string, int, string) (*domain.Subscription, error)
	refund      func(string, int, string) (*domain.Subscription, error)
}

func (m *mockSubRepo) GetOrCreate(uuid string) (*domain.Subscription, error) {
	return m.getOrCreate(uuid)
}
func (m *mockSubRepo) Consume(uuid string, amount int, kind string) (*domain.Subscription, error) {
	return m.consume(uuid, amount, kind)
}
func (m *mockSubRepo) Refund(uuid string, amount int, kind string) (*domain.Subscription, error) {
	if m.refund == nil {
		return nil, nil
	}
	return m.refund(uuid, amount, kind)
}

func TestSubscriptionApplication_GetMine(t *testing.T) {
	userRepo := newMockUserRepo()
	userRepo.users["uuid-a@x.com"] = &domain.User{UUID: "uuid-a@x.com", Email: "a@x.com"}
	userRepo.getByEmail["a@x.com"] = userRepo.users["uuid-a@x.com"]

	t.Run("requires email in ctx", func(t *testing.T) {
		app := SubscriptionApplication{Repo: &mockSubRepo{}, UserRepo: userRepo}
		_, err := app.GetMine(context.Background())
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})

	t.Run("propagates user repo error", func(t *testing.T) {
		bad := newMockUserRepo()
		bad.getErr = errors.New("db")
		app := SubscriptionApplication{Repo: &mockSubRepo{}, UserRepo: bad}
		_, err := app.GetMine(ctxWithEmail("a@x.com"))
		if err == nil || err.Error() != "db" {
			t.Fatalf("got %v", err)
		}
	})

	t.Run("happy path", func(t *testing.T) {
		want := &domain.Subscription{UUID: "s1"}
		repo := &mockSubRepo{getOrCreate: func(uuid string) (*domain.Subscription, error) {
			if uuid != "uuid-a@x.com" {
				t.Fatalf("unexpected uuid %q", uuid)
			}
			return want, nil
		}}
		app := SubscriptionApplication{Repo: repo, UserRepo: userRepo}
		got, err := app.GetMine(ctxWithEmail("a@x.com"))
		if err != nil || got != want {
			t.Fatalf("got=%v err=%v", got, err)
		}
	})
}

func TestSubscriptionApplication_Consume(t *testing.T) {
	userRepo := newMockUserRepo()
	userRepo.users["u"] = &domain.User{UUID: "u", Email: "a@x.com"}
	userRepo.getByEmail["a@x.com"] = userRepo.users["u"]

	tests := []struct {
		name    string
		amount  int
		kind    string
		ctx     context.Context
		wantErr error
	}{
		{"amount must be positive", 0, domain.TokenKindWriting, ctxWithEmail("a@x.com"), ErrInvalidAmount},
		{"negative amount rejected", -3, domain.TokenKindWriting, ctxWithEmail("a@x.com"), ErrInvalidAmount},
		{"unknown kind rejected", 1, "music", ctxWithEmail("a@x.com"), ErrInvalidTokenKind},
		{"unauthorized when no email", 1, domain.TokenKindWriting, context.Background(), ErrUnauthorized},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			app := SubscriptionApplication{Repo: &mockSubRepo{}, UserRepo: userRepo}
			_, err := app.Consume(tt.amount, tt.kind, tt.ctx)
			if !errors.Is(err, tt.wantErr) {
				t.Fatalf("got %v want %v", err, tt.wantErr)
			}
		})
	}

	t.Run("happy path delegates to repo with resolved uuid", func(t *testing.T) {
		want := &domain.Subscription{UUID: "s2"}
		called := false
		repo := &mockSubRepo{consume: func(uuid string, amount int, kind string) (*domain.Subscription, error) {
			called = true
			if uuid != "u" || amount != 2 || kind != domain.TokenKindSpeaking {
				t.Fatalf("bad args: %s %d %s", uuid, amount, kind)
			}
			return want, nil
		}}
		app := SubscriptionApplication{Repo: repo, UserRepo: userRepo}
		got, err := app.Consume(2, domain.TokenKindSpeaking, ctxWithEmail("a@x.com"))
		if err != nil || got != want || !called {
			t.Fatalf("got=%v err=%v called=%v", got, err, called)
		}
	})

	t.Run("repo error propagates", func(t *testing.T) {
		repo := &mockSubRepo{consume: func(string, int, string) (*domain.Subscription, error) {
			return nil, ErrInsufficientTokens
		}}
		app := SubscriptionApplication{Repo: repo, UserRepo: userRepo}
		_, err := app.Consume(1, domain.TokenKindWriting, ctxWithEmail("a@x.com"))
		if !errors.Is(err, ErrInsufficientTokens) {
			t.Fatalf("got %v", err)
		}
	})
}
