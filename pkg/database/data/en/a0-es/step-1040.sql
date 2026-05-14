-- ============================================================
-- Seed: A0 English Path – STEP 1040 – Writing – copy times, dates and places from notices on classroom board or notice board (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_writing_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO writing (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 1040, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'copy times, dates and places from notices on classroom board or notice board (Gestión del Estudio y Trámites)', 'Práctica guiada de writing: copy times, dates and places from notices on classroom board or notice board (Gestión del Estudio y Trámites).', '{"instruction":"copy times, dates and places from notices on classroom board or notice board (Gestión del Estudio y Trámites)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
