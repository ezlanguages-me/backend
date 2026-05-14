-- ============================================================
-- Seed: A0 English Path – STEP 810 – Speaking – receive simple messages (Teléfono Profesional)
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
  VALUES (v_path_uuid, 810, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'receive simple messages (Teléfono Profesional)', 'Práctica guiada de speaking: receive simple messages (Teléfono Profesional).', '{"instruction":"receive simple messages (Teléfono Profesional)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
