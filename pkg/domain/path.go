package domain

import "encoding/json"

type Path struct {
	UUID           string          `json:"uuid"`
	Language       string          `json:"language"`
	SourceLanguage string          `json:"source_language"`
	Steps          json.RawMessage `json:"steps"`
}

type PathRepository interface {
	Get(language, sourceLanguage string) (*Path, error)
}
