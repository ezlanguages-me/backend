-- ============================================================
-- Seed: A0 English Path – STEP 9590 – Grammar – Big, Large and Great
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_grammar_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO grammar (path_uuid, step_order, source_language, type)
  VALUES (v_path_uuid, 9590, 'en', 'grammar')
  RETURNING uuid INTO v_grammar_uuid;

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar_uuid,
    'es',
    'Big, Large and Great',
    'Punto gramatical base: Big, Large and Great.',
    to_jsonb($content$# Big, Large and Great

Contenido pendiente.$content$::text)
  );
END;
$seed$;
