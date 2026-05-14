-- ============================================================
-- Seed: A0 English Path – STEP 450 – Speaking – make a complaint about simple matters, for example 'The light in my room doesn't work.' (Alojamiento)
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
  VALUES (v_path_uuid, 450, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'make a complaint about simple matters, for example ''The light in my room doesn''t work.'' (Alojamiento)', 'Práctica guiada de speaking: make a complaint about simple matters, for example ''The light in my room doesn''t work.'' (Alojamiento).', '{"instruction":"make a complaint about simple matters, for example ''The light in my room doesn''t work.'' (Alojamiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
