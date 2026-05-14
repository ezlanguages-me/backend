-- ============================================================
-- Seed: A0 English Path – STEP 3210 – Reading – call an emergency number, give location and ask for relevant service (Emergencias)
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
  VALUES (v_path_uuid, 3210, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'call an emergency number, give location and ask for relevant service (Emergencias)', 'Práctica guiada de reading: call an emergency number, give location and ask for relevant service (Emergencias).', '{"instruction":"call an emergency number, give location and ask for relevant service (Emergencias)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
