-- ============================================================
-- Seed: A0 English Path – STEP 1410 – Listening – ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1410, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)', 'Práctica de listening: ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
