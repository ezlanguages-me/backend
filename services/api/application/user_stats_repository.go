package application

import "pkg/domain"

type UserStatsApplication struct {
	Repo domain.UserStatsRepository
}

func (a *UserStatsApplication) Get(userUUID string) (*domain.UserStats, error) {
	return a.Repo.Get(userUUID)
}
