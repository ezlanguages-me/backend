package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func ListeningRouter(group fiber.Router, app application.ListeningApplication) {
	h := &handlers.ListeningHandler{App: app}

	group.Get("/:uuid", h.Get)
}
