-- ============================================================
-- Seed: A0 English Path – STEP 2700 – Listening – explain what is wrong in straightforward terms at a chemist's, doctor's, hospital or dentist's, especially if symptoms are visible (Salud)
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
  VALUES (v_path_uuid, 2700, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud)', 'Práctica de listening: explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
