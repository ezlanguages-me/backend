package handlers

import (
	"errors"
	"pkg/domain"
	"pkg/server"
	"services/api/application"
	"services/api/infrastructure/persistence/postgres"

	"github.com/gofiber/fiber/v2"
)

type RuleStatHandler struct {
	App application.RuleStatApplication
}

func (rsh *RuleStatHandler) Get(ctx *fiber.Ctx) error {
	userUUID := ctx.Query("uuid")
	stats, err := rsh.App.Get(userUUID)
	if err != nil {
		return err
	}
	return server.NewSuccessResponse(ctx, stats)
}

func (rsh *RuleStatHandler) Batch(ctx *fiber.Ctx) error {
	var stats []*domain.RuleStat
	if err := ctx.BodyParser(&stats); err != nil {
		return err
	}

	inserted, err := rsh.App.Batch(stats)
	// Surface orphan grammar_rule_uuid values (typical after a DB reset wiped
	// the rows but the client's persisted path cache still references them)
	// as a 422 so the frontend can drop its stale cache and refetch.
	if errors.Is(err, postgres.ErrOrphanGrammarRule) {
		return server.NewErrResponse(ctx, server.ErrorResponse{
			Err:    errors.New("One or more grammar_rule_uuid values do not exist on the server. Refresh the path and retry."),
			Status: fiber.StatusUnprocessableEntity,
		})
	}
	if err != nil {
		return err
	}

	return server.NewSuccessResponse(ctx, inserted)
}
