package domain

import "time"

// UserLanguage tracks a language the user knows, including their native tongue
// and any other languages used in polyglot mode.
type UserLanguage struct {
	UUID      string    `json:"uuid"`
	UserUUID  string    `json:"user_uuid"`
	Language  string    `json:"language" validate:"required,bcp47_language_tag"`
	CEFRLevel string    `json:"cefr_level" validate:"required,oneof=A0 A1 A2 B1 B2 C1 C2 native"`
	IsNative  bool      `json:"is_native"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

// UserPathSettings holds per-user, per-path configuration. When polyglot_enabled
// is true the system will present questions in all languages found in the user's
// UserLanguages list until the user's proficiency in the target language reaches
// PolyglotUntilCEFR.
type UserPathSettings struct {
	UUID               string    `json:"uuid"`
	UserUUID           string    `json:"user_uuid"`
	PathUUID           string    `json:"path_uuid"`
	PolyglotEnabled    bool      `json:"polyglot_enabled"`
	PolyglotUntilCEFR  string    `json:"polyglot_until_cefr,omitempty" validate:"omitempty,oneof=A0 A1 A2 B1 B2 C1 C2"`
	CreatedAt          time.Time `json:"created_at"`
	UpdatedAt          time.Time `json:"updated_at"`
}

type UserLanguageRepository interface {
	GetByUser(userUUID string) ([]*UserLanguage, error)
	Upsert(lang *UserLanguage) (*UserLanguage, error)
	Delete(userUUID, language string) error
}

type UserPathSettingsRepository interface {
	Get(userUUID, pathUUID string) (*UserPathSettings, error)
	Upsert(settings *UserPathSettings) (*UserPathSettings, error)
}
