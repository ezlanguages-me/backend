-- ============================================================
-- Seed: A0 English Path – STEP 3810 – Reading – state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 3810, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de reading: state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación)).', '{"instruction":"state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación))","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
