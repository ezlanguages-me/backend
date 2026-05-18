package environment

type Environment struct {
	DB_USER              string `env:"DB_USER" required:"true"`
	DB_PASSWORD          string `env:"DB_PASSWORD" required:"true"`
	DB_NAME              string `env:"DB_NAME" required:"true"`
	DB_PORT              string `env:"DB_PORT" envDefault:"5432"`
	MASTER_POSTGRES_DNS  string `env:"MASTER_POSTGRES_DNS" required:"true"`
	REPLICA_POSTGRES_DNS string `env:"REPLICA_POSTGRES_DNS" required:"true"`
	NATS_URL             string `env:"NATS_URL" required:"true"`
}

var Env Environment
