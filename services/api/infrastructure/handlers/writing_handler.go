package handlers

import (
	"errors"
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

var (
	ErrWritingNotFound = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Writing not found: " + err.Error()),
			Status: fiber.StatusNotFound,
		}
	}
)

type WritingHandler struct {
	App application.WritingApplication
}

func (h *WritingHandler) Get(ctx *fiber.Ctx) error {
	uuid := ctx.Params("uuid")
	language := ctx.Query("language")

	writing, err := h.App.Get(uuid, language)
	if err != nil {
		return server.NewErrResponse(ctx, ErrWritingNotFound(err))
	}

	return server.NewSuccessResponse(ctx, writing)
}
