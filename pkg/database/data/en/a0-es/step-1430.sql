-- ============================================================
-- Seed: A0 English Path – STEP 1430 – Speaking – ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1430, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)', 'Práctica guiada de speaking: ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales).', '{"instruction":"ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
