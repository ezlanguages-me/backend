package domain

import (
	"encoding/json"
	"testing"
)

func TestExerciseFromJSON(t *testing.T) {
	tests := []struct {
		name    string
		payload string
		wantErr bool
		assert  func(t *testing.T, e ExerciseItem)
	}{
		{
			name:    "input exercise decodes fields",
			payload: `{"uid":"u1","prompt":"p","type":"input","correct_answers":["yes","si"],"case_sensitive":true}`,
			assert: func(t *testing.T, e ExerciseItem) {
				ie, ok := e.(*InputExercise)
				if !ok {
					t.Fatalf("want *InputExercise, got %T", e)
				}
				if ie.UID != "u1" || ie.Prompt != "p" || ie.GetType() != "input" {
					t.Fatalf("base fields wrong: %+v", ie)
				}
				if !ie.CaseSensitive || len(ie.CorrectAnswers) != 2 {
					t.Fatalf("specific fields wrong: %+v", ie)
				}
			},
		},
		{
			name:    "selection exercise",
			payload: `{"uid":"u","prompt":"p","type":"selection","options":["a","b","c"],"correct_option_index":2}`,
			assert: func(t *testing.T, e ExerciseItem) {
				se, ok := e.(*SelectionExercise)
				if !ok {
					t.Fatalf("want *SelectionExercise, got %T", e)
				}
				if se.CorrectOptionIndex != 2 || len(se.Options) != 3 {
					t.Fatalf("bad fields: %+v", se)
				}
			},
		},
		{
			name:    "true_false exercise",
			payload: `{"uid":"u","prompt":"p","type":"true_false","statement":"s","is_correct":true}`,
			assert: func(t *testing.T, e ExerciseItem) {
				tf, ok := e.(*TrueFalseExercise)
				if !ok {
					t.Fatalf("want *TrueFalseExercise, got %T", e)
				}
				if !tf.IsCorrect || tf.Statement != "s" {
					t.Fatalf("bad fields: %+v", tf)
				}
			},
		},
		{
			name:    "scramble exercise",
			payload: `{"uid":"u","prompt":"p","type":"scramble","chunks":["a","b"],"correct_order":[1,0]}`,
			assert: func(t *testing.T, e ExerciseItem) {
				sc, ok := e.(*ScrambleExercise)
				if !ok {
					t.Fatalf("want *ScrambleExercise, got %T", e)
				}
				if len(sc.Chunks) != 2 || len(sc.CorrectOrder) != 2 || sc.CorrectOrder[0] != 1 {
					t.Fatalf("bad fields: %+v", sc)
				}
			},
		},
		{
			name:    "unknown type errors",
			payload: `{"type":"unknown"}`,
			wantErr: true,
		},
		{
			name:    "invalid json errors",
			payload: `{not json`,
			wantErr: true,
		},
		{
			name:    "valid type but malformed payload errors",
			payload: `{"type":"input","correct_answers":"not-an-array"}`,
			wantErr: true,
		},
		{
			name:    "missing type field errors",
			payload: `{"uid":"u"}`,
			wantErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := ExerciseFromJSON([]byte(tt.payload))
			if tt.wantErr {
				if err == nil {
					t.Fatalf("expected error, got nil; result=%+v", got)
				}
				return
			}
			if err != nil {
				t.Fatalf("unexpected error: %v", err)
			}
			tt.assert(t, got)
		})
	}
}

func BenchmarkExerciseFromJSON_Input(b *testing.B) {
	payload := []byte(`{"uid":"u1","prompt":"p","type":"input","correct_answers":["yes","si","oui"],"case_sensitive":false}`)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if _, err := ExerciseFromJSON(payload); err != nil {
			b.Fatal(err)
		}
	}
}

func BenchmarkExerciseFromJSON_Scramble(b *testing.B) {
	payload := []byte(`{"uid":"u","prompt":"p","type":"scramble","chunks":["she","is","a","teacher"],"correct_order":[0,1,2,3]}`)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if _, err := ExerciseFromJSON(payload); err != nil {
			b.Fatal(err)
		}
	}
}

// Sanity test that the embedded BaseExercise is preserved when round-tripped.
func TestExerciseFromJSON_RoundTrip(t *testing.T) {
	orig := &SelectionExercise{
		BaseExercise: BaseExercise{
			UID:    "x",
			Prompt: "Pick one",
			Type:   "selection",
		},
		Options:            []string{"a", "b"},
		CorrectOptionIndex: 1,
	}
	raw, err := json.Marshal(orig)
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	got, err := ExerciseFromJSON(raw)
	if err != nil {
		t.Fatalf("decode: %v", err)
	}
	se := got.(*SelectionExercise)
	if se.UID != orig.UID || se.CorrectOptionIndex != orig.CorrectOptionIndex {
		t.Fatalf("round trip mismatch: %+v vs %+v", se, orig)
	}
}
