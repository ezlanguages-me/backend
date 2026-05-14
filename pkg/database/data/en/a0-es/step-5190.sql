-- ============================================================
-- Seed: A0 English Path – STEP 5190 – Speaking – make decisions about what to note down and what to omit as the lecture proceeds (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 5190, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'make decisions about what to note down and what to omit as the lecture proceeds (Conferencias, Seminarios y Clases)', 'Práctica guiada de speaking: make decisions about what to note down and what to omit as the lecture proceeds (Conferencias, Seminarios y Clases).', '{"instruction":"make decisions about what to note down and what to omit as the lecture proceeds (Conferencias, Seminarios y Clases)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
