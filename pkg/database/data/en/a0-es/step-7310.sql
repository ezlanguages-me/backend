-- ============================================================
-- Seed: A0 English Path – STEP 7310 – Listening – keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 7310, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))', 'Práctica de listening: keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social)).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
