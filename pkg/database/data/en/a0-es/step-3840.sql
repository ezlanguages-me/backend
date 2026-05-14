-- ============================================================
-- Seed: A0 English Path – STEP 3840 – Speaking – state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 3840, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de speaking: state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación)).', '{"instruction":"state routine requirements within own area of work (e.g. asking for typing to be done) (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
