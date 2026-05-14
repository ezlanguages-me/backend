package main

import (
	"context"
	"log/slog"
	"os"

	"pkg/billing"
	"services/ai/application"
	"services/ai/infrastructure/environment"
	"services/ai/infrastructure/persistence"
	"services/ai/infrastructure/router"

	"github.com/gofiber/fiber/v2"
)

func CreateContainer(app *fiber.App) func() {
	aiApp := application.NewAIApplication(environment.Env.GEMINI_API_KEY)

	pool, err := persistence.NewPool(context.Background())
	if err != nil {
		slog.Error("ai: failed to initialise postgres pool", "err", err)
		os.Exit(1)
	}
	bill := billing.NewRepository(pool)

	api := app.Group("/api/v1")
	aiGroup := api.Group("/ai")

	router.AIRouter(aiGroup, aiApp, bill)

	return func() { pool.Close() }
}
