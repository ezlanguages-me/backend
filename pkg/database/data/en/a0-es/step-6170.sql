-- ============================================================
-- Seed: A0 English Path – STEP 6170 – Writing – write most letters that (s)he will need in order to find satisfactory accommodation (Alquileres)
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
  VALUES (v_path_uuid, 6170, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write most letters that (s)he will need in order to find satisfactory accommodation (Alquileres)', 'Práctica guiada de writing: write most letters that (s)he will need in order to find satisfactory accommodation (Alquileres).', '{"instruction":"write most letters that (s)he will need in order to find satisfactory accommodation (Alquileres)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
