package application

import (
	"context"
	"errors"
	"pkg/domain"
	"testing"
)

// mockUserRepo is a minimal in-memory user repo for application tests.
type mockUserRepo struct {
	users      map[string]*domain.User // keyed by UUID
	getByEmail map[string]*domain.User // keyed by email
	createErr  error
	getErr     error
	updateErr  error
	deleteErr  error
	createCnt  int
	updateCnt  int
	deleteCnt  int
}

func newMockUserRepo() *mockUserRepo {
	return &mockUserRepo{
		users:      map[string]*domain.User{},
		getByEmail: map[string]*domain.User{},
	}
}

func (m *mockUserRepo) Create(u *domain.User) error {
	m.createCnt++
	if m.createErr != nil {
		return m.createErr
	}
	if u.UUID == "" {
		u.UUID = "uuid-" + u.Email
	}
	m.users[u.UUID] = u
	m.getByEmail[u.Email] = u
	return nil
}
func (m *mockUserRepo) Get(identifier string) (*domain.User, error) {
	if m.getErr != nil {
		return nil, m.getErr
	}
	if u, ok := m.users[identifier]; ok {
		return u, nil
	}
	if u, ok := m.getByEmail[identifier]; ok {
		return u, nil
	}
	return nil, errors.New("not found")
}
func (m *mockUserRepo) Update(u *domain.User) error {
	m.updateCnt++
	if m.updateErr != nil {
		return m.updateErr
	}
	m.users[u.UUID] = u
	m.getByEmail[u.Email] = u
	return nil
}
func (m *mockUserRepo) Delete(uuid string) error {
	m.deleteCnt++
	if m.deleteErr != nil {
		return m.deleteErr
	}
	if u, ok := m.users[uuid]; ok {
		delete(m.getByEmail, u.Email)
	}
	delete(m.users, uuid)
	return nil
}

func ctxWithEmail(email string) context.Context {
	return context.WithValue(context.Background(), "email", email)
}

func TestUserApplication_Create(t *testing.T) {
	repo := newMockUserRepo()
	app := UserApplication{Repo: repo}
	u := &domain.User{Name: "Alice", Email: "a@x.com"}
	if err := app.Create(u); err != nil {
		t.Fatalf("unexpected: %v", err)
	}
	if repo.createCnt != 1 || u.UUID == "" {
		t.Fatalf("Create did not delegate properly: %+v", u)
	}

	repo.createErr = errors.New("boom")
	if err := app.Create(&domain.User{Email: "b@x.com"}); err == nil {
		t.Fatal("expected propagated error")
	}
}

func TestUserApplication_Get(t *testing.T) {
	repo := newMockUserRepo()
	repo.users["u1"] = &domain.User{UUID: "u1", Email: "a@x.com"}
	repo.getByEmail["a@x.com"] = repo.users["u1"]
	app := UserApplication{Repo: repo}

	t.Run("missing email in context returns Unauthorized", func(t *testing.T) {
		_, err := app.Get("u1", context.Background())
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})

	t.Run("repo error propagates", func(t *testing.T) {
		repo.getErr = errors.New("db down")
		defer func() { repo.getErr = nil }()
		_, err := app.Get("u1", ctxWithEmail("a@x.com"))
		if err == nil || err.Error() != "db down" {
			t.Fatalf("got %v", err)
		}
	})

	t.Run("identifier matches but email mismatch is Unauthorized", func(t *testing.T) {
		_, err := app.Get("u1", ctxWithEmail("intruder@x.com"))
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})

	t.Run("happy path", func(t *testing.T) {
		got, err := app.Get("u1", ctxWithEmail("a@x.com"))
		if err != nil || got.UUID != "u1" {
			t.Fatalf("got=%v err=%v", got, err)
		}
	})
}

func TestUserApplication_Update(t *testing.T) {
	repo := newMockUserRepo()
	app := UserApplication{Repo: repo}

	t.Run("requires email in ctx", func(t *testing.T) {
		err := app.Update(&domain.User{Email: "a@x.com"}, context.Background())
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})
	t.Run("body email must match ctx email", func(t *testing.T) {
		err := app.Update(&domain.User{Email: "a@x.com"}, ctxWithEmail("b@x.com"))
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})
	t.Run("happy path delegates to repo", func(t *testing.T) {
		err := app.Update(&domain.User{UUID: "u1", Email: "a@x.com"}, ctxWithEmail("a@x.com"))
		if err != nil {
			t.Fatalf("unexpected: %v", err)
		}
		if repo.updateCnt != 1 {
			t.Fatalf("update not called")
		}
	})
}

func TestUserApplication_Delete(t *testing.T) {
	repo := newMockUserRepo()
	repo.users["u1"] = &domain.User{UUID: "u1", Email: "a@x.com"}
	repo.getByEmail["a@x.com"] = repo.users["u1"]
	app := UserApplication{Repo: repo}

	t.Run("missing ctx email", func(t *testing.T) {
		err := app.Delete("u1", context.Background())
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})
	t.Run("repo Get error", func(t *testing.T) {
		repo.getErr = errors.New("nope")
		defer func() { repo.getErr = nil }()
		err := app.Delete("u1", ctxWithEmail("a@x.com"))
		if err == nil || err.Error() != "nope" {
			t.Fatalf("got %v", err)
		}
	})
	t.Run("foreign user blocked", func(t *testing.T) {
		err := app.Delete("u1", ctxWithEmail("intruder@x.com"))
		if !errors.Is(err, ErrUnauthorized) {
			t.Fatalf("got %v", err)
		}
	})
	t.Run("happy path", func(t *testing.T) {
		err := app.Delete("u1", ctxWithEmail("a@x.com"))
		if err != nil {
			t.Fatalf("unexpected: %v", err)
		}
		if repo.deleteCnt != 1 {
			t.Fatalf("delete not called")
		}
	})
}
