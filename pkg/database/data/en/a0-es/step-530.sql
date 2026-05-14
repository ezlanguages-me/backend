-- ============================================================
-- Seed: A0 English Path – STEP 530 – Speaking – make a simple complaint, for example 'The cooker is broken. Can you replace it?' (Alquileres)
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
  VALUES (v_path_uuid, 530, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'make a simple complaint, for example ''The cooker is broken. Can you replace it?'' (Alquileres)', 'Práctica guiada de speaking: make a simple complaint, for example ''The cooker is broken. Can you replace it?'' (Alquileres).', '{"instruction":"make a simple complaint, for example ''The cooker is broken. Can you replace it?'' (Alquileres)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
