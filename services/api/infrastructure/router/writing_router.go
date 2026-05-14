package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func WritingRouter(group fiber.Router, app application.WritingApplication) {
	h := &handlers.WritingHandler{App: app}

	group.Get("/:uuid", h.Get)
}
