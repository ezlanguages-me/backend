-- ============================================================
-- Seed: A0 English Path – STEP 2160 – Reading – ask basic questions about the food in relation to the menu, and about the services available (Restauración)
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
  VALUES (v_path_uuid, 2160, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'ask basic questions about the food in relation to the menu, and about the services available (Restauración)', 'Práctica guiada de reading: ask basic questions about the food in relation to the menu, and about the services available (Restauración).', '{"instruction":"ask basic questions about the food in relation to the menu, and about the services available (Restauración)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
