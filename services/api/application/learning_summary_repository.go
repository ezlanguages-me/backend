package application

import (
	"pkg/domain"
	"time"
)

type LearningSummaryApplication struct {
	Repo domain.LearningSummaryRepository
}

func (a *LearningSummaryApplication) Get(userUUID string) (*domain.LearningSummary, error) {
	return a.Repo.Get(userUUID)
}

func (a *LearningSummaryApplication) GetVersion(userUUID string) (*time.Time, error) {
	return a.Repo.GetVersion(userUUID)
}
