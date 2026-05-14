package server

import (
	"github.com/gofiber/fiber/v2"
)

type ErrorResponse struct {
	Err    error
	Status int
}

func NewErrResponse(c *fiber.Ctx, err ErrorResponse) error {
	return c.Status(err.Status).JSON(fiber.Map{
		"error": true,
		"msg":   err.Err.Error(),
	})
}

func NewSuccessResponse(c *fiber.Ctx, data any) error {
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"error": false,
		"data":  data,
	})
}
