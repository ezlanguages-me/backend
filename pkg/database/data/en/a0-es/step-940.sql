-- ============================================================
-- Seed: A0 English Path – STEP 940 – Reading – understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 940, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio y Trámites)', 'Práctica guiada de reading: understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio y Trámites).', '{"instruction":"understand instructions on classes and assignments given by teacher or lecturer (Gestión del Estudio y Trámites)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
