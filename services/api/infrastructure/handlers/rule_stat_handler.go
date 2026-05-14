package handlers

import (
	"pkg/domain"
	"pkg/server"
	"services/api/application"

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
	if err != nil {
		return err
	}

	return server.NewSuccessResponse(ctx, inserted)
}
