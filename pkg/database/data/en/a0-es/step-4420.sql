-- ============================================================
-- Seed: A0 English Path – STEP 4420 – Writing – make notes for his/her own use on non-routine matters, such as a customer's requests (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_writing_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO writing (path_uuid, step_order, source_language, type, category)
  VALUES (v_path_uuid, 4420, 'en', 'writing', NULL)
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'make notes for his/her own use on non-routine matters, such as a customer''s requests (Servicios Laborales (Petición y Prestación))', 'Práctica guiada de writing: make notes for his/her own use on non-routine matters, such as a customer''s requests (Servicios Laborales (Petición y Prestación)).', '{"instruction":"make notes for his/her own use on non-routine matters, such as a customer''s requests (Servicios Laborales (Petición y Prestación))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
