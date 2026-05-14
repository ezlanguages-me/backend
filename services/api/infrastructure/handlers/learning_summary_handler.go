package handlers

import (
	"pkg/server"
	"services/api/application"
	"time"

	"github.com/gofiber/fiber/v2"
)

type LearningSummaryHandler struct {
	App application.LearningSummaryApplication
}

func (h *LearningSummaryHandler) Get(ctx *fiber.Ctx) error {
	userUUID := ctx.Query("uuid")
	summary, err := h.App.Get(userUUID)
	if err != nil {
		return err
	}
	return server.NewSuccessResponse(ctx, summary)
}

type learningSummaryVersion struct {
	UpdatedAt *string `json:"updated_at"`
}

func (h *LearningSummaryHandler) GetVersion(ctx *fiber.Ctx) error {
	userUUID := ctx.Query("uuid")
	updatedAt, err := h.App.GetVersion(userUUID)
	if err != nil {
		return err
	}
	var v learningSummaryVersion
	if updatedAt != nil {
		str := updatedAt.UTC().Format(time.RFC3339Nano)
		v.UpdatedAt = &str
	}
	return server.NewSuccessResponse(ctx, v)
}
