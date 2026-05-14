-- ============================================================
-- Seed: A0 English Path – STEP 8770 – Reading – deal with complex or sensitive transactions, for example the export of an antique (Compras y Transacciones)
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
  VALUES (v_path_uuid, 8770, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'deal with complex or sensitive transactions, for example the export of an antique (Compras y Transacciones)', 'Práctica guiada de reading: deal with complex or sensitive transactions, for example the export of an antique (Compras y Transacciones).', '{"instruction":"deal with complex or sensitive transactions, for example the export of an antique (Compras y Transacciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
