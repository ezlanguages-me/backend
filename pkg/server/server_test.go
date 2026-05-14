package server

import (
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/gofiber/fiber/v2"
)

func TestConfigServer_DefaultsWhenEnvUnset(t *testing.T) {
	t.Setenv("READ_TIMEOUT_SECONDS", "")
	t.Setenv("PREFORK", "")
	cfg := ConfigServer()
	// When the env var isn't a valid integer (empty included), the helper
	// should fall back to a 10s read timeout — losing this would silently
	// degrade slow-client behaviour in production.
	if cfg.ReadTimeout.Seconds() != 10 {
		t.Fatalf("ReadTimeout default broken: %v", cfg.ReadTimeout)
	}
	if cfg.Prefork {
		t.Fatal("Prefork should be off when PREFORK!=true")
	}
	if cfg.JSONEncoder == nil || cfg.JSONDecoder == nil {
		t.Fatal("JSON codecs must be wired (we rely on goccy/go-json)")
	}
}

func TestConfigServer_RespectsEnv(t *testing.T) {
	t.Setenv("READ_TIMEOUT_SECONDS", "42")
	t.Setenv("PREFORK", "true")
	cfg := ConfigServer()
	if cfg.ReadTimeout.Seconds() != 42 {
		t.Fatalf("ReadTimeout=%v, want 42s", cfg.ReadTimeout)
	}
	if !cfg.Prefork {
		t.Fatal("Prefork should be on")
	}
}

func TestConfigServer_InvalidEnvFallsBack(t *testing.T) {
	t.Setenv("READ_TIMEOUT_SECONDS", "not-a-number")
	cfg := ConfigServer()
	if cfg.ReadTimeout.Seconds() != 10 {
		t.Fatalf("ReadTimeout=%v, want default 10s on garbage env", cfg.ReadTimeout)
	}
}

func TestNewSuccessResponse(t *testing.T) {
	app := fiber.New()
	app.Get("/", func(c *fiber.Ctx) error {
		return NewSuccessResponse(c, fiber.Map{"hello": "world"})
	})
	req := httptest.NewRequest(http.MethodGet, "/", nil)
	resp, err := app.Test(req)
	if err != nil {
		t.Fatalf("app.Test: %v", err)
	}
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("status=%d, want 200", resp.StatusCode)
	}
	body := readBody(t, resp)
	if !strings.Contains(body, `"error":false`) || !strings.Contains(body, `"hello":"world"`) {
		t.Fatalf("body=%s", body)
	}
}

func TestNewErrResponse(t *testing.T) {
	app := fiber.New()
	app.Get("/", func(c *fiber.Ctx) error {
		return NewErrResponse(c, ErrorResponse{
			Err:    fiber.NewError(http.StatusTeapot, "boom"),
			Status: http.StatusTeapot,
		})
	})
	req := httptest.NewRequest(http.MethodGet, "/", nil)
	resp, err := app.Test(req)
	if err != nil {
		t.Fatalf("app.Test: %v", err)
	}
	if resp.StatusCode != http.StatusTeapot {
		t.Fatalf("status=%d, want 418", resp.StatusCode)
	}
	body := readBody(t, resp)
	if !strings.Contains(body, `"error":true`) || !strings.Contains(body, `boom`) {
		t.Fatalf("body=%s", body)
	}
}

func TestSetup_HealthEndpoint(t *testing.T) {
	t.Setenv("READ_TIMEOUT_SECONDS", "1")
	app := Setup()
	req := httptest.NewRequest(http.MethodGet, "/health", nil)
	resp, err := app.Test(req)
	if err != nil {
		t.Fatalf("app.Test: %v", err)
	}
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("/health status=%d, want 200", resp.StatusCode)
	}
}

func TestLoadEnvironmentVariables(t *testing.T) {
	// godotenv.Read() with no args looks for ".env" in CWD — chdir to a
	// temp dir so the test is hermetic and never picks up a developer's
	// local .env.
	dir := t.TempDir()
	if err := os.WriteFile(filepath.Join(dir, ".env"), []byte("HOST=localhost\nPORT=8080\nOPTIONAL=val\n"), 0o600); err != nil {
		t.Fatal(err)
	}
	cwd, _ := os.Getwd()
	t.Cleanup(func() { _ = os.Chdir(cwd) })
	if err := os.Chdir(dir); err != nil {
		t.Fatal(err)
	}

	type cfg struct {
		Host     string `env:"HOST" required:"true"`
		Port     string `env:"PORT"`
		Optional string `env:"OPTIONAL"`
		Missing  string `env:"NOT_SET"`
	}
	var c cfg
	if err := LoadEnvironmentVariables(&c); err != nil {
		t.Fatalf("unexpected: %v", err)
	}
	if c.Host != "localhost" || c.Port != "8080" || c.Optional != "val" {
		t.Fatalf("loaded wrong values: %+v", c)
	}
	if c.Missing != "" {
		t.Fatalf("Missing should stay zero, got %q", c.Missing)
	}
}

func TestLoadEnvironmentVariables_Errors(t *testing.T) {
	dir := t.TempDir()
	cwd, _ := os.Getwd()
	t.Cleanup(func() { _ = os.Chdir(cwd) })
	if err := os.Chdir(dir); err != nil {
		t.Fatal(err)
	}

	t.Run("missing .env file", func(t *testing.T) {
		var v struct{}
		if err := LoadEnvironmentVariables(&v); err == nil {
			t.Fatal("expected error when .env missing")
		}
	})

	if err := os.WriteFile(filepath.Join(dir, ".env"), []byte("X=1\n"), 0o600); err != nil {
		t.Fatal(err)
	}

	t.Run("non pointer rejected", func(t *testing.T) {
		var v struct{ X string }
		if err := LoadEnvironmentVariables(v); err == nil {
			t.Fatal("expected error for non-pointer")
		}
	})

	t.Run("pointer to non struct rejected", func(t *testing.T) {
		var s string
		if err := LoadEnvironmentVariables(&s); err == nil {
			t.Fatal("expected error for pointer to non struct")
		}
	})

	t.Run("missing required errors", func(t *testing.T) {
		type v struct {
			Y string `env:"Y" required:"true"`
		}
		var c v
		if err := LoadEnvironmentVariables(&c); err == nil {
			t.Fatal("expected error for missing required env var")
		}
	})

	t.Run("unsupported field type rejected", func(t *testing.T) {
		type v struct {
			N int `env:"X"`
		}
		var c v
		if err := LoadEnvironmentVariables(&c); err == nil {
			t.Fatal("expected error for unsupported field type")
		}
	})

	t.Run("falls back to uppercase field name", func(t *testing.T) {
		// .env contains X=1, so an untagged field named X should pick it up.
		type v struct {
			X string
		}
		var c v
		if err := LoadEnvironmentVariables(&c); err != nil {
			t.Fatalf("unexpected: %v", err)
		}
		if c.X != "1" {
			t.Fatalf("X=%q, want 1", c.X)
		}
	})
}

func BenchmarkNewSuccessResponse(b *testing.B) {
	app := fiber.New()
	app.Get("/", func(c *fiber.Ctx) error {
		return NewSuccessResponse(c, fiber.Map{"k": "v"})
	})
	req := httptest.NewRequest(http.MethodGet, "/", nil)
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

func BenchmarkConfigServer(b *testing.B) {
	b.Setenv("READ_TIMEOUT_SECONDS", "5")
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		_ = ConfigServer()
	}
}

func readBody(t *testing.T, resp *http.Response) string {
	t.Helper()
	defer resp.Body.Close()
	buf, _ := io.ReadAll(resp.Body)
	return string(buf)
}
