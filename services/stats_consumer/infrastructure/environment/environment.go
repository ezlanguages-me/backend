package environment

import (
	"fmt"
	"os"
)

type Environment struct {
	NATS_URL            string
	DB_USER             string
	DB_PASSWORD         string
	DB_NAME             string
	MASTER_POSTGRES_DNS string
}

var Env Environment

func Load() error {
	Env = Environment{
		NATS_URL:            os.Getenv("NATS_URL"),
		DB_USER:             os.Getenv("DB_USER"),
		DB_PASSWORD:         os.Getenv("DB_PASSWORD"),
		DB_NAME:             os.Getenv("DB_NAME"),
		MASTER_POSTGRES_DNS: os.Getenv("MASTER_POSTGRES_DNS"),
	}

	if Env.NATS_URL == "" {
		return fmt.Errorf("NATS_URL is required")
	}
	if Env.DB_USER == "" || Env.DB_PASSWORD == "" || Env.DB_NAME == "" || Env.MASTER_POSTGRES_DNS == "" {
		return fmt.Errorf("DB_USER, DB_PASSWORD, DB_NAME, MASTER_POSTGRES_DNS are required")
	}

	return nil
}
