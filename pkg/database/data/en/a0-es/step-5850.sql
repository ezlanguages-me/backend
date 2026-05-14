-- ============================================================
-- Seed: A0 English Path – STEP 5850 – Listening – establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alojamiento)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO listening (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 5850, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alojamiento)', 'Práctica de listening: establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alojamiento).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
