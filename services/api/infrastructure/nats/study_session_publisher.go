package natsinfra

import (
	"encoding/json"
	"fmt"
	"pkg/domain"

	"github.com/nats-io/nats.go"
)

const SubjectStudySessionCreated = "study-session.created"

type StudySessionPublisher struct {
	nc *nats.Conn
}

func NewStudySessionPublisher(nc *nats.Conn) *StudySessionPublisher {
	return &StudySessionPublisher{nc: nc}
}

func (p *StudySessionPublisher) PublishCreated(session *domain.StudySession) error {
	data, err := json.Marshal(session)
	if err != nil {
		return fmt.Errorf("nats: marshal study session: %w", err)
	}

	if err := p.nc.Publish(SubjectStudySessionCreated, data); err != nil {
		return fmt.Errorf("nats: publish study session: %w", err)
	}

	return nil
}
