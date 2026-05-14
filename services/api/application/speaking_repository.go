package application

import "pkg/domain"

type SpeakingApplication struct {
	Repo domain.SpeakingRepository
}

func (a *SpeakingApplication) Get(uuid, language string) (*domain.Speaking, error) {
	return a.Repo.Get(uuid, language)
}
