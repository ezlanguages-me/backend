package handlers

import (
	"errors"
	"log/slog"

	"pkg/domain"
	"pkg/server"
	"services/ai/application"

	"github.com/gofiber/fiber/v2"
)

// BillingService is the subset of billing.Repository consumed by AIHandler.
// Using an interface instead of the concrete struct lets tests inject a fake
// without a live database while keeping the production wiring unchanged
// (billing.Repository satisfies this interface automatically).
type BillingService interface {
	EmailToUUID(email string) (string, error)
	Consume(userUUID string, amount int, kind string) (*domain.Subscription, error)
	Refund(userUUID string, amount int, kind string) (*domain.Subscription, error)
}

// AIHandler exposes the /evaluate endpoint. It owns the token lifecycle:
// debit before the Gemini call, refund if the upstream call fails. This is
// the only place in the system that decrements user tokens — the api
// service's /subscriptions/consume route was deliberately removed.
type AIHandler struct {
	App     *application.AIApplication
	Billing BillingService
}

type evaluateRequest struct {
	Kind           string   `json:"kind"`
	Text           string   `json:"text"`
	NativeLanguage string   `json:"nativeLanguage"`
	TargetLanguage string   `json:"targetLanguage"`
	Scenario       string   `json:"scenario"`
	Tasks          []string `json:"tasks"`
}

func (h *AIHandler) Evaluate(ctx *fiber.Ctx) error {
	var req evaluateRequest
	if err := ctx.BodyParser(&req); err != nil {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("invalid request body: " + err.Error()),
			Status: fiber.StatusBadRequest,
		})
	}

	if req.Kind == "" || req.Text == "" {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("kind and text are required"),
			Status: fiber.StatusBadRequest,
		})
	}
	if req.NativeLanguage == "" || req.TargetLanguage == "" {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("nativeLanguage and targetLanguage are required"),
			Status: fiber.StatusBadRequest,
		})
	}
	if req.Kind != domain.TokenKindWriting && req.Kind != domain.TokenKindSpeaking {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("Invalid token kind"),
			Status: fiber.StatusBadRequest,
		})
	}

	// Resolve the user. The auth middleware guarantees the email header is
	// non-empty; we still check defensively before touching the DB.
	email := ctx.Get("X-User-Email")
	if email == "" {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("Unauthorized: missing X-User-Email header"),
			Status: fiber.StatusUnauthorized,
		})
	}

	// Skip the billing path entirely if no Repository is wired (tests).
	// Production always wires one in container.go.
	if h.Billing != nil {
		userUUID, err := h.Billing.EmailToUUID(email)
		if err != nil {
			return server.NewErrResponse(ctx, server.ErrorResponse{
				Err:    errors.New("user not found"),
				Status: fiber.StatusUnauthorized,
			})
		}

		// Consume BEFORE calling Gemini so a failure to debit (limit reached,
		// DB error) doesn't burn an upstream call.
		if _, err := h.Billing.Consume(userUUID, 1, req.Kind); err != nil {
			if errors.Is(err, domain.ErrInsufficientTokens) {
				return server.NewErrResponse(ctx, server.ErrorResponse{
					Err:    err,
					Status: fiber.StatusPaymentRequired,
				})
			}
			return server.NewErrResponse(ctx, server.ErrorResponse{
				Err:    errors.New("failed to consume token: " + err.Error()),
				Status: fiber.StatusInternalServerError,
			})
		}

		feedback, err := h.App.Evaluate(application.EvaluateRequest{
			Kind:           req.Kind,
			Text:           req.Text,
			NativeLanguage: req.NativeLanguage,
			TargetLanguage: req.TargetLanguage,
			Scenario:       req.Scenario,
			Tasks:          req.Tasks,
		})
		if err != nil {
			// Best-effort refund. We log refund failures but still surface
			// the original Gemini error to the caller.
			if _, refundErr := h.Billing.Refund(userUUID, 1, req.Kind); refundErr != nil {
				slog.Error("ai: refund failed", "user", userUUID, "err", refundErr)
			}
			return server.NewErrResponse(ctx, server.ErrorResponse{
				Err:    errors.New("AI evaluation failed: " + err.Error()),
				Status: fiber.StatusBadGateway,
			})
		}
		return server.NewSuccessResponse(ctx, feedback)
	}

	feedback, err := h.App.Evaluate(application.EvaluateRequest{
		Kind:           req.Kind,
		Text:           req.Text,
		NativeLanguage: req.NativeLanguage,
		TargetLanguage: req.TargetLanguage,
		Scenario:       req.Scenario,
		Tasks:          req.Tasks,
	})
	if err != nil {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("AI evaluation failed: " + err.Error()),
			Status: fiber.StatusBadGateway,
		})
	}
	return server.NewSuccessResponse(ctx, feedback)
}
