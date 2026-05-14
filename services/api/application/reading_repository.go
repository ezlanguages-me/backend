package application

import "pkg/domain"

type ReadingApplication struct {
	Repo domain.ReadingRepository
}

func (a *ReadingApplication) Get(uuid, language string) (*domain.Reading, error) {
	return a.Repo.Get(uuid, language)
}
