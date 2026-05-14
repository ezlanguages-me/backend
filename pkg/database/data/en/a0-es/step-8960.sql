-- ============================================================
-- Seed: A0 English Path – STEP 8960 – Speaking – ask questions outside own immediate area of work (e.g. asking for external legal or financial advice) (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 8960, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask questions outside own immediate area of work (e.g. asking for external legal or financial advice) (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de speaking: ask questions outside own immediate area of work (e.g. asking for external legal or financial advice) (Servicios Laborales (Petición y Prestación)).', '{"instruction":"ask questions outside own immediate area of work (e.g. asking for external legal or financial advice) (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
