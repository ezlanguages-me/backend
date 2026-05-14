-- ============================================================
-- Seed: A0 English Path – STEP 670 – Reading – understand basic hotel information, for example, times when meals are served (Alojamiento)
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
  VALUES (v_path_uuid, 670, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand basic hotel information, for example, times when meals are served (Alojamiento)', 'Práctica guiada de reading: understand basic hotel information, for example, times when meals are served (Alojamiento).', '{"instruction":"understand basic hotel information, for example, times when meals are served (Alojamiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
