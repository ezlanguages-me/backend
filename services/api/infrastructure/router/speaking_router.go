package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func SpeakingRouter(group fiber.Router, app application.SpeakingApplication) {
	h := &handlers.SpeakingHandler{App: app}

	group.Get("/:uuid", h.Get)
}
