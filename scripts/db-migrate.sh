#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# db-migrate.sh — Apply pending schema migrations without resetting the DB.
#
# Usage:
#   ./scripts/db-migrate.sh
#
# Env vars (all optional, with sensible defaults):
#   DB_HOST      PostgreSQL host      (default: localhost or MASTER_POSTGRES_DNS)
#   DB_PORT      PostgreSQL port      (default: 5432)
#   DB_USER      PostgreSQL user      (default: postgres)
#   DB_PASSWORD  PostgreSQL password
#   DB_NAME      Database name        (default: ezlanguages)
# ─────────────────────────────────────────────────────────────────────────────
set -euo pipefail

DB_HOST="${DB_HOST:-${MASTER_POSTGRES_DNS:-localhost}}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"
DB_NAME="${DB_NAME:-ezlanguages}"
export PGPASSWORD="${DB_PASSWORD:-}"

PSQL=(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" --set ON_ERROR_STOP=1)

printf '\n'
printf '━%.0s' {1..48}; printf '\n'
printf '  DB Migrate: \033[1;33m%s\033[0m @ \033[0;33m%s:%s\033[0m\n' "$DB_NAME" "$DB_HOST" "$DB_PORT"
printf '━%.0s' {1..48}; printf '\n\n'

step() { printf '\033[0;34m▶\033[0m %s\n' "$*"; }
ok()   { printf '  \033[0;32m✅ %s\033[0m\n' "$*"; }
fail() { printf '\n\033[0;31m❌ %s\033[0m\n\n' "$*"; exit 1; }

# ── Migration: rename age → birth_year ────────────────────────────────────────
step "Migration: users.age → users.birth_year"
"${PSQL[@]}" "$DB_NAME" <<'SQL' \
    || fail "Migration failed."
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'users' AND column_name = 'age'
    ) THEN
        ALTER TABLE users RENAME COLUMN age TO birth_year;
        RAISE NOTICE 'Renamed column age → birth_year';
    ELSE
        RAISE NOTICE 'Column age does not exist — skipping rename';
    END IF;
END $$;

ALTER TABLE users ADD COLUMN IF NOT EXISTS birth_year INT;
SQL
ok "Done"

# ── Migration: word_translation → bridge table ────────────────────────────────
step "Migration: word_translation → bridge table (source_word_uuid / target_word_uuid)"
"${PSQL[@]}" "$DB_NAME" <<'SQL' \
    || fail "Migration failed."
DO $$
DECLARE
    has_word_uuid BOOLEAN;
    has_source_word_uuid BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'word_translation' AND column_name = 'word_uuid'
    ) INTO has_word_uuid;

    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'word_translation' AND column_name = 'source_word_uuid'
    ) INTO has_source_word_uuid;

    IF has_source_word_uuid THEN
        RAISE NOTICE 'word_translation already migrated to bridge table — skipping';
        RETURN;
    END IF;

    IF has_word_uuid THEN
        -- Drop old primary key / unique constraints
        ALTER TABLE word_translation DROP CONSTRAINT IF EXISTS word_translation_pkey;
        ALTER TABLE word_translation DROP CONSTRAINT IF EXISTS word_translation_word_lang_unique;
        ALTER TABLE word_translation DROP CONSTRAINT IF EXISTS word_translation_word_uuid_language_key;

        -- Drop old columns that no longer apply
        ALTER TABLE word_translation DROP COLUMN IF EXISTS language;
        ALTER TABLE word_translation DROP COLUMN IF EXISTS meaning;

        -- Rename word_uuid → source_word_uuid
        ALTER TABLE word_translation RENAME COLUMN word_uuid TO source_word_uuid;

        -- Add target_word_uuid (nullable first, then NOT NULL after data migration)
        ALTER TABLE word_translation ADD COLUMN IF NOT EXISTS target_word_uuid UUID REFERENCES word(uuid) ON DELETE CASCADE;

        -- Add uuid PK if not present
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns
            WHERE table_name = 'word_translation' AND column_name = 'uuid'
        ) THEN
            ALTER TABLE word_translation ADD COLUMN uuid UUID NOT NULL DEFAULT gen_random_uuid();
        END IF;

        -- NOTE: target_word_uuid rows will be NULL until seed data is migrated.
        -- Rows with NULL target_word_uuid should be cleaned up after seed migration.

        ALTER TABLE word_translation ADD PRIMARY KEY (uuid);
        ALTER TABLE word_translation ADD CONSTRAINT word_translation_pair_unique
            UNIQUE (source_word_uuid, target_word_uuid);

        RAISE NOTICE 'Migrated word_translation to bridge table';
    ELSE
        RAISE NOTICE 'word_translation has neither word_uuid nor source_word_uuid — assuming already bridged or empty';

        -- Ensure the bridge structure exists from scratch
        CREATE TABLE IF NOT EXISTS word_translation (
            uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            source_word_uuid UUID NOT NULL REFERENCES word(uuid) ON DELETE CASCADE,
            target_word_uuid UUID NOT NULL REFERENCES word(uuid) ON DELETE CASCADE,
            pronunciation TEXT NOT NULL DEFAULT '',
            UNIQUE (source_word_uuid, target_word_uuid)
        );
    END IF;

    -- Ensure pronunciation column exists with correct type
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'word_translation' AND column_name = 'pronunciation'
    ) THEN
        ALTER TABLE word_translation ADD COLUMN pronunciation TEXT NOT NULL DEFAULT '';
    END IF;
END $$;
SQL
ok "Done"

# ── Migration: user_languages ─────────────────────────────────────────────────
step "Migration: create user_languages table"
"${PSQL[@]}" "$DB_NAME" <<'SQL' \
    || fail "Migration failed."
CREATE TABLE IF NOT EXISTS user_languages (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL REFERENCES users(uuid) ON DELETE CASCADE,
    language TEXT NOT NULL,
    cefr_level TEXT NOT NULL CHECK (cefr_level IN ('A0','A1','A2','B1','B2','C1','C2','native')),
    is_native BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (user_uuid, language)
);
CREATE INDEX IF NOT EXISTS idx_user_languages_user ON user_languages(user_uuid);
SQL
ok "Done"

# ── Migration: user_path_settings ─────────────────────────────────────────────
step "Migration: create user_path_settings table"
"${PSQL[@]}" "$DB_NAME" <<'SQL' \
    || fail "Migration failed."
CREATE TABLE IF NOT EXISTS user_path_settings (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_uuid UUID NOT NULL REFERENCES users(uuid) ON DELETE CASCADE,
    path_uuid UUID NOT NULL REFERENCES path(uuid) ON DELETE CASCADE,
    polyglot_enabled BOOLEAN NOT NULL DEFAULT FALSE,
    polyglot_until_cefr TEXT CHECK (polyglot_until_cefr IN ('A0','A1','A2','B1','B2','C1','C2')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (user_uuid, path_uuid)
);
CREATE INDEX IF NOT EXISTS idx_user_path_settings_user ON user_path_settings(user_uuid);
SQL
ok "Done"

printf '\n\033[1;32m✅  All migrations applied.\033[0m\n\n'
