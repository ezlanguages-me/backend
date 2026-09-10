package domain

type GrammarRule struct {
	uuid            string
	grammar         *Grammar
	title           string
	failureFeedback string
	usedIn          []ExerciseItem
}

type DialogueCharacter struct {
	uuid      string
	name      string
	avatarUrl string
}

type DialogueLine struct {
	uuid        string
	dialogue    *Dialogue
	lineOrder   int
	character   *DialogueCharacter
	text        string
	translations []*Meaning
	audioUrl    string
	relatedRule *GrammarRule
}

type Meaning struct {
	uuid         string
	languageCode string `validate:"omitempty,iso639_1"`
	translation  string
}
