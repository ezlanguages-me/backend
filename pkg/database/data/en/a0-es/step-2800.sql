-- ============================================================
-- Seed: A0 English Path – STEP 2800 – Speaking – enquire effectively about health services provided, entitlements and procedures involved (Salud)
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
  VALUES (v_path_uuid, 2800, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'enquire effectively about health services provided, entitlements and procedures involved (Salud)', 'Práctica guiada de speaking: enquire effectively about health services provided, entitlements and procedures involved (Salud).', '{"instruction":"enquire effectively about health services provided, entitlements and procedures involved (Salud)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
