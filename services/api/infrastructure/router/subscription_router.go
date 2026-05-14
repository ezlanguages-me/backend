package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"
	"services/api/infrastructure/middleware"

	"github.com/gofiber/fiber/v2"
)

func SubscriptionRouter(group fiber.Router, app application.SubscriptionApplication) {
	h := &handlers.SubscriptionHandler{App: app}

	// Token consumption is owned by the AI service (which calls Gemini and
	// must atomically debit before paying). We deliberately do NOT expose
	// /consume publicly so a malicious client can't credit/debit on demand.
	group.Get("/me", middleware.AuthMiddleware, h.GetMine)
}
