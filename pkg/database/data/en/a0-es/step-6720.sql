-- ============================================================
-- Seed: A0 English Path – STEP 6720 – Reading – read descriptive notes on museum exhibits, and explanatory boards in exhibitions (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6720, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'read descriptive notes on museum exhibits, and explanatory boards in exhibitions (Turismo y Entretenimiento)', 'Práctica guiada de reading: read descriptive notes on museum exhibits, and explanatory boards in exhibitions (Turismo y Entretenimiento).', '{"instruction":"read descriptive notes on museum exhibits, and explanatory boards in exhibitions (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
