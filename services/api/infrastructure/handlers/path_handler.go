package handlers

import (
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

var (
	ErrPathNotFound = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    err,
			Status: fiber.StatusNotFound,
		}
	}
)

type PathHandler struct {
	App application.PathApplication
}

func (ph *PathHandler) Get(ctx *fiber.Ctx) error {
	language, sourceLanguage := ctx.Query("language"), ctx.Query("source_language")

	path, err := ph.App.Get(language, sourceLanguage)
	if err != nil {
		return server.NewErrResponse(ctx, ErrPathNotFound(err))
	}

	return server.NewSuccessResponse(ctx, path)
}
