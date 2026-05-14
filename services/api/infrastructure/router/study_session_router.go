package router

import (
	"services/api/infrastructure/handlers"
	natsinfra "services/api/infrastructure/nats"

	"github.com/gofiber/fiber/v2"
)

func StudySessionRouter(group fiber.Router, publisher *natsinfra.StudySessionPublisher) {
	h := &handlers.StudySessionHandler{Publisher: publisher}
	group.Post("/", h.Create)
}
