-- ============================================================
-- Seed: A0 English Path – STEP 1230 – Speaking – exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1230, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones)', 'Práctica guiada de speaking: exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones).', '{"instruction":"exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
