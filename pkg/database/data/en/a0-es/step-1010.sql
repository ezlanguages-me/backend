-- ============================================================
-- Seed: A0 English Path – STEP 1010 – Speaking – check that all instructions are understood (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 1010, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'check that all instructions are understood (Gestión del Estudio y Trámites)', 'Práctica guiada de speaking: check that all instructions are understood (Gestión del Estudio y Trámites).', '{"instruction":"check that all instructions are understood (Gestión del Estudio y Trámites)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
