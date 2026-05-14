-- ============================================================
-- Seed: A0 English Path – STEP 4870 – Speaking – use the telephone for most purposes (Teléfono Profesional)
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
  VALUES (v_path_uuid, 4870, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'use the telephone for most purposes (Teléfono Profesional)', 'Práctica guiada de speaking: use the telephone for most purposes (Teléfono Profesional).', '{"instruction":"use the telephone for most purposes (Teléfono Profesional)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
