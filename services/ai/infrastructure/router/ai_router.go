package router

import (
	"pkg/billing"
	"services/ai/application"
	"services/ai/infrastructure/handlers"
	"services/ai/infrastructure/middleware"

	"github.com/gofiber/fiber/v2"
)

func AIRouter(group fiber.Router, app *application.AIApplication, bill *billing.Repository) {
	h := &handlers.AIHandler{App: app, Billing: bill}

	group.Post("/evaluate", middleware.AuthMiddleware, h.Evaluate)
}
