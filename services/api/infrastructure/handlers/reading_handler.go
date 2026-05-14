package handlers

import (
	"errors"
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

var (
	ErrReadingNotFound = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Reading not found: " + err.Error()),
			Status: fiber.StatusNotFound,
		}
	}
)

type ReadingHandler struct {
	App application.ReadingApplication
}

func (h *ReadingHandler) Get(ctx *fiber.Ctx) error {
	uuid := ctx.Params("uuid")
	language := ctx.Query("language")

	reading, err := h.App.Get(uuid, language)
	if err != nil {
		return server.NewErrResponse(ctx, ErrReadingNotFound(err))
	}

	return server.NewSuccessResponse(ctx, reading)
}
