package application

import (
	"context"
	"errors"
	"math"
	"pkg/domain"
	"strings"
	"testing"
	"time"
)

type fakeHourlyRepo struct {
	calls []*domain.HourlyStat
	err   error
}

func (f *fakeHourlyRepo) Upsert(_ context.Context, s *domain.HourlyStat) error {
	f.calls = append(f.calls, s)
	return f.err
}

type fakeUserStatsRepo struct {
	calls []struct {
		userUUID string
		hours    float64
		date     string
	}
	err error
}

func (f *fakeUserStatsRepo) Upsert(_ context.Context, userUUID string, hours float64, date string) error {
	f.calls = append(f.calls, struct {
		userUUID string
		hours    float64
		date     string
	}{userUUID, hours, date})
	return f.err
}

func mustTime(t *testing.T, s string) time.Time {
	t.Helper()
	v, err := time.Parse(time.RFC3339, s)
	if err != nil {
		t.Fatal(err)
	}
	return v
}

func TestStudySessionHandler_Handle(t *testing.T) {
	tests := []struct {
		name           string
		session        domain.StudySession
		wantScore      float64
		wantHour       uint8
		wantHours      float64
		wantDate       string
		hourlyErr      error
		userStatsErr   error
		wantErrSubstr  string
		wantHourlyHits int
		wantUserHits   int
	}{
		{
			name: "happy path full session",
			session: domain.StudySession{
				UserUUID:        "u1",
				TotalItems:      10,
				CorrectItems:    7,
				StartAt:         mustTime(t, "2025-03-04T08:00:00Z"),
				EndAt:           mustTime(t, "2025-03-04T08:30:00Z"),
				AvgResponseTime: 1234,
				UserEnergyLevel: 8,
			},
			wantScore: 70, wantHour: 8, wantHours: 0.5, wantDate: "2025-03-04",
			wantHourlyHits: 1, wantUserHits: 1,
		},
		{
			name: "zero items yields zero score",
			session: domain.StudySession{
				UserUUID: "u2", StartAt: mustTime(t, "2025-03-04T05:00:00Z"),
				EndAt:           mustTime(t, "2025-03-04T05:10:00Z"),
				UserEnergyLevel: 3,
			},
			wantScore: 0, wantHour: 5, wantHours: 10.0 / 60.0, wantDate: "2025-03-04",
			wantHourlyHits: 1, wantUserHits: 1,
		},
		{
			name: "missing end_at means zero duration",
			session: domain.StudySession{
				UserUUID: "u3", TotalItems: 4, CorrectItems: 4,
				StartAt: mustTime(t, "2025-03-04T22:00:00Z"),
			},
			wantScore: 100, wantHour: 22, wantHours: 0, wantDate: "2025-03-04",
			wantHourlyHits: 1, wantUserHits: 1,
		},
		{
			name: "end before start is treated as zero",
			session: domain.StudySession{
				UserUUID: "u4", TotalItems: 1, CorrectItems: 0,
				StartAt: mustTime(t, "2025-03-04T10:00:00Z"),
				EndAt:   mustTime(t, "2025-03-04T09:00:00Z"),
			},
			wantScore: 0, wantHour: 10, wantHours: 0, wantDate: "2025-03-04",
			wantHourlyHits: 1, wantUserHits: 1,
		},
		{
			name: "hourly repo error short-circuits user_stats",
			session: domain.StudySession{
				UserUUID: "u5", TotalItems: 2, CorrectItems: 1,
				StartAt: mustTime(t, "2025-03-04T11:00:00Z"),
				EndAt:   mustTime(t, "2025-03-04T11:15:00Z"),
			},
			hourlyErr:      errors.New("db down"),
			wantErrSubstr:  "upsert hourly_stat",
			wantHourlyHits: 1, wantUserHits: 0,
		},
		{
			name: "user_stats error is reported",
			session: domain.StudySession{
				UserUUID: "u6", TotalItems: 2, CorrectItems: 2,
				StartAt: mustTime(t, "2025-03-04T11:00:00Z"),
				EndAt:   mustTime(t, "2025-03-04T11:30:00Z"),
			},
			userStatsErr:   errors.New("conflict"),
			wantErrSubstr:  "upsert user_stats",
			wantHourlyHits: 1, wantUserHits: 1,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			hr := &fakeHourlyRepo{err: tt.hourlyErr}
			us := &fakeUserStatsRepo{err: tt.userStatsErr}
			h := &StudySessionHandler{HourlyStatRepo: hr, UserStatsRepo: us}

			err := h.Handle(context.Background(), &tt.session)

			if tt.wantErrSubstr != "" {
				if err == nil || !strings.Contains(err.Error(), tt.wantErrSubstr) {
					t.Fatalf("err=%v, want substring %q", err, tt.wantErrSubstr)
				}
			} else if err != nil {
				t.Fatalf("unexpected err: %v", err)
			}

			if len(hr.calls) != tt.wantHourlyHits {
				t.Fatalf("hourly calls=%d want=%d", len(hr.calls), tt.wantHourlyHits)
			}
			if len(us.calls) != tt.wantUserHits {
				t.Fatalf("user_stats calls=%d want=%d", len(us.calls), tt.wantUserHits)
			}

			if tt.wantHourlyHits == 0 {
				return
			}
			if tt.wantErrSubstr != "" {
				return // value assertions skipped on error paths
			}
			got := hr.calls[0]
			if got.UserUUID != tt.session.UserUUID {
				t.Errorf("user uuid: got %q want %q", got.UserUUID, tt.session.UserUUID)
			}
			if got.Hour != tt.wantHour {
				t.Errorf("hour: got %d want %d", got.Hour, tt.wantHour)
			}
			if got.AverageScore != tt.wantScore {
				t.Errorf("score: got %v want %v", got.AverageScore, tt.wantScore)
			}
			if got.AverageResponseTime != tt.session.AvgResponseTime {
				t.Errorf("rt: got %v want %v", got.AverageResponseTime, tt.session.AvgResponseTime)
			}
			wantEnergy := float64(tt.session.UserEnergyLevel)
			if got.AverageEnergyLevel != wantEnergy {
				t.Errorf("energy: got %v want %v", got.AverageEnergyLevel, wantEnergy)
			}

			if tt.wantUserHits == 0 {
				return
			}
			ucall := us.calls[0]
			if ucall.userUUID != tt.session.UserUUID {
				t.Errorf("user_stats uuid: got %q", ucall.userUUID)
			}
			if math.Abs(ucall.hours-tt.wantHours) > 1e-9 {
				t.Errorf("hours: got %v want %v", ucall.hours, tt.wantHours)
			}
			if ucall.date != tt.wantDate {
				t.Errorf("date: got %q want %q", ucall.date, tt.wantDate)
			}
		})
	}
}

func BenchmarkStudySessionHandler_Handle(b *testing.B) {
	hr := &fakeHourlyRepo{}
	us := &fakeUserStatsRepo{}
	h := &StudySessionHandler{HourlyStatRepo: hr, UserStatsRepo: us}
	s := &domain.StudySession{
		UserUUID: "u", TotalItems: 10, CorrectItems: 8,
		StartAt: time.Date(2025, 3, 4, 8, 0, 0, 0, time.UTC),
		EndAt:   time.Date(2025, 3, 4, 8, 25, 0, 0, time.UTC),
	}
	ctx := context.Background()
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		hr.calls = hr.calls[:0]
		us.calls = us.calls[:0]
		_ = h.Handle(ctx, s)
	}
}
