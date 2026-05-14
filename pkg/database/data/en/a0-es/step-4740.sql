-- ============================================================
-- Seed: A0 English Path – STEP 4740 – Writing – write a continuous set of instructions, for example a section of an operating manual, provided that they are simple and of limited length (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4740, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write a continuous set of instructions, for example a section of an operating manual, provided that they are simple and of limited length (Correspondencia e Informes Profesionales)', 'Práctica guiada de writing: write a continuous set of instructions, for example a section of an operating manual, provided that they are simple and of limited length (Correspondencia e Informes Profesionales).', '{"instruction":"write a continuous set of instructions, for example a section of an operating manual, provided that they are simple and of limited length (Correspondencia e Informes Profesionales)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
