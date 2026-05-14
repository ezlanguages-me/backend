package domain

import (
	"time"
)

type RuleStat struct {
	UUID            string    `json:"uuid"`
	UserUUID        string    `json:"user_uuid"`
	GrammarRuleUUID string    `json:"grammar_rule_uuid"`
	CorrectCount    uint32    `json:"correct_count"`
	IncorrectCount  uint32    `json:"incorrect_count"`
	LastMistake     time.Time `json:"last_mistake"`
	Proficiency     float32   `json:"proficiency"`
	CreatedAt       time.Time `json:"created_at"`
	UpdatedAt       time.Time `json:"updated_at"`
}

type RuleStatRepository interface {
	Get(userUUID string) ([]*RuleStat, error)
	Batch(stats []*RuleStat) ([]*RuleStat, error)
}
