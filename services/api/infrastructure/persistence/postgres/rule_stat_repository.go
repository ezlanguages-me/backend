package postgres

import (
	"context"
	"pkg/domain"

	"github.com/jackc/pgx/v5"
)

type RuleStatRepository struct {
	client *PostgresRepository
}

func NewRuleStatRepository(client *PostgresRepository) domain.RuleStatRepository {
	return &RuleStatRepository{client: client}
}

func (rsr *RuleStatRepository) Get(userUUID string) ([]*domain.RuleStat, error) {
	pool := rsr.client.getPool(true)

	rows, err := pool.Query(context.Background(), `
		SELECT uuid, user_uuid, grammar_rule_uuid, correct_count, incorrect_count, last_mistake, proficiency, created_at, updated_at
		FROM rule_stat
		WHERE user_uuid = $1
	`, userUUID)

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var stats []*domain.RuleStat
	for rows.Next() {
		var rs domain.RuleStat
		if err := rows.Scan(&rs.UUID, &rs.UserUUID, &rs.GrammarRuleUUID, &rs.CorrectCount, &rs.IncorrectCount, &rs.LastMistake, &rs.Proficiency, &rs.CreatedAt, &rs.UpdatedAt); err != nil {
			return nil, err
		}
		stats = append(stats, &rs)
	}

	return stats, nil
}

func (rsr *RuleStatRepository) Batch(stats []*domain.RuleStat) ([]*domain.RuleStat, error) {
	pool := rsr.client.getPool(false)

	batch := &pgx.Batch{}
	for _, rs := range stats {
		// Use a CTE to guard against orphaned grammar_rule_uuid values (FK violation).
		// If the referenced grammar_rule no longer exists the INSERT is skipped silently.
		batch.Queue(`
			WITH valid AS (SELECT 1 FROM grammar_rule WHERE uuid = $2)
			INSERT INTO rule_stat (user_uuid, grammar_rule_uuid, correct_count, incorrect_count, last_mistake, proficiency, created_at, updated_at)
			SELECT $1, $2, $3::smallint, $4::smallint, $5, ROUND($3::numeric / NULLIF($3::numeric + $4::numeric, 0) * 100), NOW(), NOW()
			FROM valid
			ON CONFLICT (user_uuid, grammar_rule_uuid) DO UPDATE SET
				correct_count   = rule_stat.correct_count + EXCLUDED.correct_count,
				incorrect_count = rule_stat.incorrect_count + EXCLUDED.incorrect_count,
				proficiency     = ROUND(
					(rule_stat.correct_count + EXCLUDED.correct_count)::numeric /
					NULLIF((rule_stat.correct_count + rule_stat.incorrect_count + EXCLUDED.correct_count + EXCLUDED.incorrect_count)::numeric, 0) * 100),
				last_mistake    = CASE WHEN EXCLUDED.incorrect_count > 0 THEN EXCLUDED.last_mistake ELSE rule_stat.last_mistake END,
				updated_at      = NOW()
			RETURNING uuid, user_uuid, grammar_rule_uuid, correct_count, incorrect_count, last_mistake, proficiency, created_at, updated_at
		`, rs.UserUUID, rs.GrammarRuleUUID, rs.CorrectCount, rs.IncorrectCount, rs.LastMistake)
	}

	br := pool.SendBatch(context.Background(), batch)
	defer br.Close()

	var inserted []*domain.RuleStat
	for range stats {
		rows, err := br.Query()
		if err != nil {
			return nil, err
		}
		for rows.Next() {
			var rs domain.RuleStat
			if err := rows.Scan(&rs.UUID, &rs.UserUUID, &rs.GrammarRuleUUID, &rs.CorrectCount, &rs.IncorrectCount, &rs.LastMistake, &rs.Proficiency, &rs.CreatedAt, &rs.UpdatedAt); err != nil {
				rows.Close()
				return nil, err
			}
			inserted = append(inserted, &rs)
		}
		rows.Close()
		if err := rows.Err(); err != nil {
			return nil, err
		}
	}

	return inserted, nil
}
