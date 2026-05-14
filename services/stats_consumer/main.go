package main

import (
	"context"
	"log"
	"os"
	"os/signal"
	"syscall"

	"services/stats_consumer/application"
	"services/stats_consumer/infrastructure/environment"
	natsinfra "services/stats_consumer/infrastructure/nats"
	"services/stats_consumer/infrastructure/persistence/postgres"

	"github.com/nats-io/nats.go"

	_ "github.com/joho/godotenv/autoload"
)

func main() {
	if err := environment.Load(); err != nil {
		log.Fatalf("failed to load environment: %v", err)
	}

	ctx := context.Background()

	psql, err := postgres.NewPostgresClient(ctx)
	if err != nil {
		log.Fatalf("failed to connect to postgres: %v", err)
	}
	defer psql.Close()

	nc, err := nats.Connect(environment.Env.NATS_URL)
	if err != nil {
		log.Fatalf("failed to connect to NATS: %v", err)
	}
	defer nc.Drain()

	hourlyStatRepo := postgres.NewHourlyStatRepository(psql)
	userStatsRepo := postgres.NewUserStatsRepository(psql)
	handler := &application.StudySessionHandler{
		HourlyStatRepo: hourlyStatRepo,
		UserStatsRepo:  userStatsRepo,
	}

	sub, err := natsinfra.Subscribe(nc, handler)
	if err != nil {
		log.Fatalf("failed to subscribe: %v", err)
	}
	defer sub.Unsubscribe()

	log.Println("stats_consumer started — listening for study-session.created events")

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit

	log.Println("shutting down stats_consumer")
}
