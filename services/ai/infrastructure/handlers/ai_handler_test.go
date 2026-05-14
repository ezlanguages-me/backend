package handlers

import (
	"errors"
	"io"
	"net/http"
	"net/http/httptest"
	"net/url"
	"pkg/domain"
	"services/ai/application"
	"strings"
	"testing"

	"github.com/gofiber/fiber/v2"
)

// ---------- mock billing service ----------

type mockBilling struct {
	emailToUUID func(string) (string, error)
	consume     func(string, int, string) (*domain.Subscription, error)
	refund      func(string, int, string) (*domain.Subscription, error)
}

func (m *mockBilling) EmailToUUID(email string) (string, error) {
	if m.emailToUUID != nil {
		return m.emailToUUID(email)
	}
	return "uuid-" + email, nil
}
func (m *mockBilling) Consume(u string, amount int, kind string) (*domain.Subscription, error) {
	if m.consume != nil {
		return m.consume(u, amount, kind)
	}
	return &domain.Subscription{}, nil
}
func (m *mockBilling) Refund(u string, amount int, kind string) (*domain.Subscription, error) {
	if m.refund != nil {
		return m.refund(u, amount, kind)
	}
	return &domain.Subscription{}, nil
}

type rewritingTransport struct {
	target string
	next   http.RoundTripper
}

func (t *rewritingTransport) RoundTrip(r *http.Request) (*http.Response, error) {
	u, _ := url.Parse(t.target)
	r.URL.Scheme = u.Scheme
	r.URL.Host = u.Host
	r.Host = u.Host
	return t.next.RoundTrip(r)
}

func newHandler(t *testing.T, geminiHandler http.HandlerFunc) (*fiber.App, *httptest.Server) {
	srv := httptest.NewServer(geminiHandler)
	t.Cleanup(srv.Close)
	app := application.NewAIApplication("k")
	app.HTTPClient = &http.Client{Transport: &rewritingTransport{target: srv.URL, next: http.DefaultTransport}}
	h := &AIHandler{App: app}
	f := fiber.New(fiber.Config{DisableStartupMessage: true})
	f.Post("/eval", h.Evaluate)
	return f, srv
}

func mustDo(t *testing.T, app *fiber.App, req *http.Request) (*http.Response, string) {
	t.Helper()
	resp, err := app.Test(req, -1)
	if err != nil {
		t.Fatal(err)
	}
	body, _ := io.ReadAll(resp.Body)
	return resp, string(body)
}

func TestAIHandler_Evaluate(t *testing.T) {
	t.Run("happy path", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {
			w.Write([]byte(`{"candidates":[{"content":{"parts":[{"text":"{\"feedback\":\"good\",\"score\":3}"}]}}]}`))
		})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(
			`{"kind":"writing","text":"hi","nativeLanguage":"es","targetLanguage":"en"}`))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, body := mustDo(t, f, req)
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"score":3`) {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})

	t.Run("invalid body", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader("garbage"))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, _ := mustDo(t, f, req)
		if resp.StatusCode != http.StatusBadRequest {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("missing kind/text → 400", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(
			`{"nativeLanguage":"es","targetLanguage":"en"}`))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, _ := mustDo(t, f, req)
		if resp.StatusCode != http.StatusBadRequest {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("missing languages → 400", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(
			`{"kind":"writing","text":"hi"}`))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, _ := mustDo(t, f, req)
		if resp.StatusCode != http.StatusBadRequest {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("upstream error → 502", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {
			w.WriteHeader(http.StatusInternalServerError)
		})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(
			`{"kind":"writing","text":"hi","nativeLanguage":"es","targetLanguage":"en"}`))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, _ := mustDo(t, f, req)
		if resp.StatusCode != http.StatusBadGateway {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("missing X-User-Email → 401", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(
			`{"kind":"writing","text":"hi","nativeLanguage":"es","targetLanguage":"en"}`))
		req.Header.Set("Content-Type", "application/json")
		resp, _ := mustDo(t, f, req)
		if resp.StatusCode != http.StatusUnauthorized {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("invalid kind → 400", func(t *testing.T) {
		f, _ := newHandler(t, func(w http.ResponseWriter, r *http.Request) {})
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(
			`{"kind":"music","text":"hi","nativeLanguage":"es","targetLanguage":"en"}`))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, _ := mustDo(t, f, req)
		if resp.StatusCode != http.StatusBadRequest {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})
}

// ---------- helpers for billing tests ----------

func newHandlerWithBilling(t *testing.T, geminiHandler http.HandlerFunc, billing BillingService) *fiber.App {
	t.Helper()
	srv := httptest.NewServer(geminiHandler)
	t.Cleanup(srv.Close)
	app := application.NewAIApplication("k")
	app.HTTPClient = &http.Client{Transport: &rewritingTransport{target: srv.URL, next: http.DefaultTransport}}
	h := &AIHandler{App: app, Billing: billing}
	f := fiber.New(fiber.Config{DisableStartupMessage: true})
	f.Post("/eval", h.Evaluate)
	return f
}

func evalReq(body string) *http.Request {
	req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(body))
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("X-User-Email", "u@x.com")
	return req
}

const goodBody = `{"kind":"writing","text":"hi","nativeLanguage":"es","targetLanguage":"en"}`

// ---------- billing-path tests ----------

func TestAIHandler_Evaluate_WithBilling(t *testing.T) {
	geminiOK := func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`{"candidates":[{"content":{"parts":[{"text":"{\"feedback\":\"ok\",\"score\":3}"}]}}]}`))
	}
	geminiErr := func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusInternalServerError)
	}

	t.Run("happy path consumes token and returns result", func(t *testing.T) {
		var consumed bool
		bill := &mockBilling{
			consume: func(string, int, string) (*domain.Subscription, error) {
				consumed = true
				return &domain.Subscription{}, nil
			},
		}
		f := newHandlerWithBilling(t, geminiOK, bill)
		resp, body := mustDo(t, f, evalReq(goodBody))
		if resp.StatusCode != http.StatusOK || !strings.Contains(body, `"feedback":"ok"`) {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
		if !consumed {
			t.Fatal("billing.Consume was not called")
		}
	})

	t.Run("EmailToUUID error returns 401", func(t *testing.T) {
		bill := &mockBilling{
			emailToUUID: func(string) (string, error) {
				return "", errors.New("not found")
			},
		}
		f := newHandlerWithBilling(t, geminiOK, bill)
		resp, _ := mustDo(t, f, evalReq(goodBody))
		if resp.StatusCode != http.StatusUnauthorized {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("insufficient tokens returns 402", func(t *testing.T) {
		bill := &mockBilling{
			consume: func(string, int, string) (*domain.Subscription, error) {
				return nil, domain.ErrInsufficientTokens
			},
		}
		f := newHandlerWithBilling(t, geminiOK, bill)
		resp, _ := mustDo(t, f, evalReq(goodBody))
		if resp.StatusCode != http.StatusPaymentRequired {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("consume error returns 500", func(t *testing.T) {
		bill := &mockBilling{
			consume: func(string, int, string) (*domain.Subscription, error) {
				return nil, errors.New("db error")
			},
		}
		f := newHandlerWithBilling(t, geminiOK, bill)
		resp, _ := mustDo(t, f, evalReq(goodBody))
		if resp.StatusCode != http.StatusInternalServerError {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("gemini error triggers refund and returns 502", func(t *testing.T) {
		var refunded bool
		bill := &mockBilling{
			refund: func(string, int, string) (*domain.Subscription, error) {
				refunded = true
				return &domain.Subscription{}, nil
			},
		}
		f := newHandlerWithBilling(t, geminiErr, bill)
		resp, _ := mustDo(t, f, evalReq(goodBody))
		if resp.StatusCode != http.StatusBadGateway {
			t.Fatalf("status=%d", resp.StatusCode)
		}
		if !refunded {
			t.Fatal("billing.Refund was not called after Gemini error")
		}
	})
}

func BenchmarkAIHandler_Evaluate_WithBilling(b *testing.B) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`{"candidates":[{"content":{"parts":[{"text":"{\"feedback\":\"ok\",\"score\":4}"}]}}]}`))
	}))
	b.Cleanup(srv.Close)
	app := application.NewAIApplication("k")
	app.HTTPClient = &http.Client{Transport: &rewritingTransport{target: srv.URL, next: http.DefaultTransport}}
	h := &AIHandler{App: app, Billing: &mockBilling{}}
	f := fiber.New(fiber.Config{DisableStartupMessage: true})
	f.Post("/eval", h.Evaluate)
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req := httptest.NewRequest(http.MethodPost, "/eval", strings.NewReader(goodBody))
		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("X-User-Email", "u@x.com")
		resp, err := f.Test(req, -1)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}
