-- ============================================================
-- Seed: A0 English Path – STEP 8690 – Reading – ask effectively for refund or exchange of faulty or unwanted goods (Compras y Transacciones)
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
  VALUES (v_path_uuid, 8690, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'ask effectively for refund or exchange of faulty or unwanted goods (Compras y Transacciones)', 'Práctica guiada de reading: ask effectively for refund or exchange of faulty or unwanted goods (Compras y Transacciones).', '{"instruction":"ask effectively for refund or exchange of faulty or unwanted goods (Compras y Transacciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
