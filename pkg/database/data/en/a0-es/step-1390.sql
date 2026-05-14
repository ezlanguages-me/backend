-- ============================================================
-- Seed: A0 English Path – STEP 1390 – Speaking – ask to change money at a bank (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1390, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask to change money at a bank (Servicios Financieros y Postales)', 'Práctica guiada de speaking: ask to change money at a bank (Servicios Financieros y Postales).', '{"instruction":"ask to change money at a bank (Servicios Financieros y Postales)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
