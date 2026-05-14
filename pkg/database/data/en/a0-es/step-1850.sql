-- ============================================================
-- Seed: A0 English Path – STEP 1850 – Speaking – bargain in the market place where what is purchased is a relatively straightforward item (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1850, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'bargain in the market place where what is purchased is a relatively straightforward item (Compras y Transacciones)', 'Práctica guiada de speaking: bargain in the market place where what is purchased is a relatively straightforward item (Compras y Transacciones).', '{"instruction":"bargain in the market place where what is purchased is a relatively straightforward item (Compras y Transacciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
