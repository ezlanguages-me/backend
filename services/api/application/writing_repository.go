package application

import "pkg/domain"

type WritingApplication struct {
	Repo domain.WritingRepository
}

func (a *WritingApplication) Get(uuid, language string) (*domain.Writing, error) {
	return a.Repo.Get(uuid, language)
}
