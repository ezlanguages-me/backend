-- ============================================================
-- Seed: A0 English Path – STEP 6770 – Reading – participate in a conversation in a casual or semi-formal situation for a short time (Socialización)
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
  VALUES (v_path_uuid, 6770, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'participate in a conversation in a casual or semi-formal situation for a short time (Socialización)', 'Práctica guiada de reading: participate in a conversation in a casual or semi-formal situation for a short time (Socialización).', '{"instruction":"participate in a conversation in a casual or semi-formal situation for a short time (Socialización)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
