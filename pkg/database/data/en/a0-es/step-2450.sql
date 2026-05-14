-- ============================================================
-- Seed: A0 English Path – STEP 2450 – Reading – understand most of what is on a standard menu in predictable restaurants (Restauración)
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
  VALUES (v_path_uuid, 2450, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand most of what is on a standard menu in predictable restaurants (Restauración)', 'Práctica guiada de reading: understand most of what is on a standard menu in predictable restaurants (Restauración).', '{"instruction":"understand most of what is on a standard menu in predictable restaurants (Restauración)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
