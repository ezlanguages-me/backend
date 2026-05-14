-- ============================================================
-- Seed: A0 English Path – STEP 2000 – Reading – ask simple questions about the menu and understand simple answers (Restauración)
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
  VALUES (v_path_uuid, 2000, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'ask simple questions about the menu and understand simple answers (Restauración)', 'Práctica guiada de reading: ask simple questions about the menu and understand simple answers (Restauración).', '{"instruction":"ask simple questions about the menu and understand simple answers (Restauración)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
