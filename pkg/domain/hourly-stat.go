package domain

type HourlyStat struct {
	UUID                string  `json:"uuid"`
	UserUUID            string  `json:"user_uuid"`
	Hour                uint8   `json:"hour"`
	AverageScore        float64 `json:"average_score"`
	AverageResponseTime float64 `json:"average_response_time"`
	AverageEnergyLevel  float64 `json:"average_energy_level"`
	TotalSessions       uint16  `json:"total_sessions"`
	LastUpdated         string  `json:"last_updated"`
}
