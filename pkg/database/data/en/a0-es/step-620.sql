-- ============================================================
-- Seed: A0 English Path – STEP 620 – Writing – leave a simple message for host family saying, for example, where (s)he has gone, what time (s)he will be back (Convivencia (Host Families y Vida Social))
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_writing_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO writing (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 620, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'leave a simple message for host family saying, for example, where (s)he has gone, what time (s)he will be back (Convivencia (Host Families y Vida Social))', 'Práctica guiada de writing: leave a simple message for host family saying, for example, where (s)he has gone, what time (s)he will be back (Convivencia (Host Families y Vida Social)).', '{"instruction":"leave a simple message for host family saying, for example, where (s)he has gone, what time (s)he will be back (Convivencia (Host Families y Vida Social))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
