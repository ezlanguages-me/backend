-- ============================================================
-- Seed: A0 English Path – STEP 1190 – Speaking – ask for what is required, if it is something which the shopkeeper can readily understand (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1190, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask for what is required, if it is something which the shopkeeper can readily understand (Compras y Transacciones)', 'Práctica guiada de speaking: ask for what is required, if it is something which the shopkeeper can readily understand (Compras y Transacciones).', '{"instruction":"ask for what is required, if it is something which the shopkeeper can readily understand (Compras y Transacciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
