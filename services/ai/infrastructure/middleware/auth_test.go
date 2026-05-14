package middleware

import (
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/gofiber/fiber/v2"
)

func newApp() *fiber.App {
	app := fiber.New(fiber.Config{DisableStartupMessage: true})
	app.Use(AuthMiddleware)
	app.Get("/x", func(c *fiber.Ctx) error { return c.SendString("ok") })
	return app
}

func TestAuthMiddleware(t *testing.T) {
	t.Run("missing header → 401", func(t *testing.T) {
		resp, _ := newApp().Test(httptest.NewRequest(http.MethodGet, "/x", nil), -1)
		if resp.StatusCode != http.StatusUnauthorized {
			t.Fatalf("status=%d", resp.StatusCode)
		}
	})

	t.Run("valid header passes through", func(t *testing.T) {
		req := httptest.NewRequest(http.MethodGet, "/x", nil)
		req.Header.Set("X-User-Email", "a@x.com")
		resp, _ := newApp().Test(req, -1)
		body, _ := io.ReadAll(resp.Body)
		if resp.StatusCode != http.StatusOK || !strings.Contains(string(body), "ok") {
			t.Fatalf("status=%d body=%s", resp.StatusCode, body)
		}
	})
}

func BenchmarkAuthMiddleware(b *testing.B) {
	app := newApp()
	req := httptest.NewRequest(http.MethodGet, "/x", nil)
	req.Header.Set("X-User-Email", "a@x.com")
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_, _ = app.Test(req, -1)
	}
}
