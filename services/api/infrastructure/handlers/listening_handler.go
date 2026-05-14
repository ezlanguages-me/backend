package handlers

import (
	"errors"
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

var (
	ErrListeningNotFound = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Listening not found: " + err.Error()),
			Status: fiber.StatusNotFound,
		}
	}
)

type ListeningHandler struct {
	App application.ListeningApplication
}

func (h *ListeningHandler) Get(ctx *fiber.Ctx) error {
	uuid := ctx.Params("uuid")
	language := ctx.Query("language")

	listening, err := h.App.Get(uuid, language)
	if err != nil {
		return server.NewErrResponse(ctx, ErrListeningNotFound(err))
	}

	return server.NewSuccessResponse(ctx, listening)
}
