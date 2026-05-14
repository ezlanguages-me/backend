-- ============================================================
-- Seed: A0 English Path – STEP 2860 – Reading – identify an off-the-shelf medicine suitable for common complaints as sold by a chemist (Salud)
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
  VALUES (v_path_uuid, 2860, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'identify an off-the-shelf medicine suitable for common complaints as sold by a chemist (Salud)', 'Práctica guiada de reading: identify an off-the-shelf medicine suitable for common complaints as sold by a chemist (Salud).', '{"instruction":"identify an off-the-shelf medicine suitable for common complaints as sold by a chemist (Salud)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
