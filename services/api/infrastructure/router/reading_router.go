package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func ReadingRouter(group fiber.Router, app application.ReadingApplication) {
	h := &handlers.ReadingHandler{App: app}

	group.Get("/:uuid", h.Get)
}
