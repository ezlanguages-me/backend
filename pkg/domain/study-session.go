package domain

import "time"

type StudySession struct {
	UUID            string    `json:"uuid"`
	UserUUID        string    `json:"user_uuid"`
	StartAt         time.Time `json:"start_at"`
	EndAt           time.Time `json:"end_at"`
	TotalItems      int       `json:"total_items"`
	CorrectItems    int       `json:"correct_items"`
	AvgResponseTime float64   `json:"avg_response_time"`
	UserEnergyLevel int       `json:"user_energy_level"`
	ResponseTimes   []int32   `json:"response_times"`
}
