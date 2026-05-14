-- ============================================================
-- Seed: A0 English Path – STEP 3290 – Reading – give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias)
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
  VALUES (v_path_uuid, 3290, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias)', 'Práctica guiada de reading: give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias).', '{"instruction":"give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
