-- Seed maestro generado desde ordered-steps-table.md.
-- Incluye inserts minimos por step para deck, grammar, listening, reading, dialogue, writing y speaking.
-- Ejecucion: psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f pkg/database/data/en/a0-es/all-steps.sql

\set ON_ERROR_STOP on

BEGIN;

-- Ensure the English path exists before seeding steps
INSERT INTO path (source_language)
SELECT 'en'
WHERE NOT EXISTS (SELECT 1 FROM path WHERE source_language = 'en');

\ir step-000.sql
\ir step-005.sql
\ir step-010.sql
\ir step-020.sql
\ir step-030.sql
\ir step-040.sql
\ir step-050.sql
\ir step-055.sql
\ir step-060.sql
\ir step-065.sql
\ir step-090.sql
\ir step-100.sql
\ir step-110.sql
\ir step-120.sql
\ir step-130.sql
\ir step-140.sql
\ir step-150.sql
\ir step-155.sql
\ir step-160.sql
\ir step-165.sql
\ir step-170.sql
\ir step-180.sql
\ir step-190.sql
\ir step-200.sql
\ir step-210.sql
\ir step-220.sql
\ir step-230.sql
\ir step-240.sql
\ir step-245.sql
\ir step-246.sql
\ir step-250.sql
\ir step-260.sql
\ir step-270.sql
\ir step-280.sql
\ir step-290.sql
\ir step-300.sql
\ir step-310.sql
\ir step-315.sql
\ir step-320.sql
\ir step-330.sql
\ir step-340.sql
\ir step-350.sql
\ir step-360.sql
\ir step-370.sql
\ir step-380.sql
\ir step-390.sql
\ir step-400.sql
\ir step-410.sql
\ir step-420.sql
\ir step-430.sql
\ir step-440.sql
\ir step-450.sql
\ir step-460.sql
\ir step-470.sql
\ir step-480.sql
\ir step-490.sql
\ir step-500.sql
\ir step-510.sql
\ir step-520.sql
\ir step-530.sql
\ir step-540.sql
\ir step-550.sql
\ir step-560.sql
\ir step-570.sql
\ir step-575.sql
\ir step-580.sql
\ir step-590.sql
\ir step-600.sql
\ir step-610.sql
\ir step-620.sql
\ir step-640.sql
\ir step-650.sql
\ir step-660.sql
\ir step-670.sql
\ir step-680.sql
\ir step-685.sql
\ir step-690.sql
\ir step-700.sql
\ir step-710.sql
\ir step-720.sql
\ir step-730.sql
\ir step-740.sql
\ir step-750.sql
\ir step-760.sql
\ir step-770.sql
\ir step-780.sql
\ir step-790.sql
\ir step-800.sql
\ir step-810.sql
\ir step-820.sql
\ir step-830.sql
\ir step-840.sql
\ir step-850.sql
\ir step-855.sql
\ir step-860.sql
\ir step-870.sql
\ir step-880.sql
\ir step-890.sql
\ir step-900.sql
\ir step-910.sql
\ir step-920.sql
\ir step-930.sql
\ir step-940.sql
\ir step-950.sql
\ir step-960.sql
\ir step-970.sql
\ir step-980.sql
\ir step-990.sql
\ir step-1000.sql

COMMIT;
