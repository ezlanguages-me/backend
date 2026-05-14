-- ============================================================
-- Seed: A0 English Path – STEP 2580 – Listening – indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud)
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
  VALUES (v_path_uuid, 2580, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud)', 'Práctica de listening: indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
