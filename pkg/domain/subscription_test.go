package domain

import "testing"

func TestSubscription_TokensRemaining(t *testing.T) {
	tests := []struct {
		name  string
		limit int
		used  int
		want  int
	}{
		{"fresh subscription", 60, 0, 60},
		{"partially consumed", 60, 25, 35},
		{"exactly at limit", 60, 60, 0},
		{"over consumed clamps to zero", 60, 75, 0},
		{"zero limit", 0, 0, 0},
		{"zero limit overspent", 0, 10, 0},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := &Subscription{MonthlyTokenLimit: tt.limit, TokensUsed: tt.used}
			if got := s.TokensRemaining(); got != tt.want {
				t.Fatalf("TokensRemaining()=%d, want %d", got, tt.want)
			}
		})
	}
}

func TestPlanConstants(t *testing.T) {
	// Lock the wire format of the public constants — changing them silently
	// would break clients and analytics pipelines.
	if PlanFree != "free" {
		t.Errorf("PlanFree changed: %q", PlanFree)
	}
	if TokenKindWriting != "writing" {
		t.Errorf("TokenKindWriting changed: %q", TokenKindWriting)
	}
	if TokenKindSpeaking != "speaking" {
		t.Errorf("TokenKindSpeaking changed: %q", TokenKindSpeaking)
	}
	if DefaultMonthlyTokenLimit != 60 {
		t.Errorf("DefaultMonthlyTokenLimit changed: %d", DefaultMonthlyTokenLimit)
	}
}

func BenchmarkSubscription_TokensRemaining(b *testing.B) {
	s := &Subscription{MonthlyTokenLimit: 60, TokensUsed: 17}
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_ = s.TokensRemaining()
	}
}
