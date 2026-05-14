package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func RuleStatRouter(group fiber.Router, app application.RuleStatApplication) {
	h := &handlers.RuleStatHandler{App: app}

	group.Get("/", h.Get)
	group.Patch("/", h.Batch)
}
