-- ============================================================
-- Seed: A0 English Path – STEP 3450 – Reading – understand visuals if they are predictable and if understanding depends on simple keys that can be looked up in a dictionary (Textos, Ensayos e Investigación)
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
  VALUES (v_path_uuid, 3450, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand visuals if they are predictable and if understanding depends on simple keys that can be looked up in a dictionary (Textos, Ensayos e Investigación)', 'Práctica guiada de reading: understand visuals if they are predictable and if understanding depends on simple keys that can be looked up in a dictionary (Textos, Ensayos e Investigación).', '{"instruction":"understand visuals if they are predictable and if understanding depends on simple keys that can be looked up in a dictionary (Textos, Ensayos e Investigación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
