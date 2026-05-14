-- ============================================================
-- Seed: A0 English Path – STEP 9680 – Reading – get the point of jokes or allusions with cultural content (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 9680, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'get the point of jokes or allusions with cultural content (Conferencias, Seminarios y Clases)', 'Práctica guiada de reading: get the point of jokes or allusions with cultural content (Conferencias, Seminarios y Clases).', '{"instruction":"get the point of jokes or allusions with cultural content (Conferencias, Seminarios y Clases)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
