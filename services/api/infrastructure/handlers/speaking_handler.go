package handlers

import (
	"errors"
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

var (
	ErrSpeakingNotFound = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Speaking not found: " + err.Error()),
			Status: fiber.StatusNotFound,
		}
	}
)

type SpeakingHandler struct {
	App application.SpeakingApplication
}

func (h *SpeakingHandler) Get(ctx *fiber.Ctx) error {
	uuid := ctx.Params("uuid")
	language := ctx.Query("language")

	speaking, err := h.App.Get(uuid, language)
	if err != nil {
		return server.NewErrResponse(ctx, ErrSpeakingNotFound(err))
	}

	return server.NewSuccessResponse(ctx, speaking)
}
