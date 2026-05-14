package main

import (
	"context"
	"log/slog"
	"os"
	"services/api/application"
	"services/api/infrastructure/environment"
	natsinfra "services/api/infrastructure/nats"
	"services/api/infrastructure/persistence/postgres"
	"services/api/infrastructure/router"

	"github.com/gofiber/fiber/v2"
)

func CreateContainer(app *fiber.App) func() {
	// Initialize Postgres repository
	psql, err := postgres.NewPostgresRepository(context.Background())
	if err != nil {
		slog.Error("failed to initialize postgres repository", "err", err)
		os.Exit(1)
	}

	psql.HealthCheck(context.Background())

	// Initialize NATS
	nc, cleanupNats := natsinfra.NewNatsConnection(environment.Env.NATS_URL)
	studySessionPublisher := natsinfra.NewStudySessionPublisher(nc)

	// Initialize application services
	userApp := &application.UserApplication{
		Repo: postgres.NewUserRepository(psql),
	}

	subscriptionApp := &application.SubscriptionApplication{
		Repo:     postgres.NewSubscriptionRepository(psql),
		UserRepo: postgres.NewUserRepository(psql),
	}

	pathApp := &application.PathApplication{
		Repo: postgres.NewPathRepository(psql),
	}

	studyRecordApp := &application.StudyRecordApplication{
		Repo: postgres.NewStudyRecordRepository(psql),
	}

	ruleStatApp := &application.RuleStatApplication{
		Repo: postgres.NewRuleStatRepository(psql),
	}

	learningSummaryApp := &application.LearningSummaryApplication{
		Repo: postgres.NewLearningSummaryRepository(psql),
	}

	userStatsApp := &application.UserStatsApplication{
		Repo: postgres.NewUserStatsRepository(psql),
	}

	listeningApp := &application.ListeningApplication{
		Repo: postgres.NewListeningRepository(psql),
	}

	writingApp := &application.WritingApplication{
		Repo: postgres.NewWritingRepository(psql),
	}

	speakingApp := &application.SpeakingApplication{
		Repo: postgres.NewSpeakingRepository(psql),
	}

	readingApp := &application.ReadingApplication{
		Repo: postgres.NewReadingRepository(psql),
	}

	// Set up routes
	api := app.Group("/api/v1")
	userGroup := api.Group("/users")
	pathGroup := api.Group("/paths")
	studyRecordGroup := api.Group("/study-records")
	studySessionGroup := api.Group("/study-sessions")
	ruleStatGroup := api.Group("/rule-stats")
	learningSummaryGroup := api.Group("/learning-summary")
	userStatsGroup := api.Group("/user-stats")
	listeningGroup := api.Group("/listening")
	writingGroup := api.Group("/writing")
	speakingGroup := api.Group("/speaking")
	readingGroup := api.Group("/reading")
	subscriptionGroup := api.Group("/subscriptions")

	router.UserRouter(userGroup, *userApp)
	router.PathRouter(pathGroup, *pathApp)
	router.StudyRecordRouter(studyRecordGroup, *studyRecordApp)
	router.StudySessionRouter(studySessionGroup, studySessionPublisher)
	router.RuleStatRouter(ruleStatGroup, *ruleStatApp)
	router.LearningSummaryRouter(learningSummaryGroup, *learningSummaryApp)
	router.UserStatsRouter(userStatsGroup, *userStatsApp)
	router.ListeningRouter(listeningGroup, *listeningApp)
	router.WritingRouter(writingGroup, *writingApp)
	router.SpeakingRouter(speakingGroup, *speakingApp)
	router.ReadingRouter(readingGroup, *readingApp)
	router.SubscriptionRouter(subscriptionGroup, *subscriptionApp)

	// Return cleanup function
	return func() {
		cleanupNats()
		psql.Close()
	}
}
