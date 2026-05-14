package handlers

import (
	"log/slog"
	"pkg/domain"
	"pkg/server"
	natsinfra "services/api/infrastructure/nats"

	"github.com/gofiber/fiber/v2"
)

type StudySessionHandler struct {
	Publisher *natsinfra.StudySessionPublisher
}

func (ssh *StudySessionHandler) Create(ctx *fiber.Ctx) error {
	var session domain.StudySession
	if err := ctx.BodyParser(&session); err != nil {
		return err
	}

	if err := ssh.Publisher.PublishCreated(&session); err != nil {
		slog.Error("nats publish error", "err", err)
	}

	return server.NewSuccessResponse(ctx, session)
}
