-- ============================================================
-- Seed: A0 English Path – STEP 3990 – Writing – write requests for goods, services, etc. on a range of routine matters, but MAY need to get these checked (Servicios Laborales (Petición y Prestación))
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
  VALUES (v_path_uuid, 3990, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write requests for goods, services, etc. on a range of routine matters, but MAY need to get these checked (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de writing: write requests for goods, services, etc. on a range of routine matters, but MAY need to get these checked (Servicios Laborales (Petición y Prestación)).', '{"instruction":"write requests for goods, services, etc. on a range of routine matters, but MAY need to get these checked (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
