-- ============================================================
-- Seed: A0 English Path – STEP 6120 – Reading – locate accommodation advertisements in newspapers and on notice boards and understand prices, contact names and numbers and locations (Alquileres)
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
  VALUES (v_path_uuid, 6120, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'locate accommodation advertisements in newspapers and on notice boards and understand prices, contact names and numbers and locations (Alquileres)', 'Práctica guiada de reading: locate accommodation advertisements in newspapers and on notice boards and understand prices, contact names and numbers and locations (Alquileres).', '{"instruction":"locate accommodation advertisements in newspapers and on notice boards and understand prices, contact names and numbers and locations (Alquileres)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
