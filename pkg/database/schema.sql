CREATE TABLE users (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    time_zone TEXT NOT NULL,
    language TEXT NOT NULL,
    birth_year INT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);

-- Drop all tables in reverse dependency order (except users)
DROP TABLE IF EXISTS dialogue_lines_translation CASCADE;
DROP TABLE IF EXISTS dialogue_lines CASCADE;
DROP TABLE IF EXISTS dialogue_translation CASCADE;
DROP TABLE IF EXISTS dialogue CASCADE;
DROP TABLE IF EXISTS reading_translation CASCADE;
DROP TABLE IF EXISTS reading CASCADE;
DROP TABLE IF EXISTS speaking_translation CASCADE;
DROP TABLE IF EXISTS speaking CASCADE;
DROP TABLE IF EXISTS writing_translation CASCADE;
DROP TABLE IF EXISTS writing CASCADE;
DROP TABLE IF EXISTS listening_translation CASCADE;
DROP TABLE IF EXISTS listening CASCADE;
DROP TABLE IF EXISTS exercise_translation CASCADE;
DROP TABLE IF EXISTS exercise CASCADE;
DROP TABLE IF EXISTS rule_stat CASCADE;
DROP TABLE IF EXISTS grammar_rule_translation CASCADE;
DROP TABLE IF EXISTS grammar_rule CASCADE;
DROP TABLE IF EXISTS grammar_translation CASCADE;
DROP TABLE IF EXISTS grammar CASCADE;
DROP TABLE IF EXISTS deck_words CASCADE;
DROP TABLE IF EXISTS deck_translation CASCADE;
DROP TABLE IF EXISTS deck CASCADE;
DROP TABLE IF EXISTS word_inflection CASCADE;
DROP TABLE IF EXISTS word_translation CASCADE;
DROP TABLE IF EXISTS word CASCADE;
DROP TABLE IF EXISTS path CASCADE;
DROP TABLE IF EXISTS study_records CASCADE;
DROP TABLE IF EXISTS user_stats CASCADE;
DROP TABLE IF EXISTS hourly_stat CASCADE;

CREATE TABLE hourly_stat (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL REFERENCES users(uuid) ON DELETE CASCADE,
    hour SMALLINT NOT NULL CHECK (hour >= 0 AND hour < 24),
    average_score REAL NOT NULL DEFAULT 0.0,
    average_response_time REAL NOT NULL DEFAULT 0.0,
    average_energy_level REAL NOT NULL DEFAULT 0.0,
    total_sessions INT NOT NULL DEFAULT 0,  -- INT (not SMALLINT) to avoid overflow at 32,767
    last_updated TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (user_uuid, hour)
);

CREATE INDEX idx_hourly_stat_user ON hourly_stat(user_uuid);

CREATE TABLE user_stats (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL REFERENCES users(uuid) ON DELETE CASCADE UNIQUE,
    current_streak INT NOT NULL DEFAULT 0,
    longest_streak INT NOT NULL DEFAULT 0,
    total_hours_studied REAL NOT NULL DEFAULT 0.0,
    total_sessions INT NOT NULL DEFAULT 0,
    last_study_date DATE,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_user_stats_user ON user_stats(user_uuid);

CREATE TABLE study_records (
    uuid UUID NOT NULL DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL REFERENCES users(uuid) ON DELETE CASCADE,
    target_uuid UUID NOT NULL,
    target_type TEXT NOT NULL,
    last_review TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    next_review TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    stability REAL NOT NULL DEFAULT 1,
    difficulty REAL NOT NULL DEFAULT 1.3,
    repetitions SMALLINT NOT NULL DEFAULT 0,
    status TEXT NOT NULL,
    last_score SMALLINT NOT NULL,
    mastery REAL NOT NULL DEFAULT 0.0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    -- Partition key (user_uuid) must be part of every unique/primary constraint.
    PRIMARY KEY (user_uuid, uuid),
    UNIQUE (user_uuid, target_uuid, target_type)
) PARTITION BY HASH (user_uuid);

-- 16 hash partitions — each holds ~1/16 of all rows, routed by user_uuid hash.
-- Adding more partitions later requires table rebuild; 16 comfortably handles
-- tens of millions of rows with current node sizing.
CREATE TABLE study_records_p0  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 0);
CREATE TABLE study_records_p1  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 1);
CREATE TABLE study_records_p2  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 2);
CREATE TABLE study_records_p3  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 3);
CREATE TABLE study_records_p4  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 4);
CREATE TABLE study_records_p5  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 5);
CREATE TABLE study_records_p6  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 6);
CREATE TABLE study_records_p7  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 7);
CREATE TABLE study_records_p8  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 8);
CREATE TABLE study_records_p9  PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 9);
CREATE TABLE study_records_p10 PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 10);
CREATE TABLE study_records_p11 PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 11);
CREATE TABLE study_records_p12 PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 12);
CREATE TABLE study_records_p13 PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 13);
CREATE TABLE study_records_p14 PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 14);
CREATE TABLE study_records_p15 PARTITION OF study_records FOR VALUES WITH (modulus 16, remainder 15);

-- Note: idx_study_records_user_next_review below is the canonical composite index.
-- This line intentionally left to document the removal of the duplicate.

CREATE TABLE path (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source_language TEXT NOT NULL
);

CREATE INDEX idx_path_language ON path(source_language);

CREATE TABLE word (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    term TEXT NOT NULL,
    is_root BOOLEAN NOT NULL DEFAULT FALSE,
    source_language TEXT NOT NULL,
    inflection_type TEXT,
    root_word UUID REFERENCES word(uuid) ON DELETE SET NULL,
    example TEXT
);

CREATE TABLE word_translation (
    word_uuid UUID NOT NULL REFERENCES word(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    meaning JSONB,
    pronunciation TEXT NOT NULL,
    PRIMARY KEY (word_uuid, language)
);

CREATE TABLE word_inflection (
    word_uuid UUID NOT NULL REFERENCES word(uuid) ON DELETE CASCADE,
    inflection_uuid UUID NOT NULL REFERENCES word(uuid) ON DELETE CASCADE,
    PRIMARY KEY (word_uuid, inflection_uuid)
);

CREATE TABLE deck (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    step_order SMALLINT NOT NULL,
    source_language TEXT NOT NULL,
    type TEXT NOT NULL
);

CREATE INDEX idx_deck_path ON deck(path_uuid);

CREATE TABLE deck_translation (
    deck_uuid UUID NOT NULL REFERENCES deck(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    PRIMARY KEY (deck_uuid, language)
);

CREATE TABLE deck_words (
    deck_uuid UUID NOT NULL REFERENCES deck(uuid) ON DELETE CASCADE,
    word_uuid UUID NOT NULL REFERENCES word(uuid) ON DELETE CASCADE,
    PRIMARY KEY (deck_uuid, word_uuid)
);

CREATE TABLE grammar (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    source_language TEXT NOT NULL,
    step_order SMALLINT NOT NULL,
    type TEXT NOT NULL
);

CREATE INDEX idx_grammar_path ON grammar(path_uuid);

CREATE TABLE grammar_translation (
    grammar_uuid UUID NOT NULL REFERENCES grammar(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    content JSONB NOT NULL,
    PRIMARY KEY (grammar_uuid, language)
);

CREATE TABLE grammar_rule (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source_language TEXT NOT NULL,
    grammar_uuid UUID NOT NULL REFERENCES grammar(uuid) ON DELETE CASCADE
);

CREATE INDEX idx_grammar_rule_grammar ON grammar_rule(grammar_uuid, source_language);

CREATE TABLE grammar_rule_translation (
    grammar_rule_uuid UUID NOT NULL REFERENCES grammar_rule(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    failure_feedback TEXT NOT NULL,
    PRIMARY KEY (grammar_rule_uuid, language)
);

CREATE TABLE rule_stat (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL REFERENCES users(uuid) ON DELETE CASCADE,
    grammar_rule_uuid UUID NOT NULL REFERENCES grammar_rule(uuid) ON DELETE CASCADE,
    correct_count SMALLINT NOT NULL DEFAULT 0,
    incorrect_count SMALLINT NOT NULL DEFAULT 0,
    last_mistake TIMESTAMPTZ,
    proficiency REAL NOT NULL DEFAULT 0.0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (user_uuid, grammar_rule_uuid)
);

CREATE INDEX idx_rule_stat_user ON rule_stat(user_uuid);

CREATE TABLE exercise (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    target_uuid UUID NOT NULL,
    grammar_rule_uuid UUID REFERENCES grammar_rule(uuid) ON DELETE CASCADE
);

CREATE TABLE exercise_translation (
    exercise_uuid UUID NOT NULL REFERENCES exercise(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    prompt TEXT NOT NULL,
    specifics JSONB NOT NULL,
    PRIMARY KEY (exercise_uuid, language)
);

CREATE TABLE listening (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    source_language TEXT NOT NULL,
    step_order SMALLINT NOT NULL,
    type TEXT NOT NULL,
    category TEXT,
    transcript TEXT NOT NULL DEFAULT ''
);

CREATE TABLE listening_translation (
    listening_uuid UUID NOT NULL REFERENCES listening(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    PRIMARY KEY (listening_uuid, language)
);

CREATE INDEX idx_listening_path ON listening(path_uuid);

CREATE TABLE writing (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    source_language TEXT NOT NULL,
    step_order SMALLINT NOT NULL,
    type TEXT NOT NULL,
    category TEXT
);

CREATE TABLE writing_translation (
    writing_uuid UUID NOT NULL REFERENCES writing(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    prompt JSONB NOT NULL,
    PRIMARY KEY (writing_uuid, language)
);

CREATE INDEX idx_writing_path ON writing(path_uuid);

CREATE TABLE speaking (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    source_language TEXT NOT NULL,
    step_order SMALLINT NOT NULL,
    type TEXT NOT NULL,
    category TEXT
);

CREATE TABLE speaking_translation (
    speaking_uuid UUID NOT NULL REFERENCES speaking(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    prompt JSONB NOT NULL,
    PRIMARY KEY (speaking_uuid, language)
);

CREATE INDEX idx_speaking_path ON speaking(path_uuid);

CREATE TABLE reading (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    source_language TEXT NOT NULL,
    step_order SMALLINT NOT NULL,
    type TEXT NOT NULL,
    category TEXT,
    content TEXT NOT NULL DEFAULT ''
);

CREATE TABLE reading_translation (
    reading_uuid UUID NOT NULL REFERENCES reading(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    PRIMARY KEY (reading_uuid, language)
);

CREATE INDEX idx_reading_path ON reading(path_uuid);

CREATE TABLE dialogue (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    source_language TEXT NOT NULL,
    step_order SMALLINT NOT NULL,
    type TEXT NOT NULL,
    category TEXT,
    characters JSONB NOT NULL
);

CREATE TABLE dialogue_translation (
    dialogue_uuid UUID NOT NULL REFERENCES dialogue(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    PRIMARY KEY (dialogue_uuid, language)
);

CREATE TABLE dialogue_lines (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    dialogue_uuid UUID NOT NULL REFERENCES dialogue(uuid) ON DELETE CASCADE,
    line_order SMALLINT NOT NULL,
    character_name TEXT NOT NULL,
    text TEXT NOT NULL,
    UNIQUE (dialogue_uuid, line_order)
);

CREATE TABLE dialogue_lines_translation (
    dialogue_line_uuid UUID NOT NULL REFERENCES dialogue_lines(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    meaning JSONB NOT NULL,    
    PRIMARY KEY (dialogue_line_uuid, language)       
);



-- Índices adicionales para búsquedas comunes
CREATE INDEX idx_dialogue_path ON dialogue(path_uuid);
CREATE INDEX idx_dialogue_source_language ON dialogue(source_language);
CREATE INDEX idx_grammar_source_language ON grammar(source_language);
CREATE INDEX idx_listening_source_language ON listening(source_language);

-- Composite index para la query más común de study records
CREATE INDEX idx_study_records_user_next_review ON study_records(user_uuid, next_review);
CREATE INDEX idx_rule_stat_user_rule ON rule_stat(user_uuid, grammar_rule_uuid);

-- Índice para exercise.target_uuid: crítico para el REFRESH MATERIALIZED VIEW (evita seq scans)
CREATE INDEX idx_exercise_target ON exercise(target_uuid);

-- Índice para word.root_word: usado en la vista mv_path_full al resolver inflections
CREATE INDEX idx_word_root ON word(root_word) WHERE root_word IS NOT NULL;

-- Índice compuesto para study_records: permite paginación eficiente
CREATE INDEX idx_study_records_user_time ON study_records(user_uuid, last_review DESC);

-- Idempotent migration: rename age → birth_year if the old column still exists
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'users' AND column_name = 'age'
    ) THEN
        ALTER TABLE users RENAME COLUMN age TO birth_year;
    END IF;
END $$;
ALTER TABLE users ADD COLUMN IF NOT EXISTS birth_year INT;

-- Subscriptions: per-user monthly token quota. Future plans (pro, etc.)
-- can override monthly_token_limit and active.
CREATE TABLE IF NOT EXISTS user_subscriptions (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL UNIQUE REFERENCES users(uuid) ON DELETE CASCADE,
    plan TEXT NOT NULL DEFAULT 'free',
    monthly_token_limit INT NOT NULL DEFAULT 60,
    tokens_used INT NOT NULL DEFAULT 0,
    period_start TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    period_end TIMESTAMPTZ NOT NULL DEFAULT NOW() + INTERVAL '1 month',
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_user_subscriptions_user ON user_subscriptions(user_uuid);
