-- ============================================================
-- Seed: A0 English Path – STEP 1600 – Reading – understand most routine bank literature and written communications received from a bank (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1600, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand most routine bank literature and written communications received from a bank (Servicios Financieros y Postales)', 'Práctica guiada de reading: understand most routine bank literature and written communications received from a bank (Servicios Financieros y Postales).', '{"instruction":"understand most routine bank literature and written communications received from a bank (Servicios Financieros y Postales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
