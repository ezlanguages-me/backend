package application

import "pkg/domain"

type RuleStatApplication struct {
	Repo domain.RuleStatRepository
}

func (rsa *RuleStatApplication) Get(userUUID string) ([]*domain.RuleStat, error) {
	return rsa.Repo.Get(userUUID)
}

func (rsa *RuleStatApplication) Batch(stats []*domain.RuleStat) ([]*domain.RuleStat, error) {
	return rsa.Repo.Batch(stats)
}
