package natsinfra

import (
	"log/slog"
	"os"

	"github.com/nats-io/nats.go"
)

func NewNatsConnection(url string) (*nats.Conn, func()) {
	nc, err := nats.Connect(url)
	if err != nil {
		slog.Error("failed to connect to NATS", "err", err)
		os.Exit(1)
	}

	cleanup := func() {
		nc.Drain()
	}

	return nc, cleanup
}
