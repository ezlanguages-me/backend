-- ============================================================
-- Seed: A0 English Path – STEP 7670 – Reading – understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 7670, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones)', 'Práctica guiada de reading: understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones).', '{"instruction":"understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
