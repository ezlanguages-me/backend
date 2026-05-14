-- ============================================================
-- Seed: A0 English Path – STEP 680 – Reading – understand timetables, flight arrival and departure screens, etc (Viajes y Transporte)
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
  VALUES (v_path_uuid, 680, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand timetables, flight arrival and departure screens, etc (Viajes y Transporte)', 'Práctica guiada de reading: understand timetables, flight arrival and departure screens, etc (Viajes y Transporte).', '{"instruction":"understand timetables, flight arrival and departure screens, etc (Viajes y Transporte)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
