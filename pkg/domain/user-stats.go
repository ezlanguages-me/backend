package domain

type UserStats struct {
	UUID              string  `json:"uuid"`
	UserUUID          string  `json:"user_uuid"`
	CurrentStreak     int     `json:"current_streak"`
	LongestStreak     int     `json:"longest_streak"`
	TotalHoursStudied float64 `json:"total_hours_studied"`
	TotalSessions     int     `json:"total_sessions"`
	LastStudyDate     *string `json:"last_study_date"`
	UpdatedAt         string  `json:"updated_at"`
}

type UserStatsRepository interface {
	Get(userUUID string) (*UserStats, error)
	Upsert(userUUID string, durationHours float64, studyDate string) (*UserStats, error)
}
