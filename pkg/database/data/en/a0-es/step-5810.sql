-- ============================================================
-- Seed: A0 English Path – STEP 5810 – Speaking – make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO speaking (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 5810, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites)', 'Práctica guiada de speaking: make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites).', '{"instruction":"make all necessary arrangements regarding practical arrangements for study in or out of classroom with teachers, lecturers, lab and library staff, etc (Gestión del Estudio y Trámites)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
