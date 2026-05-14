package domain

import (
	"time"
)

type StudyRecord struct {
	UUID        string    `json:"uuid" validate:"hexadecimal,omitempty"`
	UserUUID    string    `json:"user_uuid" validate:"hexadecimal"`
	TargetUUID  string    `json:"target_uuid" validate:"hexadecimal"`
	TargetType  string    `json:"target_type" validate:"required"`
	LastReview  time.Time `json:"last_review"`
	NextReview  time.Time `json:"next_review"`
	Stability   float32   `json:"stability"`
	Difficulty  float32   `json:"difficulty" validate:"gte=1.3,lte=10.0"`
	Repetitions uint16    `json:"repetitions"`
	Status      string    `json:"status" validate:"omitempty,oneof=NEW LEARNING REVIEW LAPSED"`
	LastScore   uint8     `json:"last_score" validate:"omitempty,gte=0,lte=100"`
	Mastery     float32   `json:"mastery" validate:"gte=0,lte=100"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type StudyRecordRepository interface {
	Get(userUUID string) ([]*StudyRecord, error)
	Batch(records []*StudyRecord) ([]*StudyRecord, error)
}
