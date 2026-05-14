package application

import (
	"io"
	"net/http"
	"net/http/httptest"
	"net/url"
	"strings"
	"testing"
)

func TestStripJSONFences(t *testing.T) {
	tests := []struct {
		name string
		in   string
		want string
	}{
		{"json fences", "```json\n{\"a\":1}\n```", `{"a":1}`},
		{"plain fences", "```\n{\"b\":2}\n```", `{"b":2}`},
		{"whitespace only", "   {\"c\":3}   ", `{"c":3}`},
		{"inline fences", "```json{\"d\":4}```", `{"d":4}`},
		{"no fences", "plain text", "plain text"},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := stripJSONFences(tt.in); got != tt.want {
				t.Errorf("stripJSONFences(%q) = %q, want %q", tt.in, got, tt.want)
			}
		})
	}
}

func TestClampScore(t *testing.T) {
	cases := []struct {
		in   float64
		want int
	}{
		{0, 1}, {0.4, 1}, {0.6, 1}, {1, 1}, {1.5, 2}, {2, 2}, {2.4, 2}, {2.5, 3}, {3, 3}, {99, 3}, {-5, 1},
	}
	for _, c := range cases {
		if got := clampScore(c.in); got != c.want {
			t.Errorf("clampScore(%v) = %d want %d", c.in, got, c.want)
		}
	}
}

func TestSystemPromptForKind(t *testing.T) {
	if _, ok := systemPromptForKind("speaking"); !ok {
		t.Error("speaking should be supported")
	}
	if _, ok := systemPromptForKind("writing"); !ok {
		t.Error("writing should be supported")
	}
	if _, ok := systemPromptForKind("listening"); ok {
		t.Error("listening should NOT be supported")
	}
}

func TestStudentVerbForKind(t *testing.T) {
	if studentVerbForKind("speaking") != "said" {
		t.Error("speaking → said")
	}
	if studentVerbForKind("writing") != "wrote" {
		t.Error("writing → wrote")
	}
}

// rewritingTransport redirects every Gemini request to the test server while
// preserving the path/query so the production code can stay untouched.
type rewritingTransport struct {
	target string
	next   http.RoundTripper
}

func (t *rewritingTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	u, _ := url.Parse(t.target)
	req.URL.Scheme = u.Scheme
	req.URL.Host = u.Host
	req.Host = u.Host
	return t.next.RoundTrip(req)
}

func newAppWithServer(t *testing.T, handler http.HandlerFunc) (*AIApplication, *httptest.Server) {
	t.Helper()
	srv := httptest.NewServer(handler)
	t.Cleanup(srv.Close)
	app := NewAIApplication("test-key")
	app.HTTPClient = &http.Client{Transport: &rewritingTransport{target: srv.URL, next: http.DefaultTransport}}
	return app, srv
}

func validReq() EvaluateRequest {
	return EvaluateRequest{
		Kind:           "writing",
		Text:           "Hello, my name is Ana.",
		NativeLanguage: "es",
		TargetLanguage: "en",
		Scenario:       "Introduce yourself",
		Tasks:          []string{"Say your name", "Greet"},
	}
}

func TestEvaluate_Validation(t *testing.T) {
	a := NewAIApplication("k")
	cases := []struct {
		name    string
		mut     func(r *EvaluateRequest)
		errFrag string
	}{
		{"missing key", func(r *EvaluateRequest) {}, "GEMINI_API_KEY"},
		{"missing text", func(r *EvaluateRequest) { r.Text = "" }, "text is required"},
		{"missing native", func(r *EvaluateRequest) { r.NativeLanguage = "" }, "nativeLanguage"},
		{"missing target", func(r *EvaluateRequest) { r.TargetLanguage = "" }, "targetLanguage"},
		{"bad kind", func(r *EvaluateRequest) { r.Kind = "listening" }, "unsupported kind"},
	}
	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			r := validReq()
			c.mut(&r)
			app := a
			if c.name != "missing key" {
				app = NewAIApplication("k")
			} else {
				app = NewAIApplication("")
			}
			_, err := app.Evaluate(r)
			if err == nil || !strings.Contains(err.Error(), c.errFrag) {
				t.Fatalf("err=%v want substring %q", err, c.errFrag)
			}
		})
	}
}

func TestEvaluate_Success(t *testing.T) {
	app, _ := newAppWithServer(t, func(w http.ResponseWriter, r *http.Request) {
		body, _ := io.ReadAll(r.Body)
		// The user prompt must include the target language and the scenario.
		if !strings.Contains(string(body), "Introduce yourself") {
			t.Errorf("scenario missing from prompt: %s", body)
		}
		if !strings.Contains(string(body), "responseMimeType") {
			t.Errorf("response mime type missing")
		}
		w.Header().Set("Content-Type", "application/json")
		// Inner JSON wrapped in fences to exercise stripJSONFences.
		w.Write([]byte(`{"candidates":[{"content":{"parts":[{"text":"` + "```json\\n{\\\"feedback\\\":\\\"good job\\\",\\\"score\\\":2.6}\\n```" + `"}]}}]}`))
	})

	got, err := app.Evaluate(validReq())
	if err != nil {
		t.Fatalf("unexpected err: %v", err)
	}
	if got.Score != 3 { // 2.6 → rounded to 3
		t.Errorf("score=%d want 3", got.Score)
	}
	if got.Feedback != "good job" {
		t.Errorf("feedback=%q", got.Feedback)
	}
	if got.RawResponse == "" {
		t.Errorf("raw should be populated")
	}
}

func TestEvaluate_GeminiHTTPError(t *testing.T) {
	app, _ := newAppWithServer(t, func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(`internal`))
	})
	_, err := app.Evaluate(validReq())
	if err == nil || !strings.Contains(err.Error(), "gemini error 500") {
		t.Fatalf("err=%v", err)
	}
}

func TestEvaluate_NoCandidates(t *testing.T) {
	app, _ := newAppWithServer(t, func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`{"candidates":[]}`))
	})
	_, err := app.Evaluate(validReq())
	if err == nil || !strings.Contains(err.Error(), "no candidates") {
		t.Fatalf("err=%v", err)
	}
}

func TestEvaluate_BadInnerJSON(t *testing.T) {
	app, _ := newAppWithServer(t, func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`{"candidates":[{"content":{"parts":[{"text":"not json"}]}}]}`))
	})
	_, err := app.Evaluate(validReq())
	if err == nil || !strings.Contains(err.Error(), "decode gemini inner json") {
		t.Fatalf("err=%v", err)
	}
}

func TestEvaluate_EmptyTasksFallback(t *testing.T) {
	var captured string
	app, _ := newAppWithServer(t, func(w http.ResponseWriter, r *http.Request) {
		b, _ := io.ReadAll(r.Body)
		captured = string(b)
		w.Write([]byte(`{"candidates":[{"content":{"parts":[{"text":"{\"feedback\":\"ok\",\"score\":1}"}]}}]}`))
	})
	r := validReq()
	r.Tasks = nil
	r.Scenario = "" // exercise both fallbacks
	if _, err := app.Evaluate(r); err != nil {
		t.Fatalf("err=%v", err)
	}
	if !strings.Contains(captured, "no tasks specified") {
		t.Errorf("expected fallback tasks string in payload")
	}
	if !strings.Contains(captured, "no scenario provided") {
		t.Errorf("expected fallback scenario string in payload")
	}
}

func BenchmarkClampScore(b *testing.B) {
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_ = clampScore(2.4)
	}
}

func BenchmarkStripJSONFences(b *testing.B) {
	in := "```json\n{\"feedback\":\"ok\",\"score\":2}\n```"
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_ = stripJSONFences(in)
	}
}
