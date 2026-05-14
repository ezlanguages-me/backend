-- ============================================================
-- Seed: A0 English Path – STEP 6810 – Reading – keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Socialización)
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
  VALUES (v_path_uuid, 6810, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Socialización)', 'Práctica guiada de reading: keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Socialización).', '{"instruction":"keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Socialización)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
