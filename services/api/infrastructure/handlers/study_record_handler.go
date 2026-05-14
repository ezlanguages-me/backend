package handlers

import (
	"pkg/domain"
	"pkg/server"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

type StudyRecordHandler struct {
	App application.StudyRecordApplication
}

func (srh *StudyRecordHandler) Get(ctx *fiber.Ctx) error {
	userUUID := ctx.Query("uuid")
	record, err := srh.App.Get(userUUID)
	if err != nil {
		return err
	}
	return server.NewSuccessResponse(ctx, record)
}

func (srh *StudyRecordHandler) Batch(ctx *fiber.Ctx) error {
	var records []*domain.StudyRecord
	if err := ctx.BodyParser(&records); err != nil {
		return err
	}

	inserted, err := srh.App.Batch(records)
	if err != nil {
		return err
	}

	return server.NewSuccessResponse(ctx, inserted)
}
