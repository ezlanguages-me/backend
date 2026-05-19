#!/usr/bin/env bash
# db-grants.sh — Apply DML permissions to an existing database without resetting it.
#
# Use this to fix a "permission denied for table" error when the app user
# was not granted access after a schema reset.
#
# Usage:
#   ./scripts/db-grants.sh                   # grants to DB_USER from .env
#   APP_USER=api_user ./scripts/db-grants.sh # explicit app user
#
# The script connects as DB_USER (superuser) to apply the grants.
# Override via env:
#   DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME, APP_USER

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DB_DIR="$BACKEND_DIR/pkg/database"
ENV_FILE="$BACKEND_DIR/services/api/.env"

# Load DB-related vars from .env (only if not already set).
if [ -f "$ENV_FILE" ]; then
    while IFS='=' read -r key value; do
        [[ "$key" =~ ^#|^[[:space:]]*$ ]] && continue
        key="${key%%[[:space:]]*}"
        value="${value%%[[:space:]]*}"
        [[ -z "${!key+x}" ]] && export "$key=$value"
    done < <(grep -E "^(DB_|MASTER_POSTGRES_DNS)" "$ENV_FILE")
fi

DB_HOST="${DB_HOST:-${MASTER_POSTGRES_DNS:-localhost}}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-postgres}"
DB_NAME="${DB_NAME:-ezlanguages}"
APP_USER="${APP_USER:-${DB_APP_USER:-$DB_USER}}"
export PGPASSWORD="${DB_PASSWORD:-}"

PSQL=(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" --set ON_ERROR_STOP=1)

printf '\n\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'
printf '\033[1m  DB Grants: \033[0;33m%s\033[0m on \033[0;33m%s\033[0m @ \033[0;33m%s:%s\033[0m\n' \
    "$APP_USER" "$DB_NAME" "$DB_HOST" "$DB_PORT"
printf '\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n\n'

printf '\033[0;34m▶\033[0m Granting CONNECT on database...\n'
"${PSQL[@]}" postgres -c "GRANT CONNECT ON DATABASE \"$DB_NAME\" TO \"$APP_USER\";"
printf '  \033[0;32m✅ Done\033[0m\n'

printf '\033[0;34m▶\033[0m Applying table/sequence grants...\n'
"${PSQL[@]}" "$DB_NAME" -v app_user="$APP_USER" -f "$DB_DIR/grants.sql"
printf '  \033[0;32m✅ Done\033[0m\n'

printf '\n\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'
printf '  \033[0;32m✅ Grants applied for \033[1m%s\033[0;32m on \033[1m%s\033[0m\n' \
    "$APP_USER" "$DB_NAME"
printf '\033[1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n\n'
