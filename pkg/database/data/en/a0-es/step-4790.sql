-- ============================================================
-- Seed: A0 English Path – STEP 4790 – Speaking – take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)
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
  VALUES (v_path_uuid, 4790, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)', 'Práctica guiada de speaking: take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional).', '{"instruction":"take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
