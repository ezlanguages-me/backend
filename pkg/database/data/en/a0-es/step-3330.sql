-- ============================================================
-- Seed: A0 English Path – STEP 3330 – Reading – understand notices describing emergency services and how to call them (Emergencias)
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
  VALUES (v_path_uuid, 3330, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand notices describing emergency services and how to call them (Emergencias)', 'Práctica guiada de reading: understand notices describing emergency services and how to call them (Emergencias).', '{"instruction":"understand notices describing emergency services and how to call them (Emergencias)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
