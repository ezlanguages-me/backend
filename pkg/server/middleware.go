package server

import (
	"log"
	"log/slog"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/gofiber/fiber/v2/middleware/favicon"
	"github.com/gofiber/fiber/v2/middleware/healthcheck"
	"github.com/gofiber/fiber/v2/middleware/helmet"
	"github.com/gofiber/fiber/v2/middleware/logger"
)

func AddFiberMiddleware(app *fiber.App) {
	app.Use(
		cors.New(),
		logger.New(),
		healthcheck.New(healthcheck.Config{
			LivenessProbe: func(c *fiber.Ctx) bool {
				return true
			},
			LivenessEndpoint: "/health",
		}),
		helmet.New(),
		favicon.New(),
	)
}

// ConfigureLogging sets up error logging to file and request logging to stdout
func ConfigureLogging(app *fiber.App, errorLogPath string) (func(), error) {
	// Setup error log file
	// #nosec G304 -- errorLogPath is controlled by the application
	errorLogFile, err := os.OpenFile(errorLogPath, os.O_RDWR|os.O_CREATE|os.O_APPEND, 0600)
	if err != nil {
		return nil, err
	}

	// Set standard logger to write to error file
	log.SetOutput(errorLogFile)

	// Request logger only to stdout (console)
	app.Use(
		logger.New(
			logger.Config{
				Output: os.Stdout,
				Format: "${time} | ${status} | ${latency} | ${method} | ${path}\n",
			}),
	)

	// Return cleanup function
	return func() {
		if err := errorLogFile.Close(); err != nil {
			slog.Error("closing log file", "err", err)
		}
	}, nil
}
