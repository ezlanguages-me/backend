-- ============================================================
-- Seed: A0 English Path – STEP 5350 – Speaking – understand and answer simple predictable questions (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 5350, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand and answer simple predictable questions (Conferencias, Seminarios y Clases)', 'Práctica guiada de speaking: understand and answer simple predictable questions (Conferencias, Seminarios y Clases).', '{"instruction":"understand and answer simple predictable questions (Conferencias, Seminarios y Clases)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
