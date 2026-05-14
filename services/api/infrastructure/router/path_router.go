package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func PathRouter(group fiber.Router, app application.PathApplication) {
	h := &handlers.PathHandler{App: app}

	group.Get("/", h.Get)
}
