package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"
	"services/api/infrastructure/middleware"

	"github.com/gofiber/fiber/v2"
)

func UserStatsRouter(group fiber.Router, app application.UserStatsApplication) {
	h := &handlers.UserStatsHandler{App: app}

	group.Get("/", middleware.AuthMiddleware, h.Get)
}
