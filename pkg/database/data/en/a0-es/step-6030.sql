-- ============================================================
-- Seed: A0 English Path – STEP 6030 – Speaking – establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)
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
  VALUES (v_path_uuid, 6030, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)', 'Práctica guiada de speaking: establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres).', '{"instruction":"establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
