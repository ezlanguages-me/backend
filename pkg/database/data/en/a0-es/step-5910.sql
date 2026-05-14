-- ============================================================
-- Seed: A0 English Path – STEP 5910 – Speaking – deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento)
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
  VALUES (v_path_uuid, 5910, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento)', 'Práctica guiada de speaking: deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento).', '{"instruction":"deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
