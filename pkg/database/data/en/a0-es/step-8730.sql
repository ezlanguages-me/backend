-- ============================================================
-- Seed: A0 English Path – STEP 8730 – Reading – bargain for what (s)he wants and reach an agreement (Compras y Transacciones)
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
  VALUES (v_path_uuid, 8730, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'bargain for what (s)he wants and reach an agreement (Compras y Transacciones)', 'Práctica guiada de reading: bargain for what (s)he wants and reach an agreement (Compras y Transacciones).', '{"instruction":"bargain for what (s)he wants and reach an agreement (Compras y Transacciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
