-- ============================================================
-- Seed: A0 English Path – STEP 7060 – Reading – read the media for information quickly and with good understanding (Medios de Comunicación)
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
  VALUES (v_path_uuid, 7060, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'read the media for information quickly and with good understanding (Medios de Comunicación)', 'Práctica guiada de reading: read the media for information quickly and with good understanding (Medios de Comunicación).', '{"instruction":"read the media for information quickly and with good understanding (Medios de Comunicación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
