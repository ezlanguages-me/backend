-- ============================================================
-- Seed: A0 English Path – STEP 1030 – Reading – read all information related to practical arrangements for study which teachers or lecturers are likely to write (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 1030, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'read all information related to practical arrangements for study which teachers or lecturers are likely to write (Gestión del Estudio y Trámites)', 'Práctica guiada de reading: read all information related to practical arrangements for study which teachers or lecturers are likely to write (Gestión del Estudio y Trámites).', '{"instruction":"read all information related to practical arrangements for study which teachers or lecturers are likely to write (Gestión del Estudio y Trámites)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
