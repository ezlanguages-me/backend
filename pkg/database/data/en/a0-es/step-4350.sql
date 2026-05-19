-- ============================================================
-- Seed: A0 English Path – STEP 4350 – Listening – take and pass on most messages that are likely to require attention during a normal working day (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
  VALUES (v_path_uuid, 4350, 'en', 'listening', NULL, '')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description)
  VALUES (v_listening_uuid, 'es', 'take and pass on most messages that are likely to require attention during a normal working day (Servicios Laborales (Petición y Prestación))', 'Práctica de listening: take and pass on most messages that are likely to require attention during a normal working day (Servicios Laborales (Petición y Prestación)).');
END;
$seed$;
