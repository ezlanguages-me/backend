-- ============================================================
-- Seed: A0 English Path – STEP 1310 – Speaking – understand where the shopkeeper explains the difference between two or more products all serving the same basic purpose (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1310, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand where the shopkeeper explains the difference between two or more products all serving the same basic purpose (Compras y Transacciones)', 'Práctica guiada de speaking: understand where the shopkeeper explains the difference between two or more products all serving the same basic purpose (Compras y Transacciones).', '{"instruction":"understand where the shopkeeper explains the difference between two or more products all serving the same basic purpose (Compras y Transacciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
