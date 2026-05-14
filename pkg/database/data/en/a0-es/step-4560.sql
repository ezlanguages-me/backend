-- ============================================================
-- Seed: A0 English Path – STEP 4560 – Writing – write any type of letter necessary in the course of his/her work (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4560, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write any type of letter necessary in the course of his/her work (Correspondencia e Informes Profesionales)', 'Práctica guiada de writing: write any type of letter necessary in the course of his/her work (Correspondencia e Informes Profesionales).', '{"instruction":"write any type of letter necessary in the course of his/her work (Correspondencia e Informes Profesionales)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
