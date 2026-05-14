-- ============================================================
-- Seed: A0 English Path – STEP 3360 – Writing – write letters of thanks, sympathy and congratulations (Comunicación Telefónica y Correspondencia Personal)
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
  VALUES (v_path_uuid, 3360, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write letters of thanks, sympathy and congratulations (Comunicación Telefónica y Correspondencia Personal)', 'Práctica guiada de writing: write letters of thanks, sympathy and congratulations (Comunicación Telefónica y Correspondencia Personal).', '{"instruction":"write letters of thanks, sympathy and congratulations (Comunicación Telefónica y Correspondencia Personal)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
