-- ============================================================
-- Seed: A0 English Path – STEP 3690 – Grammar – Used To
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
  VALUES (v_path_uuid, 3690, 'en', 'grammar')
  RETURNING uuid INTO v_grammar_uuid;

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar_uuid,
    'es',
    'Used To',
    'Punto gramatical base: Used To.',
    to_jsonb($content$# Used To

Contenido pendiente.$content$::text)
  );
END;
$seed$;
