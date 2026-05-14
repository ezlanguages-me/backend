package domain

type Pronunciation struct {
	uuid         string
	word         *Word
	languageCode string `validate:"omitempty,iso639_1"`
	phonetic     string
}

type WordMeaning struct {
	uuid         string
	languageCode string `validate:"omitempty,iso639_1"`
	entries      []*DefinitionEntry
}

type DefinitionEntry struct {
	uuid       string
	kind       string `validate:"omitempty,oneof=NOUN VERB ADJECTIVE ADVERB PRONOUN PREPOSITION CONJUNCTION INTERJECTION EXPRESSION"`
	definition string
	example    string
}

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
	uuid         string
	dialogue     *Dialogue
	lineOrder    int
	character    *DialogueCharacter
	text         string
	translations []*Meaning
	audioUrl     string
	relatedRule  *GrammarRule
}

type Meaning struct {
	uuid         string
	languageCode string `validate:"omitempty,iso639_1"`
	translation  string
}
