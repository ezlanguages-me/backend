-- ============================================================
-- Seed: A0 English Path – STEP 5310 – Writing – make accurate and complete notes during the course of a lecture, which meet requirements (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 5310, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'make accurate and complete notes during the course of a lecture, which meet requirements (Conferencias, Seminarios y Clases)', 'Práctica guiada de writing: make accurate and complete notes during the course of a lecture, which meet requirements (Conferencias, Seminarios y Clases).', '{"instruction":"make accurate and complete notes during the course of a lecture, which meet requirements (Conferencias, Seminarios y Clases)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
