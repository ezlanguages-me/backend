-- ============================================================
-- Seed: A0 English Path – STEP 3240 – Speaking – call an emergency number, give location and ask for relevant service (Emergencias)
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
  VALUES (v_path_uuid, 3240, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'call an emergency number, give location and ask for relevant service (Emergencias)', 'Práctica guiada de speaking: call an emergency number, give location and ask for relevant service (Emergencias).', '{"instruction":"call an emergency number, give location and ask for relevant service (Emergencias)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
