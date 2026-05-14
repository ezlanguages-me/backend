-- ============================================================
-- Seed: A0 English Path – STEP 1440 – Reading – ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1440, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales)', 'Práctica guiada de reading: ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales).', '{"instruction":"ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
