package router

import (
	"services/api/application"
	"services/api/infrastructure/handlers"

	"github.com/gofiber/fiber/v2"
)

func StudyRecordRouter(group fiber.Router, app application.StudyRecordApplication) {
	h := &handlers.StudyRecordHandler{App: app}

	group.Get("/", h.Get)
	group.Patch("/", h.Batch)
}
