package main

import (
	"log"
	"services/api/infrastructure/environment"

	"pkg/server"

	_ "github.com/joho/godotenv/autoload"
)

func main() {

	app := server.Setup()

	cleanup, err := server.ConfigureLogging(app, "error.log")
	if err != nil {
		log.Fatalf("Failed to configure logging: %v", err)
	}

	defer cleanup()

	if err := server.LoadEnvironmentVariables(&environment.Env); err != nil {
		log.Fatalf("Failed to load environment variables: %v", err)
	}

	cleanupContainer := CreateContainer(app)
	defer cleanupContainer()

	server.StartServerWithGracefulShutdown(app, "0.0.0.0:3000")
}
