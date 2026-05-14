-- ============================================================
-- Seed: A0 English Path – STEP 3800 – Speaking – state simple requirements within own job area, for example 'I want to order 25 of
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO speaking (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3800, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'state simple requirements within own job area, for example ''I want to order 25 of', 'Práctica guiada de speaking: state simple requirements within own job area, for example ''I want to order 25 of.', '{"instruction":"state simple requirements within own job area, for example ''I want to order 25 of","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
