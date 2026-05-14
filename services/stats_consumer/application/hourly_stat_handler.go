package application

import (
	"context"
	"fmt"
	"pkg/domain"
)

// HourlyStatUpserter is the subset of the hourly_stat repository the handler
// needs. Defined here so the application layer doesn't depend on concrete
// infrastructure types and can be unit-tested with simple fakes.
type HourlyStatUpserter interface {
	Upsert(ctx context.Context, stat *domain.HourlyStat) error
}

// UserStatsUpserter is the subset of the user_stats repository the handler needs.
type UserStatsUpserter interface {
	Upsert(ctx context.Context, userUUID string, durationHours float64, studyDate string) error
}

type StudySessionHandler struct {
	HourlyStatRepo HourlyStatUpserter
	UserStatsRepo  UserStatsUpserter
}

// Handle processes a study session event:
//   - accumulates hourly_stat for the session's hour
//   - updates user_stats (streak, hours, total sessions)
func (h *StudySessionHandler) Handle(ctx context.Context, session *domain.StudySession) error {
	var score float64
	if session.TotalItems > 0 {
		score = float64(session.CorrectItems) / float64(session.TotalItems) * 100
	}

	stat := &domain.HourlyStat{
		UserUUID:            session.UserUUID,
		Hour:                uint8(session.StartAt.UTC().Hour()),
		AverageScore:        score,
		AverageResponseTime: session.AvgResponseTime,
		AverageEnergyLevel:  float64(session.UserEnergyLevel),
	}

	if err := h.HourlyStatRepo.Upsert(ctx, stat); err != nil {
		return fmt.Errorf("upsert hourly_stat: %w", err)
	}

	var durationHours float64
	if !session.EndAt.IsZero() && session.EndAt.After(session.StartAt) {
		durationHours = session.EndAt.Sub(session.StartAt).Hours()
	}

	studyDate := session.StartAt.UTC().Format("2006-01-02")
	if err := h.UserStatsRepo.Upsert(ctx, session.UserUUID, durationHours, studyDate); err != nil {
		return fmt.Errorf("upsert user_stats: %w", err)
	}

	return nil
}
