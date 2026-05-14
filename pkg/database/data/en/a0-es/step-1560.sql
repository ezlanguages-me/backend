-- ============================================================
-- Seed: A0 English Path – STEP 1560 – Reading – understand where to go in a bank or post office by reading the signs (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1560, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand where to go in a bank or post office by reading the signs (Servicios Financieros y Postales)', 'Práctica guiada de reading: understand where to go in a bank or post office by reading the signs (Servicios Financieros y Postales).', '{"instruction":"understand where to go in a bank or post office by reading the signs (Servicios Financieros y Postales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
