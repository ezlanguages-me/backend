-- ============================================================
-- Seed: A0 English Path – STEP 4470 – Reading – understand and act on a standard letter, for example an order, within own work area (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4470, 'en', 'reading', NULL, '')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description)
  VALUES (v_reading_uuid, 'es', 'understand and act on a standard letter, for example an order, within own work area (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: understand and act on a standard letter, for example an order, within own work area (Correspondencia e Informes Profesionales).');
END;
$seed$;
