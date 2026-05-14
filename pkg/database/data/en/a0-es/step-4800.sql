-- ============================================================
-- Seed: A0 English Path – STEP 4800 – Reading – take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 4800, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional)', 'Práctica guiada de reading: take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional).', '{"instruction":"take or leave routine messages, ask for clarification or elaboration where these are not expressed clearly (Teléfono Profesional)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
