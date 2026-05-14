-- ============================================================
-- Seed: A0 English Path – STEP 3320 – Speaking – give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO speaking (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3320, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias)', 'Práctica guiada de speaking: give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias).', '{"instruction":"give a report of an emergency incident, e.g. describe the circumstances of a theft to the police, give details of vehicle breakdown (Emergencias)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
