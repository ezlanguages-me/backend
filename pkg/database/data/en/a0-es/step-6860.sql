-- ============================================================
-- Seed: A0 English Path – STEP 6860 – Listening – follow the plot of a film or play where action clearly illustrates the dialogue, for example a 'western' (Medios de Comunicación)
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
  VALUES (v_path_uuid, 6860, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'follow the plot of a film or play where action clearly illustrates the dialogue, for example a ''western'' (Medios de Comunicación)', 'Práctica de listening: follow the plot of a film or play where action clearly illustrates the dialogue, for example a ''western'' (Medios de Comunicación).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
