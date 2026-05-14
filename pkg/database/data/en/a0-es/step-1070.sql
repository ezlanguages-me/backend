-- ============================================================
-- Seed: A0 English Path – STEP 1070 – Writing – write down details of all standard arrangements for assignments to be handed in, etc., as given verbally or in notices by teachers and lecturers (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 1070, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write down details of all standard arrangements for assignments to be handed in, etc., as given verbally or in notices by teachers and lecturers (Gestión del Estudio y Trámites)', 'Práctica guiada de writing: write down details of all standard arrangements for assignments to be handed in, etc., as given verbally or in notices by teachers and lecturers (Gestión del Estudio y Trámites).', '{"instruction":"write down details of all standard arrangements for assignments to be handed in, etc., as given verbally or in notices by teachers and lecturers (Gestión del Estudio y Trámites)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
