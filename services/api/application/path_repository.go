package application

import "pkg/domain"

type PathApplication struct {
	Repo domain.PathRepository
}

func (pa *PathApplication) Get(language, sourceLanguage string) (*domain.Path, error) {
	return pa.Repo.Get(language, sourceLanguage)
}
