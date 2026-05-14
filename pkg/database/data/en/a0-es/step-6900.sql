-- ============================================================
-- Seed: A0 English Path – STEP 6900 – Listening – identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación)
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
  VALUES (v_path_uuid, 6900, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación)', 'Práctica de listening: identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
