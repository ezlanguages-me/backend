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

printf '\n\033[1;32m✅  All migrations applied.\033[0m\n\n'
