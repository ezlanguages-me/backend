package domain

import (
	"fmt"

	"github.com/goccy/go-json"
)

type ExerciseItem interface {
	GetType() string
}

type BaseExercise struct {
	UID       string          `json:"uid"`
	Prompt    string          `json:"prompt"`
	Lesson    *ExerciseLesson `json:"lesson,omitempty"`
	Listening *Listening      `json:"listening,omitempty"`
	TimeStamp float64         `json:"time_stamp,omitempty"`
	TestRule  *GrammarRule    `json:"test_rule,omitempty"`
	Type      string          `json:"type"`
}

func (be *BaseExercise) GetType() string {
	return be.Type
}

type InputExercise struct {
	BaseExercise
	CorrectAnswers []string `json:"correct_answers"`
	CaseSensitive  bool     `json:"case_sensitive"`
}

type SelectionExercise struct {
	BaseExercise
	Options            []string `json:"options"`
	CorrectOptionIndex int      `json:"correct_option_index"`
}

type TrueFalseExercise struct {
	BaseExercise
	Statement string `json:"statement"`
	IsCorrect bool   `json:"is_correct"`
}

type ScrambleExercise struct {
	BaseExercise
	Chunks       []string `json:"chunks"`
	CorrectOrder []int    `json:"correct_order"`
}

func ExerciseFromJSON(data []byte) (ExerciseItem, error) {
	var meta struct {
		Type string `json:"type"`
	}

	if err := json.Unmarshal(data, &meta); err != nil {
		return nil, err
	}

	var exercise ExerciseItem

	switch meta.Type {
	case "input":
		exercise = &InputExercise{}
	case "selection":
		exercise = &SelectionExercise{}
	case "true_false":
		exercise = &TrueFalseExercise{}
	case "scramble":
		exercise = &ScrambleExercise{}
	default:
		return nil, fmt.Errorf("type not registered: %s", meta.Type)
	}

	if err := json.Unmarshal(data, exercise); err != nil {
		return nil, err
	}

	return exercise, nil
}
