package middleware

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/gofiber/fiber/v2"
)

func TestAuthMiddleware_RejectsMissingHeader(t *testing.T) {
	app := fiber.New()
	app.Use(AuthMiddleware)
	app.Get("/x", func(c *fiber.Ctx) error { return c.SendString("ok") })

	req := httptest.NewRequest(http.MethodGet, "/x", nil)
	resp, err := app.Test(req)
	if err != nil {
		t.Fatal(err)
	}
	if resp.StatusCode != http.StatusUnauthorized {
		t.Fatalf("status=%d, want 401", resp.StatusCode)
	}
}

func TestAuthMiddleware_PropagatesEmail(t *testing.T) {
	app := fiber.New()
	app.Use(AuthMiddleware)
	app.Get("/who", func(c *fiber.Ctx) error {
		v, _ := c.UserContext().Value("email").(string)
		return c.SendString(v)
	})

	req := httptest.NewRequest(http.MethodGet, "/who", nil)
	req.Header.Set("X-User-Email", "alice@x.com")
	resp, err := app.Test(req)
	if err != nil {
		t.Fatal(err)
	}
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("status=%d", resp.StatusCode)
	}
	body := readAll(t, resp)
	if !strings.Contains(body, "alice@x.com") {
		t.Fatalf("body=%q", body)
	}
}

func BenchmarkAuthMiddleware(b *testing.B) {
	app := fiber.New()
	app.Use(AuthMiddleware)
	app.Get("/who", func(c *fiber.Ctx) error { return c.SendString("ok") })
	req := httptest.NewRequest(http.MethodGet, "/who", nil)
	req.Header.Set("X-User-Email", "a@x.com")
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		resp, err := app.Test(req)
		if err != nil {
			b.Fatal(err)
		}
		_ = resp.Body.Close()
	}
}

func readAll(t *testing.T, resp *http.Response) string {
	t.Helper()
	defer resp.Body.Close()
	buf := make([]byte, 0, 256)
	tmp := make([]byte, 256)
	for {
		n, err := resp.Body.Read(tmp)
		buf = append(buf, tmp[:n]...)
		if err != nil {
			break
		}
	}
	return string(buf)
}
