-- ============================================================
-- Seed: A0 English Path – STEP 2500 – Grammar – Órdenes y Sugerencias
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
  VALUES (v_path_uuid, 2500, 'en', 'grammar')
  RETURNING uuid INTO v_grammar_uuid;

  INSERT INTO grammar_translation (grammar_uuid, language, title, description, content)
  VALUES (
    v_grammar_uuid,
    'es',
    'Órdenes y Sugerencias',
    'Punto gramatical base: Órdenes y Sugerencias.',
    to_jsonb($content$# Órdenes y Sugerencias

Contenido pendiente.$content$::text)
  );
END;
$seed$;
