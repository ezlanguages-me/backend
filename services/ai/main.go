package main

import (
	"log"

	"services/ai/infrastructure/environment"

	"pkg/server"

	_ "github.com/joho/godotenv/autoload"
)

var version string

func main() {
	server.SetVersion(version)

	app := server.Setup()

	cleanup, err := server.ConfigureLogging(app, "error.log")
	if err != nil {
		log.Fatalf("Failed to configure logging: %v", err)
	}
	defer cleanup()

	if err := server.LoadEnvironmentVariables(&environment.Env); err != nil {
		log.Fatalf("Failed to load environment variables: %v", err)
	}

	cleanup2 := CreateContainer(app)
	defer cleanup2()

	server.StartServerWithGracefulShutdown(app, "0.0.0.0:3001")
}
