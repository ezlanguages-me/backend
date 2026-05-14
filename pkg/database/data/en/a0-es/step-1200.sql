-- ============================================================
-- Seed: A0 English Path – STEP 1200 – Reading – exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1200, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones)', 'Práctica guiada de reading: exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones).', '{"instruction":"exchange basic information, related to place in the queue, etc., with other customers (Compras y Transacciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
