-- ============================================================
-- Seed: A0 English Path – STEP 460 – Reading – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
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
  VALUES (v_path_uuid, 460, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)', 'Práctica guiada de reading: understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres).', '{"instruction":"understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
