-- ============================================================
-- Seed: A0 English Path – STEP 4390 – Writing – note down simple, predictable instructions/requests, for example the quantity required by a client, delivery date etc (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 4390, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'note down simple, predictable instructions/requests, for example the quantity required by a client, delivery date etc (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de writing: note down simple, predictable instructions/requests, for example the quantity required by a client, delivery date etc (Servicios Laborales (Petición y Prestación)).', '{"instruction":"note down simple, predictable instructions/requests, for example the quantity required by a client, delivery date etc (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
