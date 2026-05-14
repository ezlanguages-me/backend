package application

import "pkg/domain"

type ListeningApplication struct {
	Repo domain.ListeningRepository
}

func (a *ListeningApplication) Get(uuid, language string) (*domain.Listening, error) {
	return a.Repo.Get(uuid, language)
}
