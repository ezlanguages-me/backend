package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func LearningSummaryRouter(group fiber.Router, app application.LearningSummaryApplication) {
	h := &handlers.LearningSummaryHandler{App: app}

	group.Get("/", h.Get)
	group.Get("/version", h.GetVersion)
}
