package handlers

import (
	"bytes"
	"context"
	"errors"
	"net/http"
	"net/http/httptest"
	"pkg/domain"
	"services/api/application"
	natsinfra "services/api/infrastructure/nats"
	"strings"
	"testing"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/nats-io/nats.go"
)

// ---------- mock repositories ----------

type mockUserRepo struct {
	users     map[string]*domain.User
	byEmail   map[string]*domain.User
	createErr error
	getErr    error
	updateErr error
	deleteErr error
}

func newMockUserRepo() *mockUserRepo {
	return &mockUserRepo{users: map[string]*domain.User{}, byEmail: map[string]*domain.User{}}
}
func (m *mockUserRepo) Create(u *domain.User) error {
	if m.createErr != nil {
		return m.createErr
	}
	if u.UUID == "" {
		u.UUID = "uuid-" + u.Email
	}
	m.users[u.UUID] = u
	m.byEmail[u.Email] = u
	return nil
}
func (m *mockUserRepo) Get(id string) (*domain.User, error) {
	if m.getErr != nil {
		return nil, m.getErr
	}
	if u, ok := m.users[id]; ok {
		return u, nil
	}
	if u, ok := m.byEmail[id]; ok {
		return u, nil
	}
	return nil, errors.New("not found")
}
func (m *mockUserRepo) Update(u *domain.User) error {
	if m.updateErr != nil {
		return m.updateErr
	}
	m.users[u.UUID] = u
	return nil
}
func (m *mockUserRepo) Delete(uuid string) error { return m.deleteErr }

type mockPathRepo struct {
	out *domain.Path
	err error
}

func (m *mockPathRepo) Get(string, string) (*domain.Path, error) { return m.out, m.err }

type mockStudyRecordRepo struct {
	getOut   []*domain.StudyRecord
	batchOut []*domain.StudyRecord
	getErr   error
	batchErr error
}

func (m *mockStudyRecordRepo) Get(string) ([]*domain.StudyRecord, error) {
	return m.getOut, m.getErr
}
func (m *mockStudyRecordRepo) Batch(in []*domain.StudyRecord) ([]*domain.StudyRecord, error) {
	if m.batchErr != nil {
		return nil, m.batchErr
	}
	if m.batchOut != nil {
		return m.batchOut, nil
	}
	return in, nil
}

type mockRuleStatRepo struct {
	out []*domain.RuleStat
	err error
}

func (m *mockRuleStatRepo) Get(string) ([]*domain.RuleStat, error) { return m.out, m.err }
func (m *mockRuleStatRepo) Batch(in []*domain.RuleStat) ([]*domain.RuleStat, error) {
	return in, m.err
}

type mockLearningSummaryRepo struct {
	out *domain.LearningSummary
	err error
}

func (m *mockLearningSummaryRepo) Get(string) (*domain.LearningSummary, error) {
	return m.out, m.err
}
func (m *mockLearningSummaryRepo) GetVersion(string) (*time.Time, error) {
	return nil, m.err
}

type mockUserStatsRepo struct{ out *domain.UserStats }

func (m *mockUserStatsRepo) Get(string) (*domain.UserStats, error) { return m.out, nil }
func (m *mockUserStatsRepo) Upsert(string, float64, string) (*domain.UserStats, error) {
	return m.out, nil
}

type mockListeningRepo struct {
	out *domain.Listening
	err error
}

func (m *mockListeningRepo) Get(string, string) (*domain.Listening, error) {
	return m.out, m.err
}

type mockSubRepo struct {
	get     *domain.Subscription
	getErr  error
	consume *domain.Subscription
	conErr  error
	refund  *domain.Subscription
	refErr  error
}

func (m *mockSubRepo) GetOrCreate(string) (*domain.Subscription, error) {
	return m.get, m.getErr
}
func (m *mockSubRepo) Consume(string, int, string) (*domain.Subscription, error) {
	return m.consume, m.conErr
}
func (m *mockSubRepo) Refund(string, int, string) (*domain.Subscription, error) {
	return m.refund, m.refErr
}

// ---------- helpers ----------

func newAppWithEmail(email string) *fiber.App {
	app := fiber.New()
	if email != "" {
		app.Use(func(c *fiber.Ctx) error {
			c.SetUserContext(context.WithValue(c.UserContext(), "email", email))
			return c.Next()
		})
	}
	return app
}

func mustDo(t *testing.T, app *fiber.App, req *http.Request) (*http.Response, string) {
	t.Helper()
	resp, err := app.Test(req, -1)
	if err != nil {
		t.Fatalf("app.Test: %v", err)
	}
	defer resp.Body.Close()
	buf := new(bytes.Buffer)
	_, _ = buf.ReadFrom(resp.Body)
	return resp, buf.String()
}

// ---------- UserHandler ----------

func TestUserHandler_Create(t *testing.T) {
	repo := newMockUserRepo()
	h := &UserHandler{App: application.UserApplication{Repo: repo}}
	app := newAppWithEmail("")
	app.Post("/users", h.Create)

	t.Run("invalid body", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodPost, "/users", strings.NewReader("not-json"))
		req.Header.Set("Content-Type", "application/json")
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusBadRequest || !strings.Contains(body, "Bad body") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("validation error", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodPost, "/users", strings.NewReader(`{"name":"a","email":"bad"}`))
		req.Header.Set("Content-Type", "application/json")
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusBadRequest || !strings.Contains(body, "Invalid user data") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("happy path", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodPost, "/users", strings.NewReader(`{"name":"Alice","email":"a@x.com"}`))
		req.Header.Set("Content-Type", "application/json")
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"error":false`) {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("repo error", func(t *testing.T) {
		repo.createErr = errors.New("dup")
		req := httptest.NewRequest(http.MethodPost, "/users", strings.NewReader(`{"name":"Bob","email":"b@x.com"}`))
		req.Header.Set("Content-Type", "application/json")
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusInternalServerError || !strings.Contains(body, "Error creating user") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

func TestUserHandler_Get(t *testing.T) {
	repo := newMockUserRepo()
	repo.users["u1"] = &domain.User{UUID: "u1", Email: "a@x.com"}
	repo.byEmail["a@x.com"] = repo.users["u1"]

	h := &UserHandler{App: application.UserApplication{Repo: repo}}

	t.Run("missing identifier", func(t *testing.T) {
		app := newAppWithEmail("a@x.com")
		app.Get("/users", h.Get)
		req := httptest.NewRequest(http.MethodGet, "/users", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusBadRequest || !strings.Contains(body, "missing identifier") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("not found", func(t *testing.T) {
		app := newAppWithEmail("a@x.com")
		app.Get("/users", h.Get)
		req := httptest.NewRequest(http.MethodGet, "/users?id=missing", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusNotFound || !strings.Contains(body, "User not found") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("happy path by id", func(t *testing.T) {
		app := newAppWithEmail("a@x.com")
		app.Get("/users", h.Get)
		req := httptest.NewRequest(http.MethodGet, "/users?id=u1", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, "a@x.com") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

func TestUserHandler_Update(t *testing.T) {
	const validUUID = "11111111-1111-1111-1111-111111111111"
	repo := newMockUserRepo()
	repo.users[validUUID] = &domain.User{UUID: validUUID, Email: "a@x.com"}
	h := &UserHandler{App: application.UserApplication{Repo: repo}}

	t.Run("happy path", func(t *testing.T) {
		app := newAppWithEmail("a@x.com")
		app.Put("/users/:id", h.Update)
		req := httptest.NewRequest(http.MethodPut, "/users/"+validUUID,
			strings.NewReader(`{"name":"Alice","email":"a@x.com"}`))
		req.Header.Set("Content-Type", "application/json")
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("invalid body returns 400", func(t *testing.T) {
		app := newAppWithEmail("a@x.com")
		app.Put("/users/:id", h.Update)
		req := httptest.NewRequest(http.MethodPut, "/users/"+validUUID, strings.NewReader("garbage"))
		req.Header.Set("Content-Type", "application/json")
		resp, _ := mustDo(t, app, req)
		if resp.StatusCode != http.StatusBadRequest {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("repo error returns 500", func(t *testing.T) {
		repo.updateErr = errors.New("disk full")
		defer func() { repo.updateErr = nil }()
		app := newAppWithEmail("a@x.com")
		app.Put("/users/:id", h.Update)
		req := httptest.NewRequest(http.MethodPut, "/users/"+validUUID,
			strings.NewReader(`{"name":"Alice","email":"a@x.com"}`))
		req.Header.Set("Content-Type", "application/json")
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusInternalServerError || !strings.Contains(body, "Error updating user") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

func TestUserHandler_Delete(t *testing.T) {
	repo := newMockUserRepo()
	repo.users["u1"] = &domain.User{UUID: "u1", Email: "a@x.com"}
	repo.byEmail["a@x.com"] = repo.users["u1"]
	h := &UserHandler{App: application.UserApplication{Repo: repo}}

	app := newAppWithEmail("a@x.com")
	app.Delete("/users/:id", h.Delete)
	req := httptest.NewRequest(http.MethodDelete, "/users/u1", nil)
	resp, _ := mustDo(t, app, req)
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("status=%d", resp.StatusCode)
	}
}

// ---------- PathHandler ----------

func TestPathHandler_Get(t *testing.T) {
	want := &domain.Path{UUID: "p1", Language: "en", SourceLanguage: "es"}
	repo := &mockPathRepo{out: want}
	h := &PathHandler{App: application.PathApplication{Repo: repo}}

	app := fiber.New()
	app.Get("/path", h.Get)

	t.Run("happy path", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodGet, "/path?language=en&source_language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, "p1") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("not found", func(t *testing.T) {
		repo.err = errors.New("no rows")
		repo.out = nil
		req := httptest.NewRequest(http.MethodGet, "/path?language=en&source_language=es", nil)
		resp, _ := mustDo(t, app, req)
		if resp.StatusCode != http.StatusNotFound {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})
}

// ---------- StudySessionHandler.Create ----------

func TestStudyRecordHandler(t *testing.T) {
	repo := &mockStudyRecordRepo{getOut: []*domain.StudyRecord{{UUID: "r1"}}}
	h := &StudyRecordHandler{App: application.StudyRecordApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/sr", h.Get)
	app.Post("/sr/batch", h.Batch)

	resp, body := mustDo(t, app, httptest.NewRequest(http.MethodGet, "/sr?uuid=u", nil))
	if resp.StatusCode != http.StatusOK || !strings.Contains(body, "r1") {
		t.Fatalf("get: %d %s", resp.StatusCode, body)
	}

	req := httptest.NewRequest(http.MethodPost, "/sr/batch",
		strings.NewReader(`[{"user_uuid":"u","target_uuid":"t","target_type":"word"}]`))
	req.Header.Set("Content-Type", "application/json")
	resp, _ = mustDo(t, app, req)
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("batch: %d", resp.StatusCode)
	}

	req = httptest.NewRequest(http.MethodPost, "/sr/batch", strings.NewReader("not-json"))
	req.Header.Set("Content-Type", "application/json")
	resp, _ = mustDo(t, app, req)
	if resp.StatusCode == http.StatusOK {
		t.Fatalf("expected error on bad body, got 200")
	}
}

func TestStudySessionHandler_Create(t *testing.T) {
	h := &StudySessionHandler{
		Publisher: natsinfra.NewStudySessionPublisher(&nats.Conn{}),
	}
	app := fiber.New()
	app.Post("/ss", h.Create)

	// Publish errors are logged but don't fail the request
	req := httptest.NewRequest(http.MethodPost, "/ss",
		strings.NewReader(`{"user_uuid":"u1","total_items":5,"correct_items":3}`))
	req.Header.Set("Content-Type", "application/json")
	resp, body := mustDo(t, app, req)
	if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"error":false`) {
		t.Fatalf("status=%d body=%s", resp.StatusCode, body)
	}
}

func TestRuleStatHandler(t *testing.T) {
	repo := &mockRuleStatRepo{out: []*domain.RuleStat{{UUID: "rs1"}}}
	h := &RuleStatHandler{App: application.RuleStatApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/rs", h.Get)
	app.Post("/rs/batch", h.Batch)

	resp, body := mustDo(t, app, httptest.NewRequest(http.MethodGet, "/rs?uuid=u", nil))
	if resp.StatusCode != http.StatusOK || !strings.Contains(body, "rs1") {
		t.Fatalf("get: %d %s", resp.StatusCode, body)
	}

	req := httptest.NewRequest(http.MethodPost, "/rs/batch", strings.NewReader(`[{"uuid":"x"}]`))
	req.Header.Set("Content-Type", "application/json")
	resp, _ = mustDo(t, app, req)
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("batch: %d", resp.StatusCode)
	}
}

// ---------- LearningSummary / UserStats / Listening handlers ----------

func TestLearningSummaryHandler(t *testing.T) {
	repo := &mockLearningSummaryRepo{out: &domain.LearningSummary{UserUUID: "u"}}
	h := &LearningSummaryHandler{App: application.LearningSummaryApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/ls", h.Get)
	resp, body := mustDo(t, app, httptest.NewRequest(http.MethodGet, "/ls?uuid=u", nil))
	if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"user_uuid":"u"`) {
		t.Fatalf("status=%d body=%s", resp.StatusCode, body)
	}
}

func TestUserStatsHandler(t *testing.T) {
	repo := &mockUserStatsRepo{out: &domain.UserStats{UserUUID: "u", CurrentStreak: 5}}
	h := &UserStatsHandler{App: application.UserStatsApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/us", h.Get)
	resp, body := mustDo(t, app, httptest.NewRequest(http.MethodGet, "/us?uuid=u", nil))
	if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"current_streak":5`) {
		t.Fatalf("status=%d body=%s", resp.StatusCode, body)
	}
}

func TestListeningHandler(t *testing.T) {
	repo := &mockListeningRepo{out: &domain.Listening{
		TargetBase: domain.TargetBase{UUID: "L1"}, Title: "Test",
	}}
	h := &ListeningHandler{App: application.ListeningApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/listening/:uuid", h.Get)

	t.Run("happy path", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodGet, "/listening/L1?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, "L1") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("not found", func(t *testing.T) {
		repo.err = errors.New("nope")
		repo.out = nil
		req := httptest.NewRequest(http.MethodGet, "/listening/Lx?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusNotFound || !strings.Contains(body, "Listening not found") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

// ---------- SubscriptionHandler ----------

func TestSubscriptionHandler_GetMine(t *testing.T) {
	userRepo := newMockUserRepo()
	userRepo.users["u"] = &domain.User{UUID: "u", Email: "a@x.com"}
	userRepo.byEmail["a@x.com"] = userRepo.users["u"]

	subRepo := &mockSubRepo{get: &domain.Subscription{UUID: "s1", MonthlyTokenLimit: 60}}
	h := &SubscriptionHandler{App: application.SubscriptionApplication{
		Repo: subRepo, UserRepo: userRepo,
	}}

	app := newAppWithEmail("a@x.com")
	app.Get("/sub", h.GetMine)

	resp, body := mustDo(t, app, httptest.NewRequest(http.MethodGet, "/sub", nil))
	if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"uuid":"s1"`) {
		t.Fatalf("status=%d body=%s", resp.StatusCode, body)
	}
}

func TestSubscriptionHandler_Consume(t *testing.T) {
	userRepo := newMockUserRepo()
	userRepo.users["u"] = &domain.User{UUID: "u", Email: "a@x.com"}
	userRepo.byEmail["a@x.com"] = userRepo.users["u"]

	tests := []struct {
		name       string
		body       string
		ctxEmail   string
		consumeOut *domain.Subscription
		consumeErr error
		wantStatus int
		wantInBody string
	}{
		{
			name:       "happy path defaults amount to 1",
			body:       `{"kind":"writing"}`,
			ctxEmail:   "a@x.com",
			consumeOut: &domain.Subscription{UUID: "s1", TokensUsed: 1},
			wantStatus: http.StatusOK,
			wantInBody: `"tokens_used":1`,
		},
		{
			name:       "invalid body returns 400",
			body:       "not-json",
			ctxEmail:   "a@x.com",
			wantStatus: http.StatusBadRequest,
			wantInBody: "Invalid request body",
		},
		{
			name:       "insufficient tokens -> 402",
			body:       `{"amount":1,"kind":"writing"}`,
			ctxEmail:   "a@x.com",
			consumeErr: application.ErrInsufficientTokens,
			wantStatus: http.StatusPaymentRequired,
			wantInBody: "Insufficient tokens",
		},
		{
			name:       "unauthorized ctx -> 401",
			body:       `{"amount":1,"kind":"writing"}`,
			ctxEmail:   "",
			wantStatus: http.StatusUnauthorized,
			wantInBody: "Unauthorized",
		},
		{
			name:       "invalid kind -> 400",
			body:       `{"amount":1,"kind":"music"}`,
			ctxEmail:   "a@x.com",
			wantStatus: http.StatusBadRequest,
			wantInBody: "Invalid token kind",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			subRepo := &mockSubRepo{consume: tt.consumeOut, conErr: tt.consumeErr}
			h := &SubscriptionHandler{App: application.SubscriptionApplication{
				Repo: subRepo, UserRepo: userRepo,
			}}
			app := newAppWithEmail(tt.ctxEmail)
			app.Post("/sub/consume", h.Consume)

			req := httptest.NewRequest(http.MethodPost, "/sub/consume", strings.NewReader(tt.body))
			req.Header.Set("Content-Type", "application/json")
			resp, body := mustDo(t, app, req)
			if resp.StatusCode != tt.wantStatus {
				t.Fatalf("status=%d want=%d body=%s", resp.StatusCode, tt.wantStatus, body)
			}
			if !strings.Contains(body, tt.wantInBody) {
				t.Fatalf("body %q does not contain %q", body, tt.wantInBody)
			}
		})
	}
}

// ---------- benchmarks ----------

func BenchmarkUserHandler_Create(b *testing.B) {
	repo := newMockUserRepo()
	h := &UserHandler{App: application.UserApplication{Repo: repo}}
	app := fiber.New()
	app.Post("/users", h.Create)
	body := `{"name":"Alice","email":"a@x.com"}`

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodPost, "/users", strings.NewReader(body))
		req.Header.Set("Content-Type", "application/json")
		resp, err := app.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}

// ---------- mock repos for content handlers ----------

type mockReadingRepo struct {
	out *domain.Reading
	err error
}

func (m *mockReadingRepo) Get(string, string) (*domain.Reading, error) { return m.out, m.err }

type mockSpeakingRepo struct {
	out *domain.Speaking
	err error
}

func (m *mockSpeakingRepo) Get(string, string) (*domain.Speaking, error) { return m.out, m.err }

type mockWritingRepo struct {
	out *domain.Writing
	err error
}

func (m *mockWritingRepo) Get(string, string) (*domain.Writing, error) { return m.out, m.err }

// ---------- ReadingHandler ----------

func TestReadingHandler(t *testing.T) {
	repo := &mockReadingRepo{out: &domain.Reading{
		TargetBase: domain.TargetBase{UUID: "R1"}, Title: "The Catcher",
	}}
	h := &ReadingHandler{App: application.ReadingApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/reading/:uuid", h.Get)

	t.Run("happy path", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodGet, "/reading/R1?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, "R1") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("not found", func(t *testing.T) {
		repo.err = errors.New("nope")
		repo.out = nil
		req := httptest.NewRequest(http.MethodGet, "/reading/Rx?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusNotFound || !strings.Contains(body, "Reading not found") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

// ---------- SpeakingHandler ----------

func TestSpeakingHandler(t *testing.T) {
	repo := &mockSpeakingRepo{out: &domain.Speaking{
		TargetBase: domain.TargetBase{UUID: "SP1"}, Title: "Daily Talk",
	}}
	h := &SpeakingHandler{App: application.SpeakingApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/speaking/:uuid", h.Get)

	t.Run("happy path", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodGet, "/speaking/SP1?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, "SP1") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("not found", func(t *testing.T) {
		repo.err = errors.New("nope")
		repo.out = nil
		req := httptest.NewRequest(http.MethodGet, "/speaking/SPx?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusNotFound || !strings.Contains(body, "Speaking not found") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

// ---------- WritingHandler ----------

func TestWritingHandler(t *testing.T) {
	repo := &mockWritingRepo{out: &domain.Writing{
		TargetBase: domain.TargetBase{UUID: "W1"}, Title: "Essay",
	}}
	h := &WritingHandler{App: application.WritingApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/writing/:uuid", h.Get)

	t.Run("happy path", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodGet, "/writing/W1?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, "W1") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("not found", func(t *testing.T) {
		repo.err = errors.New("nope")
		repo.out = nil
		req := httptest.NewRequest(http.MethodGet, "/writing/Wx?language=es", nil)
		resp, body := mustDo(t, app, req)
		if resp.StatusCode != http.StatusNotFound || !strings.Contains(body, "Writing not found") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

// ---------- additional benchmarks ----------

func BenchmarkListeningHandler_Get(b *testing.B) {
	repo := &mockListeningRepo{out: &domain.Listening{
		TargetBase: domain.TargetBase{UUID: "L1"}, Title: "Test",
	}}
	h := &ListeningHandler{App: application.ListeningApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/listening/:uuid", h.Get)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodGet, "/listening/L1?language=es", nil)
		resp, err := app.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}

func BenchmarkReadingHandler_Get(b *testing.B) {
	repo := &mockReadingRepo{out: &domain.Reading{TargetBase: domain.TargetBase{UUID: "R1"}}}
	h := &ReadingHandler{App: application.ReadingApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/reading/:uuid", h.Get)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodGet, "/reading/R1?language=es", nil)
		resp, err := app.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}

func BenchmarkSpeakingHandler_Get(b *testing.B) {
	repo := &mockSpeakingRepo{out: &domain.Speaking{TargetBase: domain.TargetBase{UUID: "SP1"}}}
	h := &SpeakingHandler{App: application.SpeakingApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/speaking/:uuid", h.Get)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodGet, "/speaking/SP1?language=es", nil)
		resp, err := app.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}

func BenchmarkWritingHandler_Get(b *testing.B) {
	repo := &mockWritingRepo{out: &domain.Writing{TargetBase: domain.TargetBase{UUID: "W1"}}}
	h := &WritingHandler{App: application.WritingApplication{Repo: repo}}
	app := fiber.New()
	app.Get("/writing/:uuid", h.Get)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodGet, "/writing/W1?language=es", nil)
		resp, err := app.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}

func BenchmarkStudySessionHandler_Create(b *testing.B) {
	h := &StudySessionHandler{
		Publisher: natsinfra.NewStudySessionPublisher(&nats.Conn{}),
	}
	app := fiber.New()
	app.Post("/ss", h.Create)
	body := `{"user_uuid":"u1","total_items":5,"correct_items":3}`
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodPost, "/ss", strings.NewReader(body))
		req.Header.Set("Content-Type", "application/json")
		resp, err := app.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}
