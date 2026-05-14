package domain

import (
	"encoding/json"
	"time"
)

type LearningSummary struct {
	UserUUID     string          `json:"user_uuid"`
	StudyRecords json.RawMessage `json:"study_records"`
	HourlyStats  json.RawMessage `json:"hourly_stats"`
	RuleStats    json.RawMessage `json:"rule_stats"`
	Stats        json.RawMessage `json:"stats"`
	UpdatedAt    *string         `json:"updated_at,omitempty"`
}

type LearningSummaryRepository interface {
	Get(userUUID string) (*LearningSummary, error)
	GetVersion(userUUID string) (*time.Time, error)
}
