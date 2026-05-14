-- ============================================================
-- Seed: A0 English Path – STEP 4830 – Speaking – take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional)
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
  VALUES (v_path_uuid, 4830, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional)', 'Práctica guiada de speaking: take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional).', '{"instruction":"take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
