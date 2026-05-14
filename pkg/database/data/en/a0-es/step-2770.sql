-- ============================================================
-- Seed: A0 English Path – STEP 2770 – Reading – enquire effectively about health services provided, entitlements and procedures involved (Salud)
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
  VALUES (v_path_uuid, 2770, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'enquire effectively about health services provided, entitlements and procedures involved (Salud)', 'Práctica guiada de reading: enquire effectively about health services provided, entitlements and procedures involved (Salud).', '{"instruction":"enquire effectively about health services provided, entitlements and procedures involved (Salud)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
