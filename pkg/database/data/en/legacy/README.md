# Legacy seeds — DEPRECATED, do not load

This directory contains an archived seed corpus (`step-*.sql`, `all-steps.sql`)
that targets an **older schema**. It is kept for reference / diffing only.

## Why it's not loaded by `make dev`

`backend/scripts/db-reset.sh` excludes any path containing `/legacy/` from its
auto-discovery (`! -path '*/legacy/*'`). The schema has evolved since this
seed was generated and several `INSERT` statements here reference columns
that no longer exist (e.g. `word_translation(word_uuid, language, …)` instead
of the current `word_translation(source_word_uuid, target_word_uuid, …)`).
Loading it would fail with `column "word_uuid" does not exist`.

## The canonical seed

Use `../all-steps.sql` (the modern aggregator one level up). That is what
`make dev` / `SEED=1 make dev-up` loads by default.

## If you really need to load legacy

It will fail against the current schema. Don't.

To load a specific seed path explicitly:

```bash
./backend/scripts/db-reset.sh --seed-only --seed=en
```
