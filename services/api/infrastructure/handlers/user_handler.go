package handlers

import (
	"errors"

	"pkg/domain"
	"pkg/server"
	"pkg/shared"
	"services/api/application"

	"github.com/gofiber/fiber/v2"
)

var (
	ErrInvalidRequestBody = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Bad body: " + err.Error()),
			Status: fiber.StatusBadRequest,
		}
	}
	ErrInvalidUserData = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Invalid user data: " + err.Error()),
			Status: fiber.StatusBadRequest,
		}
	}
	ErrCreatingUser = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Error creating user: " + err.Error()),
			Status: fiber.StatusInternalServerError,
		}
	}
	ErrMissingIdentifier = server.ErrorResponse{
		Err:    errors.New("missing identifier: id or email required"),
		Status: fiber.StatusBadRequest,
	}
	ErrUserNotFound = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("User not found: " + err.Error()),
			Status: fiber.StatusNotFound,
		}
	}
	ErrUpdatingUser = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Error updating user: " + err.Error()),
			Status: fiber.StatusInternalServerError,
		}
	}
	ErrDeletingUser = func(err error) server.ErrorResponse {
		return server.ErrorResponse{
			Err:    errors.New("Error deleting user: " + err.Error()),
			Status: fiber.StatusInternalServerError,
		}
	}
)

type UserHandler struct {
	App application.UserApplication
}

func (uh *UserHandler) Create(ctx *fiber.Ctx) error {
	var user *domain.User
	if err := ctx.BodyParser(&user); err != nil {
		return server.NewErrResponse(ctx, ErrInvalidRequestBody(err))
	}

	err := shared.Validate.Struct(user)
	if err != nil {
		return server.NewErrResponse(ctx, ErrInvalidUserData(err))
	}

	if err := uh.App.Create(user); err != nil {
		return server.NewErrResponse(ctx, ErrCreatingUser(err))
	}

	return server.NewSuccessResponse(ctx, user)
}

func (uh *UserHandler) Get(ctx *fiber.Ctx) error {
	identifier := shared.Coalesce(ctx.Query("id"), ctx.Query("email"))
	if identifier == "" {
		return server.NewErrResponse(ctx, ErrMissingIdentifier)
	}

	user, err := uh.App.Get(identifier, ctx.UserContext())
	if err != nil {
		return server.NewErrResponse(ctx, ErrUserNotFound(err))
	}

	return server.NewSuccessResponse(ctx, user)
}

func (uh *UserHandler) Update(ctx *fiber.Ctx) error {
	id := ctx.Params("id")
	var user *domain.User
	if err := ctx.BodyParser(&user); err != nil {
		return server.NewErrResponse(ctx, ErrInvalidRequestBody(err))
	}
	user.UUID = id

	err := shared.Validate.Struct(user)
	if err != nil {
		return server.NewErrResponse(ctx, ErrInvalidUserData(err))
	}

	if err := uh.App.Update(user, ctx.UserContext()); err != nil {
		return server.NewErrResponse(ctx, ErrUpdatingUser(err))
	}

	return server.NewSuccessResponse(ctx, user)
}

func (uh *UserHandler) Delete(ctx *fiber.Ctx) error {
	id := ctx.Params("id")
	if err := uh.App.Delete(id, ctx.UserContext()); err != nil {
		return server.NewErrResponse(ctx, ErrDeletingUser(err))
	}

	return server.NewSuccessResponse(ctx, nil)
}
