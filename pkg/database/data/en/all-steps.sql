-- ============================================================================
-- all-steps.sql — Aggregator for the modern English seed corpus.
--
-- Location:  backend/pkg/database/data/en/all-steps.sql
-- Discovered by: scripts/db-reset.sh:154 (-mindepth 2 -maxdepth 2 -type d)
--                under pkg/database/data/.
--
-- Loader contract (scripts/db-reset.sh:164-167):
--     if [[ -f "$dir/all-steps.sql" ]]; then
--         psql ... -f "$dir/all-steps.sql"
--     fi
--
-- Each step file is a self-contained DO $seed$ ... $seed$ block.
-- ============================================================================

\set ON_ERROR_STOP on

BEGIN;

-- ---------------------------------------------------------------------------
-- Path bootstrap (defensive).
-- Modern files (0060/0070/0080) auto-create the path on NULL lookup.
-- 0010.sql and 0040.sql use SELECT INTO STRICT — hard-fail with NO_DATA_FOUND
-- if no path row exists. 0050.sql has no IF NULL guard. Creating the path
-- here, before any \ir, insulates every variant. WHERE NOT EXISTS provides
-- idempotency (path.source_language has no composite UNIQUE — schema.sql:114).
-- ---------------------------------------------------------------------------
INSERT INTO path (source_language)
SELECT 'en'
WHERE NOT EXISTS (
    SELECT 1 FROM path WHERE source_language = 'en' LIMIT 1
);

-- ---------------------------------------------------------------------------
-- Step files in zero-padded 4-digit step_order (steps.md:3).
-- Lexical sort -V order matches numeric step_order for this set.
--
-- Per-file idempotency posture:
--   0000.sql  partial (skips-if-exists deck, ON CONFLICT on translations)
--   0010.sql  NOT idempotent — pre-DELETE absent, ON CONFLICT absent
--   0040.sql  NOT idempotent — same as 0010.sql
--   0050.sql  purge-then-insert (DELETE FROM deck WHERE step_order=50)
--   0060.sql  purge-then-insert (DELETE FROM grammar WHERE step_order=60)
--   0070.sql  purge-then-insert + upsert deck_translation
--   0080.sql  purge-then-insert + upsert deck_translation
--
-- Re-running this aggregator after a successful seed is only safe for files
-- 0000/0050/0060/0070/0080; 0010/0040 will violate UNIQUE on re-run.
-- Use `make db-fresh` (drop + recreate) for repeatable full reseed.
-- ---------------------------------------------------------------------------
\ir 0000.sql
\ir 0010.sql
\ir 0040.sql
\ir 0050.sql
\ir 0060.sql
\ir 0070.sql
\ir 0080.sql

COMMIT;
