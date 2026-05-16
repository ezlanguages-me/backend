package server

import (
	"github.com/gofiber/fiber/v2"
)

var serviceVersion string

// SetVersion stores the version string injected at build time (-ldflags "-X main.version=…")
// so it can be included in the /health response.
func SetVersion(v string) {
	serviceVersion = v
}

func SetupRoutes(app *fiber.App) {
	app.Get("/health", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{
			"status":  "ok",
			"version": serviceVersion,
		})
	})
}
