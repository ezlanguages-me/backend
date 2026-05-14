-- ============================================================
-- Seed: A0 English Path – STEP 7340 – Reading – express opinions on abstract/cultural matters, and defend them (Socialización)
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
  VALUES (v_path_uuid, 7340, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'express opinions on abstract/cultural matters, and defend them (Socialización)', 'Práctica guiada de reading: express opinions on abstract/cultural matters, and defend them (Socialización).', '{"instruction":"express opinions on abstract/cultural matters, and defend them (Socialización)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
