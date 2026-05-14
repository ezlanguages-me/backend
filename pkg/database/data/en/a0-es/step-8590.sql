-- ============================================================
-- Seed: A0 English Path – STEP 8590 – Writing – write a fully adequate account of an experiment, present a theoretical background and draw conclusions (Textos, Ensayos e Investigación)
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
  VALUES (v_path_uuid, 8590, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write a fully adequate account of an experiment, present a theoretical background and draw conclusions (Textos, Ensayos e Investigación)', 'Práctica guiada de writing: write a fully adequate account of an experiment, present a theoretical background and draw conclusions (Textos, Ensayos e Investigación).', '{"instruction":"write a fully adequate account of an experiment, present a theoretical background and draw conclusions (Textos, Ensayos e Investigación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
