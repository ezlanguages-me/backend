-- ============================================================
-- Seed: A0 English Path – STEP 9120 – Speaking – advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 9120, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de speaking: advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations (Servicios Laborales (Petición y Prestación)).', '{"instruction":"advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
