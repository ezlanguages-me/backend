-- ============================================================
-- Seed: A0 English Path – STEP 6130 – Reading – extract basic information from a tenancy agreement, for example cost per week (Alquileres)
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
  VALUES (v_path_uuid, 6130, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'extract basic information from a tenancy agreement, for example cost per week (Alquileres)', 'Práctica guiada de reading: extract basic information from a tenancy agreement, for example cost per week (Alquileres).', '{"instruction":"extract basic information from a tenancy agreement, for example cost per week (Alquileres)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
