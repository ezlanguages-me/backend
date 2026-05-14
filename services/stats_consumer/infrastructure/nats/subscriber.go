package natsinfra

import (
	"context"
	"encoding/json"
	"log/slog"
	"pkg/domain"
	"services/stats_consumer/application"

	"github.com/nats-io/nats.go"
)

const SubjectStudySessionCreated = "study-session.created"

func Subscribe(nc *nats.Conn, handler *application.StudySessionHandler) (*nats.Subscription, error) {
	sub, err := nc.Subscribe(SubjectStudySessionCreated, func(msg *nats.Msg) {
		var session domain.StudySession
		if err := json.Unmarshal(msg.Data, &session); err != nil {
			slog.Error("error unmarshaling study-session event", "err", err)
			return
		}

		if err := handler.Handle(context.Background(), &session); err != nil {
			slog.Error("error processing study-session event", "err", err)
		}
	})
	if err != nil {
		return nil, err
	}

	slog.Info("subscribed to subject", "subject", SubjectStudySessionCreated)
	return sub, nil
}
