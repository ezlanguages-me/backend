-- ============================================================
-- Seed: A0 English Path – STEP 5780 – Reading – make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 5780, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites)', 'Práctica guiada de reading: make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites).', '{"instruction":"make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
