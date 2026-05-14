package environment

type Environment struct {
	HOST                 string `env:"HOST" required:"true"`
	PORT                 string `env:"PORT" required:"true"`
	DB_USER              string `env:"DB_USER" required:"true"`
	DB_PASSWORD          string `env:"DB_PASSWORD" required:"true"`
	DB_NAME              string `env:"DB_NAME" required:"true"`
	MASTER_POSTGRES_DNS  string `env:"MASTER_POSTGRES_DNS" required:"true"`
	REPLICA_POSTGRES_DNS string `env:"REPLICA_POSTGRES_DNS" required:"true"`
	NATS_URL             string `env:"NATS_URL" required:"true"`
}

var Env Environment
