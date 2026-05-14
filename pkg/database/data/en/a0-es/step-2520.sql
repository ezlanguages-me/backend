-- ============================================================
-- Seed: A0 English Path – STEP 2520 – Writing – enquire about the availability of services, for example facilities for the disabled, or special diets (Alojamiento)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_writing_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO writing (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 2520, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'enquire about the availability of services, for example facilities for the disabled, or special diets (Alojamiento)', 'Práctica guiada de writing: enquire about the availability of services, for example facilities for the disabled, or special diets (Alojamiento).', '{"instruction":"enquire about the availability of services, for example facilities for the disabled, or special diets (Alojamiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
