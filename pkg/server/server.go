package server

import (
	"os"
	"os/signal"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/log"
)

func Setup() *fiber.App {
	config := ConfigServer()
	app := fiber.New(config)

	AddFiberMiddleware(app)

	SetupRoutes(app)

	return app
}

func StartServerWithGracefulShutdown(app *fiber.App, addr string) {
	idleConnsClosed := make(chan struct{})

	go func() {
		sigint := make(chan os.Signal, 1)
		signal.Notify(sigint, os.Interrupt) // Catch OS interrupt signal
		<-sigint

		// We received an interrupt signal, shut down.
		if err := app.Shutdown(); err != nil {
			log.Error("Server Shutdown Failed: %v", err)
		}
		close(idleConnsClosed)
	}()

	fiberConnURL := addr

	if err := app.Listen(fiberConnURL); err != nil {
		log.Error("Server Start Failed: %v", err)
	}

	<-idleConnsClosed
}

func StartServer(app *fiber.App, addr string) error {
	return app.Listen(addr)
}
