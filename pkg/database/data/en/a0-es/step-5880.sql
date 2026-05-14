-- ============================================================
-- Seed: A0 English Path – STEP 5880 – Reading – deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento)
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
  VALUES (v_path_uuid, 5880, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento)', 'Práctica guiada de reading: deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento).', '{"instruction":"deal with most situations likely to arise in a hotel, such as messages, ordering, etc (Alojamiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
