-- ============================================================
-- Seed: A0 English Path – STEP 1570 – Reading – CAN, with the help of bank personnel, complete a form, e.g. for the purpose of opening an account (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1570, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'CAN, with the help of bank personnel, complete a form, e.g. for the purpose of opening an account (Servicios Financieros y Postales)', 'Práctica guiada de reading: CAN, with the help of bank personnel, complete a form, e.g. for the purpose of opening an account (Servicios Financieros y Postales).', '{"instruction":"CAN, with the help of bank personnel, complete a form, e.g. for the purpose of opening an account (Servicios Financieros y Postales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
