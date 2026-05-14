-- ============================================================
-- Seed: A0 English Path – STEP 1060 – Writing – cope with writing down changes to arrangements given by teachers and lecturers (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 1060, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'cope with writing down changes to arrangements given by teachers and lecturers (Gestión del Estudio y Trámites)', 'Práctica guiada de writing: cope with writing down changes to arrangements given by teachers and lecturers (Gestión del Estudio y Trámites).', '{"instruction":"cope with writing down changes to arrangements given by teachers and lecturers (Gestión del Estudio y Trámites)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
