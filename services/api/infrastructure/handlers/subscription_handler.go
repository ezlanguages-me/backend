package handlers

import (
	"errors"
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

type SubscriptionHandler struct {
	App application.SubscriptionApplication
}

type consumeTokenRequest struct {
	Amount int    `json:"amount"`
	Kind   string `json:"kind"`
}

func (h *SubscriptionHandler) GetMine(ctx *fiber.Ctx) error {
	sub, err := h.App.GetMine(ctx.UserContext())
	if err != nil {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    err,
			Status: fiber.StatusInternalServerError,
		})
	}
	return server.NewSuccessResponse(ctx, sub)
}

func (h *SubscriptionHandler) Consume(ctx *fiber.Ctx) error {
	var req consumeTokenRequest
	if err := ctx.BodyParser(&req); err != nil {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("Invalid request body"),
			Status: fiber.StatusBadRequest,
		})
	}
	if req.Amount == 0 {
		req.Amount = 1
	}

	sub, err := h.App.Consume(req.Amount, req.Kind, ctx.UserContext())
	if err != nil {
		status := fiber.StatusBadRequest
		if errors.Is(err, application.ErrUnauthorized) {
			status = fiber.StatusUnauthorized
		} else if errors.Is(err, application.ErrInsufficientTokens) {
			status = fiber.StatusPaymentRequired
		}
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    err,
			Status: status,
		})
	}
	return server.NewSuccessResponse(ctx, sub)
}
