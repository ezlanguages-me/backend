-- ============================================================
-- Seed: A0 English Path – STEP 5280 – Writing – write down some information at a lecture, if this is more or less dictated or written on the board (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 5280, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write down some information at a lecture, if this is more or less dictated or written on the board (Conferencias, Seminarios y Clases)', 'Práctica guiada de writing: write down some information at a lecture, if this is more or less dictated or written on the board (Conferencias, Seminarios y Clases).', '{"instruction":"write down some information at a lecture, if this is more or less dictated or written on the board (Conferencias, Seminarios y Clases)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
