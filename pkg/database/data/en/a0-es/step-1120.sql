-- ============================================================
-- Seed: A0 English Path – STEP 1120 – Reading – go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones)
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
  VALUES (v_path_uuid, 1120, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones)', 'Práctica guiada de reading: go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones).', '{"instruction":"go to a department store or other shop where goods are on display and ask for what (s)he wants (Compras y Transacciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
