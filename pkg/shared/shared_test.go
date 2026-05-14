package shared

import "testing"

func TestCoalesce(t *testing.T) {
	tests := []struct {
		name   string
		inputs []string
		want   string
	}{
		{"all empty", []string{"", "", ""}, ""},
		{"first non-empty", []string{"a", "b"}, "a"},
		{"skip leading empties", []string{"", "", "x"}, "x"},
		{"single non-empty", []string{"only"}, "only"},
		{"single empty", []string{""}, ""},
		{"no args", nil, ""},
		{"whitespace counts as non-empty", []string{"", " ", "x"}, " "},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Coalesce(tt.inputs...); got != tt.want {
				t.Fatalf("Coalesce(%v)=%q, want %q", tt.inputs, got, tt.want)
			}
		})
	}
}

func TestValidate_IsInitialised(t *testing.T) {
	if Validate == nil {
		t.Fatal("Validate must be a non-nil global validator")
	}
	// Smoke test that the singleton actually works for a struct with tags
	// from the domain package — proves it can be reused across services.
	type sample struct {
		Email string `validate:"required,email"`
	}
	if err := Validate.Struct(sample{Email: "a@b.com"}); err != nil {
		t.Fatalf("valid struct rejected: %v", err)
	}
	if err := Validate.Struct(sample{Email: "not-an-email"}); err == nil {
		t.Fatal("invalid struct accepted")
	}
}

func BenchmarkCoalesce_FirstHit(b *testing.B) {
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_ = Coalesce("a", "b", "c")
	}
}

func BenchmarkCoalesce_LastHit(b *testing.B) {
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_ = Coalesce("", "", "", "", "x")
	}
}
