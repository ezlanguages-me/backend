-- ============================================================
-- Seed: A0 English Path – STEP 5000 – Reading – understand some parts of a lecture, if the speaker makes careful adjustments for non-native speakers (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 5000, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand some parts of a lecture, if the speaker makes careful adjustments for non-native speakers (Conferencias, Seminarios y Clases)', 'Práctica guiada de reading: understand some parts of a lecture, if the speaker makes careful adjustments for non-native speakers (Conferencias, Seminarios y Clases).', '{"instruction":"understand some parts of a lecture, if the speaker makes careful adjustments for non-native speakers (Conferencias, Seminarios y Clases)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
