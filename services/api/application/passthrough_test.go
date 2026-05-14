package application

import (
	"errors"
	"pkg/domain"
	"testing"
	"time"
)

// Trivial pass-through applications — verify they delegate to the underlying
// repository and don't accidentally swallow or transform values/errors.

type mockPathRepo struct {
	last [2]string
	out  *domain.Path
	err  error
}

func (m *mockPathRepo) Get(language, source string) (*domain.Path, error) {
	m.last = [2]string{language, source}
	return m.out, m.err
}

func TestPathApplication_Get(t *testing.T) {
	want := &domain.Path{UUID: "p1"}
	repo := &mockPathRepo{out: want}
	app := PathApplication{Repo: repo}
	got, err := app.Get("en", "es")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}
	if repo.last != [2]string{"en", "es"} {
		t.Fatalf("args lost: %v", repo.last)
	}

	repo.err = errors.New("nope")
	if _, err := app.Get("en", "es"); err == nil {
		t.Fatal("expected error")
	}
}

type mockStudyRecordRepo struct {
	getOut    []*domain.StudyRecord
	batchOut  []*domain.StudyRecord
	getErr    error
	batchErr  error
	batchArgs []*domain.StudyRecord
}

func (m *mockStudyRecordRepo) Get(uuid string) ([]*domain.StudyRecord, error) {
	return m.getOut, m.getErr
}
func (m *mockStudyRecordRepo) Batch(records []*domain.StudyRecord) ([]*domain.StudyRecord, error) {
	m.batchArgs = records
	return m.batchOut, m.batchErr
}

func TestStudyRecordApplication(t *testing.T) {
	repo := &mockStudyRecordRepo{
		getOut:   []*domain.StudyRecord{{UUID: "r1"}},
		batchOut: []*domain.StudyRecord{{UUID: "r2"}},
	}
	app := StudyRecordApplication{Repo: repo}

	got, err := app.Get("u")
	if err != nil || len(got) != 1 || got[0].UUID != "r1" {
		t.Fatalf("Get: %v %v", got, err)
	}

	in := []*domain.StudyRecord{{UUID: "r2"}}
	out, err := app.Batch(in)
	if err != nil || len(out) != 1 || repo.batchArgs == nil {
		t.Fatalf("Batch: %v %v", out, err)
	}
}

type mockRuleStatRepo struct{}

func (mockRuleStatRepo) Get(uuid string) ([]*domain.RuleStat, error) {
	return []*domain.RuleStat{{UUID: "rs1", UserUUID: uuid}}, nil
}
func (mockRuleStatRepo) Batch(s []*domain.RuleStat) ([]*domain.RuleStat, error) {
	return s, nil
}

func TestRuleStatApplication(t *testing.T) {
	app := RuleStatApplication{Repo: mockRuleStatRepo{}}
	got, _ := app.Get("u")
	if len(got) != 1 {
		t.Fatalf("Get: %v", got)
	}
	out, _ := app.Batch([]*domain.RuleStat{{UUID: "x"}})
	if len(out) != 1 {
		t.Fatalf("Batch: %v", out)
	}
}

func BenchmarkSubscriptionApplication_Consume(b *testing.B) {
	userRepo := newMockUserRepo()
	userRepo.users["u"] = &domain.User{UUID: "u", Email: "a@x.com"}
	userRepo.getByEmail["a@x.com"] = userRepo.users["u"]
	repo := &mockSubRepo{consume: func(string, int, string) (*domain.Subscription, error) {
		return &domain.Subscription{}, nil
	}}
	app := SubscriptionApplication{Repo: repo, UserRepo: userRepo}
	ctx := ctxWithEmail("a@x.com")
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if _, err := app.Consume(1, domain.TokenKindWriting, ctx); err != nil {
			b.Fatal(err)
		}
	}
}

// ---------- Listening ----------

type mockListeningRepo struct {
	out *domain.Listening
	err error
}

func (m *mockListeningRepo) Get(uuid, language string) (*domain.Listening, error) {
	return m.out, m.err
}

func TestListeningApplication_Get(t *testing.T) {
	want := &domain.Listening{TargetBase: domain.TargetBase{UUID: "L1"}, Title: "Test"}
	repo := &mockListeningRepo{out: want}
	app := ListeningApplication{Repo: repo}

	got, err := app.Get("L1", "es")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}

	repo.err = errors.New("not found")
	repo.out = nil
	if _, err := app.Get("x", "es"); err == nil {
		t.Fatal("expected error")
	}
}

func BenchmarkListeningApplication_Get(b *testing.B) {
	want := &domain.Listening{TargetBase: domain.TargetBase{UUID: "L1"}}
	repo := &mockListeningRepo{out: want}
	app := ListeningApplication{Repo: repo}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, _ = app.Get("L1", "es")
	}
}

// ---------- Reading ----------

type mockReadingRepo struct {
	out *domain.Reading
	err error
}

func (m *mockReadingRepo) Get(uuid, language string) (*domain.Reading, error) {
	return m.out, m.err
}

func TestReadingApplication_Get(t *testing.T) {
	want := &domain.Reading{TargetBase: domain.TargetBase{UUID: "R1"}, Title: "Read"}
	repo := &mockReadingRepo{out: want}
	app := ReadingApplication{Repo: repo}

	got, err := app.Get("R1", "es")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}

	repo.err = errors.New("not found")
	repo.out = nil
	if _, err := app.Get("x", "es"); err == nil {
		t.Fatal("expected error")
	}
}

func BenchmarkReadingApplication_Get(b *testing.B) {
	want := &domain.Reading{TargetBase: domain.TargetBase{UUID: "R1"}}
	repo := &mockReadingRepo{out: want}
	app := ReadingApplication{Repo: repo}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, _ = app.Get("R1", "es")
	}
}

// ---------- Speaking ----------

type mockSpeakingRepo struct {
	out *domain.Speaking
	err error
}

func (m *mockSpeakingRepo) Get(uuid, language string) (*domain.Speaking, error) {
	return m.out, m.err
}

func TestSpeakingApplication_Get(t *testing.T) {
	want := &domain.Speaking{TargetBase: domain.TargetBase{UUID: "SP1"}, Title: "Speak"}
	repo := &mockSpeakingRepo{out: want}
	app := SpeakingApplication{Repo: repo}

	got, err := app.Get("SP1", "es")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}

	repo.err = errors.New("not found")
	repo.out = nil
	if _, err := app.Get("x", "es"); err == nil {
		t.Fatal("expected error")
	}
}

func BenchmarkSpeakingApplication_Get(b *testing.B) {
	want := &domain.Speaking{TargetBase: domain.TargetBase{UUID: "SP1"}}
	repo := &mockSpeakingRepo{out: want}
	app := SpeakingApplication{Repo: repo}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, _ = app.Get("SP1", "es")
	}
}

// ---------- Writing ----------

type mockWritingRepo struct {
	out *domain.Writing
	err error
}

func (m *mockWritingRepo) Get(uuid, language string) (*domain.Writing, error) {
	return m.out, m.err
}

func TestWritingApplication_Get(t *testing.T) {
	want := &domain.Writing{TargetBase: domain.TargetBase{UUID: "W1"}, Title: "Write"}
	repo := &mockWritingRepo{out: want}
	app := WritingApplication{Repo: repo}

	got, err := app.Get("W1", "es")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}

	repo.err = errors.New("not found")
	repo.out = nil
	if _, err := app.Get("x", "es"); err == nil {
		t.Fatal("expected error")
	}
}

func BenchmarkWritingApplication_Get(b *testing.B) {
	want := &domain.Writing{TargetBase: domain.TargetBase{UUID: "W1"}}
	repo := &mockWritingRepo{out: want}
	app := WritingApplication{Repo: repo}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, _ = app.Get("W1", "es")
	}
}

// ---------- LearningSummary ----------

type mockLearningSummaryRepo struct {
	out *domain.LearningSummary
	err error
}

func (m *mockLearningSummaryRepo) Get(userUUID string) (*domain.LearningSummary, error) {
	return m.out, m.err
}

func (m *mockLearningSummaryRepo) GetVersion(userUUID string) (*time.Time, error) {
	return nil, m.err
}

func TestLearningSummaryApplication_Get(t *testing.T) {
	want := &domain.LearningSummary{UserUUID: "u1"}
	repo := &mockLearningSummaryRepo{out: want}
	app := LearningSummaryApplication{Repo: repo}

	got, err := app.Get("u1")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}

	repo.err = errors.New("db error")
	repo.out = nil
	if _, err := app.Get("u1"); err == nil {
		t.Fatal("expected error")
	}
}

func BenchmarkLearningSummaryApplication_Get(b *testing.B) {
	want := &domain.LearningSummary{UserUUID: "u1"}
	repo := &mockLearningSummaryRepo{out: want}
	app := LearningSummaryApplication{Repo: repo}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, _ = app.Get("u1")
	}
}

// ---------- UserStats ----------

type mockUserStatsRepo struct {
	out *domain.UserStats
	err error
}

func (m *mockUserStatsRepo) Get(userUUID string) (*domain.UserStats, error) {
	return m.out, m.err
}
func (m *mockUserStatsRepo) Upsert(userUUID string, durationHours float64, studyDate string) (*domain.UserStats, error) {
	return m.out, m.err
}

func TestUserStatsApplication_Get(t *testing.T) {
	want := &domain.UserStats{UserUUID: "u1", CurrentStreak: 7}
	repo := &mockUserStatsRepo{out: want}
	app := UserStatsApplication{Repo: repo}

	got, err := app.Get("u1")
	if err != nil || got != want {
		t.Fatalf("got=%v err=%v", got, err)
	}

	repo.err = errors.New("db error")
	repo.out = nil
	if _, err := app.Get("u1"); err == nil {
		t.Fatal("expected error")
	}
}

func BenchmarkUserStatsApplication_Get(b *testing.B) {
	want := &domain.UserStats{UserUUID: "u1", CurrentStreak: 7}
	repo := &mockUserStatsRepo{out: want}
	app := UserStatsApplication{Repo: repo}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, _ = app.Get("u1")
	}
}
