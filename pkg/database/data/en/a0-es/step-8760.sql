-- ============================================================
-- Seed: A0 English Path – STEP 8760 – Speaking – bargain for what (s)he wants and reach an agreement (Compras y Transacciones)
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
  VALUES (v_path_uuid, 8760, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'bargain for what (s)he wants and reach an agreement (Compras y Transacciones)', 'Práctica guiada de speaking: bargain for what (s)he wants and reach an agreement (Compras y Transacciones).', '{"instruction":"bargain for what (s)he wants and reach an agreement (Compras y Transacciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
