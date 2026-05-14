-- ============================================================
-- Seed: A0 English Path – STEP 6080 – Reading – Can state requirements, e.g. installing a telephone (Alquileres)
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
  VALUES (v_path_uuid, 6080, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'Can state requirements, e.g. installing a telephone (Alquileres)', 'Práctica guiada de reading: Can state requirements, e.g. installing a telephone (Alquileres).', '{"instruction":"Can state requirements, e.g. installing a telephone (Alquileres)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
