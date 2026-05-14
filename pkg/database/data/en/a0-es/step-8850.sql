-- ============================================================
-- Seed: A0 English Path – STEP 8850 – Reading – understand a tenancy agreement in detail, e.g. technical details and their legal implications (Alquileres)
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
  VALUES (v_path_uuid, 8850, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand a tenancy agreement in detail, e.g. technical details and their legal implications (Alquileres)', 'Práctica guiada de reading: understand a tenancy agreement in detail, e.g. technical details and their legal implications (Alquileres).', '{"instruction":"understand a tenancy agreement in detail, e.g. technical details and their legal implications (Alquileres)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
