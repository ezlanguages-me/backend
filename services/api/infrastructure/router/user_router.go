package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"
	"services/api/infrastructure/middleware"

	"github.com/gofiber/fiber/v2"
)

func UserRouter(group fiber.Router, app application.UserApplication) {
	h := &handlers.UserHandler{App: app}

	group.Post("/", h.Create)
	group.Get("/", middleware.AuthMiddleware, h.Get)
	group.Put("/:id", middleware.AuthMiddleware, h.Update)
	group.Delete("/:id", middleware.AuthMiddleware, h.Delete)
}
