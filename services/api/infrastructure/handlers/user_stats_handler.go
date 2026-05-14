package handlers

import (
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

type UserStatsHandler struct {
	App application.UserStatsApplication
}

func (h *UserStatsHandler) Get(ctx *fiber.Ctx) error {
	userUUID := ctx.Query("uuid")
	stats, err := h.App.Get(userUUID)
	if err != nil {
		return err
	}
	return server.NewSuccessResponse(ctx, stats)
}
