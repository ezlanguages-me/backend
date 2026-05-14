package domain

import (
	"time"
)

type User struct {
	UUID                string          `json:"uuid" validate:"omitempty,uuid"`
	Name                string          `json:"name" validate:"required,min=3,max=100"`
	Email               string          `json:"email" validate:"required,email"`
	TimeZone            string          `json:"time_zone" validate:"omitempty,timezone"`
	Language            string          `json:"language" validate:"omitempty,bcp47_language_tag"`
	Age                 int             `json:"age" validate:"omitempty,gte=0,lte=120"`
	CreatedAt           time.Time       `json:"created_at" validate:"omitempty"`
	StudyRecords        []*StudyRecord  `json:"study_records" validate:"omitempty,dive"`
	RuleStats           []*RuleStat     `json:"rule_stats" validate:"omitempty,dive"`
	Sessions            []*StudySession `json:"sessions" validate:"omitempty,dive"`
	ProductivityProfile []*HourlyStat   `json:"productivity_profile" validate:"omitempty,dive"`
}

type UserRepository interface {
	Create(user *User) error
	Get(identifier string) (*User, error)
	Update(user *User) error
	Delete(uuid string) error
}
