package postgres

import (
	"context"
	"pkg/domain"

	"github.com/google/uuid"
)

type UserRepository struct {
	client *PostgresRepository
}

func NewUserRepository(client *PostgresRepository) domain.UserRepository {
	return &UserRepository{client: client}
}

func (ur *UserRepository) Create(user *domain.User) error {
	pool := ur.client.getPool(false)

	var age *int
	if user.Age > 0 {
		age = &user.Age
	}

	err := pool.QueryRow(context.Background(), `
		INSERT INTO users (name, email, time_zone, language, age)
		VALUES ($1, $2, $3, $4, $5)
		ON CONFLICT (email) DO UPDATE
			SET name = EXCLUDED.name,
			    time_zone = EXCLUDED.time_zone,
			    language = EXCLUDED.language
		RETURNING uuid, created_at
	`, user.Name, user.Email, user.TimeZone, user.Language, age).Scan(&user.UUID, &user.CreatedAt)

	if err != nil {
		return err
	}

	return nil
}

func (ur *UserRepository) Get(identifier string) (*domain.User, error) {
	pool := ur.client.getPool(true)

	// Route to the correct index: UUID PK index vs. unique email index.
	// Casting the stored uuid column to text (uuid::text) would force a seq scan;
	// using separate typed queries lets Postgres use the right index in each case.
	var query string
	if _, err := uuid.Parse(identifier); err == nil {
		query = `SELECT uuid, name, email, time_zone, language, age, created_at FROM users WHERE uuid = $1`
	} else {
		query = `SELECT uuid, name, email, time_zone, language, age, created_at FROM users WHERE email = $1`
	}

	var user domain.User
	var age *int
	err := pool.QueryRow(context.Background(), query, identifier).
		Scan(&user.UUID, &user.Name, &user.Email, &user.TimeZone, &user.Language, &age, &user.CreatedAt)

	if err != nil {
		return nil, err
	}

	if age != nil {
		user.Age = *age
	}

	return &user, nil
}

func (ur *UserRepository) Update(user *domain.User) error {
	pool := ur.client.getPool(false)

	var age *int
	if user.Age > 0 {
		age = &user.Age
	}

	_, err := pool.Exec(context.Background(), `
		UPDATE users
		SET name = $1, email = $2, time_zone = $3, language = $4, age = $5
		WHERE uuid = $6
	`, user.Name, user.Email, user.TimeZone, user.Language, age, user.UUID)

	return err
}

func (ur *UserRepository) Delete(uuid string) error {
	pool := ur.client.getPool(false)

	_, err := pool.Exec(context.Background(), `
		DELETE FROM users
		WHERE uuid = $1
	`, uuid)

	return err
}
