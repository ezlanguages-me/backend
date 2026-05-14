-- ============================================================
-- Seed: A0 English Path – STEP 2350 – Speaking – maintain an interaction related to the nature and quality of the food (Restauración)
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
  VALUES (v_path_uuid, 2350, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'maintain an interaction related to the nature and quality of the food (Restauración)', 'Práctica guiada de speaking: maintain an interaction related to the nature and quality of the food (Restauración).', '{"instruction":"maintain an interaction related to the nature and quality of the food (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
