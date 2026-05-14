-- ============================================================
-- Seed: A0 English Path – STEP 410 – Speaking – make simple complaints, for example 'The water is cold' (Alojamiento)
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
  VALUES (v_path_uuid, 410, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'make simple complaints, for example ''The water is cold'' (Alojamiento)', 'Práctica guiada de speaking: make simple complaints, for example ''The water is cold'' (Alojamiento).', '{"instruction":"make simple complaints, for example ''The water is cold'' (Alojamiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
