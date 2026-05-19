-- grants.sql — DML permissions for the application user.
--
-- Run via db-reset.sh (applied automatically) or db-grants.sh (standalone).
-- Pass the application user with: psql -v app_user=<username>
--
-- Example:
--   psql -h localhost -U postgres -d ezlanguages \
--     -v app_user=juanca -f pkg/database/grants.sql

GRANT USAGE ON SCHEMA public TO :"app_user";

GRANT SELECT, INSERT, UPDATE, DELETE
  ON ALL TABLES IN SCHEMA public
  TO :"app_user";

GRANT USAGE, SELECT
  ON ALL SEQUENCES IN SCHEMA public
  TO :"app_user";

-- Ensure future tables/sequences created by migrations are also covered.
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO :"app_user";

ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO :"app_user";
