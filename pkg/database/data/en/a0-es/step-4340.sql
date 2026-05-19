-- ============================================================
-- Seed: A0 English Path – STEP 4340 – Reading – take and pass on most messages that are likely to require attention during a normal working day (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
  VALUES (v_path_uuid, 4340, 'en', 'reading', NULL, '')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'take and pass on most messages that are likely to require attention during a normal working day (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de reading: take and pass on most messages that are likely to require attention during a normal working day (Servicios Laborales (Petición y Prestación)).');
END;
$seed$;
