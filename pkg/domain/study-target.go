package domain

import "encoding/json"

type StudyTarget interface {
	GetStepOrder() uint8
}

type TargetBase struct {
	UUID string `json:"uuid"`
}

func (tb *TargetBase) GetUUID() string {
	return tb.UUID
}

type Word struct {
	TargetBase
	Term           string           `json:"term"`
	IsRoot         bool             `json:"is_root"`
	SourceLanguage string           `json:"source_language"`
	Meaning        []*WordMeaning   `json:"meaning"`
	RootWord       *Word            `json:"root_word"`
	Inflections    []*Word          `json:"inflections"`
	InflectionType string           `json:"inflection_type"`
	Pronunciation  []*Pronunciation `json:"pronunciation"`
	AudioURL       string           `json:"audio_url"`
}

type Deck struct {
	TargetBase
	Path        *Path   `json:"path"`
	StepOrder   uint8   `json:"step_order"`
	Title       string  `json:"title"`
	Description string  `json:"description"`
	Words       []*Word `json:"words"`
}

type Grammar struct {
	TargetBase
	Path        *Path             `json:"path"`
	StepOrder   uint8             `json:"step_order"`
	Title       string            `json:"title"`
	Content     string            `json:"content"`
	Rules       []*GrammarRule    `json:"rules"`
	PracticedIn []*ExerciseLesson `json:"practiced_in"`
}

type ExerciseLesson struct {
	TargetBase
	Path           *Path          `json:"path"`
	StepOrder      uint8          `json:"step_order"`
	Title          string         `json:"title"`
	Items          []ExerciseItem `json:"items"`
	RelatedGrammar *Grammar       `json:"related_grammar"`
}

type Listening struct {
	TargetBase
	Path           *Path          `json:"path"`
	StepOrder      uint8          `json:"step_order"`
	SourceLanguage string         `json:"source_language"`
	Type           string         `json:"type"`
	Category       string         `json:"category"`
	Title          string         `json:"title"`
	Description    string         `json:"description"`
	AudioURL       string         `json:"audio_url"`
	Transcript     string         `json:"transcript"`
	Questions      []ExerciseItem `json:"questions"`
}

type Writing struct {
	TargetBase
	Path           *Path           `json:"path"`
	StepOrder      uint8           `json:"step_order"`
	SourceLanguage string          `json:"source_language"`
	Type           string          `json:"type"`
	Category       string          `json:"category"`
	Title          string          `json:"title"`
	Description    string          `json:"description"`
	Prompt         json.RawMessage `json:"prompt"`
}

type Speaking struct {
	TargetBase
	Path           *Path           `json:"path"`
	StepOrder      uint8           `json:"step_order"`
	SourceLanguage string          `json:"source_language"`
	Type           string          `json:"type"`
	Category       string          `json:"category"`
	Title          string          `json:"title"`
	Description    string          `json:"description"`
	Prompt         json.RawMessage `json:"prompt"`
}

type Reading struct {
	TargetBase
	Path           *Path  `json:"path"`
	StepOrder      uint8  `json:"step_order"`
	SourceLanguage string `json:"source_language"`
	Type           string `json:"type"`
	Category       string `json:"category"`
	Title          string `json:"title"`
	Description    string `json:"description"`
	Content        string `json:"content"`
}

type ListeningRepository interface {
	Get(uuid, language string) (*Listening, error)
}

type WritingRepository interface {
	Get(uuid, language string) (*Writing, error)
}

type SpeakingRepository interface {
	Get(uuid, language string) (*Speaking, error)
}

type ReadingRepository interface {
	Get(uuid, language string) (*Reading, error)
}

type Dialogue struct {
	TargetBase
	Path        *Path                `json:"path"`
	StepOrder   uint8                `json:"step_order"`
	Title       string               `json:"title"`
	Description string               `json:"description"`
	Characters  []*DialogueCharacter `json:"characters"`
	Lines       []*DialogueLine      `json:"lines"`
}
