-- ============================================================
-- Seed: A0 English Path – STEP 2620 – Listening – understand simple questions and instructions, e.g. 'take this to a pharmacy', 'stay in bed' (Salud)
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
  VALUES (v_path_uuid, 2620, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand simple questions and instructions, e.g. ''take this to a pharmacy'', ''stay in bed'' (Salud)', 'Práctica de listening: understand simple questions and instructions, e.g. ''take this to a pharmacy'', ''stay in bed'' (Salud).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
