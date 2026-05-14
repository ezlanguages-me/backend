-- ============================================================
-- Seed: A0 English Path – STEP 740 – Listening – understand a simple phone message and confirm details of the message (Comunicación Telefónica y Correspondencia Personal)
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
  VALUES (v_path_uuid, 740, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand a simple phone message and confirm details of the message (Comunicación Telefónica y Correspondencia Personal)', 'Práctica de listening: understand a simple phone message and confirm details of the message (Comunicación Telefónica y Correspondencia Personal).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
