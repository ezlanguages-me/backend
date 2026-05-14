-- ============================================================
-- Seed: A0 English Path – STEP 8190 – Reading – take a limited part in a seminar or tutorial, provided that this is conducted sympathetically, using simple language (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 8190, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'take a limited part in a seminar or tutorial, provided that this is conducted sympathetically, using simple language (Conferencias, Seminarios y Clases)', 'Práctica guiada de reading: take a limited part in a seminar or tutorial, provided that this is conducted sympathetically, using simple language (Conferencias, Seminarios y Clases).', '{"instruction":"take a limited part in a seminar or tutorial, provided that this is conducted sympathetically, using simple language (Conferencias, Seminarios y Clases)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
