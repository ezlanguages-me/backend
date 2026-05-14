package environment

type Environment struct {
	GEMINI_API_KEY string `env:"GEMINI_API_KEY" required:"true"`

	// Postgres — needed because the ai service owns token consumption
	// (atomically debits/refunds around every Gemini call). Same DB as api.
	DB_USER             string `env:"DB_USER" required:"true"`
	DB_PASSWORD         string `env:"DB_PASSWORD" required:"true"`
	DB_NAME             string `env:"DB_NAME" required:"true"`
	MASTER_POSTGRES_DNS string `env:"MASTER_POSTGRES_DNS" required:"true"`
}

var Env Environment
