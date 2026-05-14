-- ============================================================
-- Seed: A0 English Path – STEP 6290 – Speaking – keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 6290, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Convivencia (Host Families y Vida Social))', 'Práctica guiada de speaking: keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Convivencia (Host Families y Vida Social)).', '{"instruction":"keep up a conversation on a fairly wide range of topics, e.g. personal and professional experiences, events currently in the news (Convivencia (Host Families y Vida Social))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
