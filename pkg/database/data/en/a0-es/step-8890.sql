-- ============================================================
-- Seed: A0 English Path – STEP 8890 – Reading – put her/his point across persuasively when talking, for example about a familiar product (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 8890, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'put her/his point across persuasively when talking, for example about a familiar product (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de reading: put her/his point across persuasively when talking, for example about a familiar product (Servicios Laborales (Petición y Prestación)).', '{"instruction":"put her/his point across persuasively when talking, for example about a familiar product (Servicios Laborales (Petición y Prestación))","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
