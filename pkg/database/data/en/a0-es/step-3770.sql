-- ============================================================
-- Seed: A0 English Path – STEP 3770 – Reading – state simple requirements within own job area, for example 'I want to order 25 of
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3770, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'state simple requirements within own job area, for example ''I want to order 25 of', 'Práctica guiada de reading: state simple requirements within own job area, for example ''I want to order 25 of.', '{"instruction":"state simple requirements within own job area, for example ''I want to order 25 of","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
