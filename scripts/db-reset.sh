#!/usr/bin/env bash
# db-reset.sh — Drop, recreate, and optionally seed the database.
#
# Usage:
#   ./scripts/db-reset.sh              # schema + views only
#   ./scripts/db-reset.sh --seed       # schema + data + views
#   ./scripts/db-reset.sh --seed=en/a0-es  # schema + specific data + views
#
# Override any variable via env or CLI flag:
#   DB_HOST=localhost ./scripts/db-reset.sh --seed
#
# Non-interactive in CI:   CI=1 ./scripts/db-reset.sh --seed

set -euo pipefail

# ── Paths ────────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DB_DIR="$BACKEND_DIR/pkg/database"
ENV_FILE="$BACKEND_DIR/services/api/.env"

# ── Load .env (only DB-related vars, don't clobber already-set env) ──────────
if [ -f "$ENV_FILE" ]; then
    while IFS='=' read -r key value; do
        [[ "$key" =~ ^#|^[[:space:]]*$ ]] && continue
        key="${key%%[[:space:]]*}"
        value="${value%%[[:space:]]*}"
        # Only export if not already set in the environment
        [[ -z "${!key+x}" ]] && export "$key=$value"
    done < <(grep -E "^(DB_|MASTER_POSTGRES_DNS)" "$ENV_FILE")
fi

# ── Defaults ─────────────────────────────────────────────────────────────────
DB_HOST="${DB_HOST:-${MASTER_POSTGRES_DNS:-localhost}}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"
DB_NAME="${DB_NAME:-ezlanguages}"
export PGPASSWORD="${DB_PASSWORD:-}"

# ── Parse flags ───────────────────────────────────────────────────────────────
SEED=false
SEED_PATH=""
SEED_ONLY=false

for arg in "$@"; do
    case $arg in
        --seed)      SEED=true ;;
        --seed=*)    SEED=true; SEED_PATH="${arg#--seed=}" ;;
        --seed-only) SEED=true; SEED_ONLY=true ;;
        --seed-only=*) SEED=true; SEED_ONLY=true; SEED_PATH="${arg#--seed-only=}" ;;
        --help|-h)
            cat <<EOF
Usage: $(basename "$0") [options]

Options:
  --seed           Apply all seed data after schema
  --seed=<path>    Apply seed from a specific subdir under pkg/database/data/
                   Example: --seed=en/a0-es
  --seed-only      Skip drop/recreate; apply seed data to existing DB
  --seed-only=<path>  Same, but for a specific subdir
  --help           Show this help

Environment variables (loaded from services/api/.env if not set):
  DB_HOST          PostgreSQL host    (or MASTER_POSTGRES_DNS)
  DB_PORT          PostgreSQL port    (default: 5432)
  DB_USER          PostgreSQL user
  DB_PASSWORD      PostgreSQL password
  DB_NAME          Database name

Set CI=1 to skip the confirmation prompt.
EOF
            exit 0
            ;;
        *) echo "Unknown flag: $arg" >&2; exit 1 ;;
    esac
done

PSQL=(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" --set ON_ERROR_STOP=1)

# ── Helpers ───────────────────────────────────────────────────────────────────
step() { printf '\n\033[1;34m▶ %s\033[0m\n' "$*"; }
ok()   { printf '  \033[0;32m✅ %s\033[0m\n' "$*"; }
fail() { printf '\n\033[0;31m❌ %s\033[0m\n' "$*" >&2; exit 1; }

# ── Header ────────────────────────────────────────────────────────────────────
printf '\n\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'
printf '\033[1m  DB Reset: \033[0;33m%s\033[0m @ \033[0;33m%s:%s\033[0m\n' "$DB_NAME" "$DB_HOST" "$DB_PORT"
printf '\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'

# ── Confirm (skipped in CI or with FORCE=1) ───────────────────────────────────
if [[ -z "${CI:-}" && -z "${FORCE:-}" ]]; then
    printf '\n\033[0;33m⚠️  This will PERMANENTLY DELETE all data in \033[1m%s\033[0;33m.\033[0m\n\n' "$DB_NAME"
    read -r -p "   Type the database name to confirm: " CONFIRM
    [[ "$CONFIRM" == "$DB_NAME" ]] || { echo "Aborted."; exit 1; }
fi

# ── 1–4: Reset + schema (skipped with --seed-only) ───────────────────────────
if [[ "$SEED_ONLY" == false ]]; then

# ── 1. Kill active connections ────────────────────────────────────────────────
step "Terminating active connections to '$DB_NAME'..."
"${PSQL[@]}" postgres -c "
    SELECT pg_terminate_backend(pid)
    FROM pg_stat_activity
    WHERE datname = '$DB_NAME' AND pid <> pg_backend_pid();
" > /dev/null 2>&1 || true
ok "Done"

# ── 2. Drop database ──────────────────────────────────────────────────────────
step "Dropping database '$DB_NAME'..."
"${PSQL[@]}" postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";" \
    || fail "Could not drop database. Check credentials and host."
ok "Dropped"

# ── 3. Create database ────────────────────────────────────────────────────────
step "Creating database '$DB_NAME'..."
"${PSQL[@]}" postgres -c "CREATE DATABASE \"$DB_NAME\" OWNER \"$DB_USER\";" \
    || fail "Could not create database."
ok "Created"

# ── 4. Apply schema ───────────────────────────────────────────────────────────
step "Applying schema..."
"${PSQL[@]}" "$DB_NAME" < "$DB_DIR/schema.sql" \
    || fail "Schema failed — check $DB_DIR/schema.sql"
ok "Schema applied"

fi # end SEED_ONLY=false block

# ── 5. Seed data (optional) ───────────────────────────────────────────────────
if [[ "$SEED" == true ]]; then

    if [[ -n "$SEED_PATH" ]]; then
        SEED_DIRS=("$DB_DIR/data/$SEED_PATH")
        [[ -d "${SEED_DIRS[0]}" ]] || fail "Seed directory not found: ${SEED_DIRS[0]}"
    else
        # Auto-discover all leaf language/path directories
        mapfile -t SEED_DIRS < <(
            find "$DB_DIR/data" -mindepth 2 -maxdepth 2 -type d | sort
        )
        [[ ${#SEED_DIRS[@]} -gt 0 ]] || fail "No seed directories found under $DB_DIR/data"
    fi

    for dir in "${SEED_DIRS[@]}"; do
        rel="${dir#$DB_DIR/data/}"

        # Prefer the consolidated all-steps.sql when available
        if [[ -f "$dir/all-steps.sql" ]]; then
            step "Seeding '$rel' via all-steps.sql..."
            "${PSQL[@]}" "$DB_NAME" -f "$dir/all-steps.sql" \
                || fail "Seed failed: $dir/all-steps.sql"
            ok "Seeded '$rel'"
        else
            # Fall back to sorted individual step files
            mapfile -t STEP_FILES < <(
                find "$dir" -maxdepth 1 -name "step-*.sql" | sort -V
            )
            [[ ${#STEP_FILES[@]} -gt 0 ]] || { printf '  ⚠️  No SQL files in %s — skipping\n' "$rel"; continue; }
            step "Seeding '$rel' (${#STEP_FILES[@]} files)..."
            for sql_file in "${STEP_FILES[@]}"; do
                "${PSQL[@]}" "$DB_NAME" < "$sql_file" \
                    || fail "Seed failed: $sql_file"
            done
            ok "Seeded '$rel' (${#STEP_FILES[@]} files)"
        fi
    done
fi

# ── 6. Apply views (skipped with --seed-only) ─────────────────────────────────
if [[ "$SEED_ONLY" == false ]]; then
    step "Applying views..."
    "${PSQL[@]}" "$DB_NAME" < "$DB_DIR/views.sql" \
        || fail "Views failed — check $DB_DIR/views.sql"
    ok "Views applied"
fi

# ── Summary ───────────────────────────────────────────────────────────────────
printf '\n\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'
printf '  \033[0;32m✅ Done!\033[0m\n'
if [[ "$SEED_ONLY" == true ]]; then
    printf '     Seed data loaded into \033[1m%s\033[0m (schema untouched)\n' "$DB_NAME"
elif [[ "$SEED" == true ]]; then
    printf '     Schema + Data + Views loaded into \033[1m%s\033[0m\n' "$DB_NAME"
else
    printf '     Schema + Views loaded into \033[1m%s\033[0m\n' "$DB_NAME"
    printf '     Add \033[1m--seed\033[0m to also load content data\n'
fi
printf '\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n\n'
