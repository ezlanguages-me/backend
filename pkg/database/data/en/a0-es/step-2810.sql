-- ============================================================
-- Seed: A0 English Path – STEP 2810 – Reading – describe non-visible symptoms such as different kinds of pain (Salud)
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
  VALUES (v_path_uuid, 2810, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'describe non-visible symptoms such as different kinds of pain (Salud)', 'Práctica guiada de reading: describe non-visible symptoms such as different kinds of pain (Salud).', '{"instruction":"describe non-visible symptoms such as different kinds of pain (Salud)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
