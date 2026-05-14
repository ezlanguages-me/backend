package middleware

import (
	"context"
	"errors"
	"pkg/server"

	"github.com/gofiber/fiber/v2"
)

func AuthMiddleware(ctx *fiber.Ctx) error {
	email := ctx.Get("X-User-Email")

	if email == "" {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("Unauthorized: missing X-User-Email header"),
			Status: fiber.StatusUnauthorized,
		})
	}

	userCtx := context.WithValue(ctx.UserContext(), "email", email)
	ctx.SetUserContext(userCtx)

	return ctx.Next()
}
