package middleware

import (
	"errors"
	"pkg/server"

	"github.com/gofiber/fiber/v2"
)

// AuthMiddleware enforces the presence of the X-User-Email header. Same
// contract as the API service's middleware so the front can target both
// services with the same auth handling.
func AuthMiddleware(ctx *fiber.Ctx) error {
	email := ctx.Get("X-User-Email")

	if email == "" {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("Unauthorized: missing X-User-Email header"),
			Status: fiber.StatusUnauthorized,
		})
	}

	return ctx.Next()
}
