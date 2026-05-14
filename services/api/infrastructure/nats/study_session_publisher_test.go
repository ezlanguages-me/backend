package natsinfra

import (
	"pkg/domain"
	"testing"

	"github.com/nats-io/nats.go"
)

// We avoid spinning up an embedded NATS server (extra heavy dependency).
// Instead we exercise the marshal step and confirm the publisher gracefully
// surfaces the underlying NATS error when the connection isn't usable.

func TestStudySessionPublisher_PublishCreated_NoConnection(t *testing.T) {
	pub := NewStudySessionPublisher(&nats.Conn{})
	err := pub.PublishCreated(&domain.StudySession{UUID: "ss1", UserUUID: "u"})
	if err == nil {
		t.Fatal("expected error when publishing on a disconnected conn")
	}
}

func TestStudySessionPublisher_NilConn(t *testing.T) {
	defer func() {
		// Either an error return *or* a panic recovered here is fine — what
		// must NOT happen is silently succeeding with no connection.
		_ = recover()
	}()
	pub := NewStudySessionPublisher(nil)
	if err := pub.PublishCreated(&domain.StudySession{UUID: "x"}); err == nil {
		t.Fatal("expected error or panic with nil conn")
	}
}

func TestSubjectStudySessionCreated(t *testing.T) {
	// Lock the subject — changing it would silently break the consumer.
	if SubjectStudySessionCreated != "study-session.created" {
		t.Fatalf("subject changed: %q", SubjectStudySessionCreated)
	}
}

func BenchmarkPublishCreated_MarshalOnly(b *testing.B) {
	// PublishCreated will fail because the conn is empty, but the marshal
	// path runs first and that's the part we want to time.
	pub := NewStudySessionPublisher(&nats.Conn{})
	s := &domain.StudySession{
		UUID: "ss1", UserUUID: "u", TotalItems: 10, CorrectItems: 7,
		ResponseTimes: []int32{1200, 1500, 900, 1100, 1300, 1400, 1000, 1100, 1200, 1250},
	}
	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = pub.PublishCreated(s)
	}
}
