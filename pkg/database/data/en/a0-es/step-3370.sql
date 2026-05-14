-- ============================================================
-- Seed: A0 English Path – STEP 3370 – Writing – write a simple narrative or description, for example, 'My last holiday', with some inaccuracies in vocabulary and grammar (Textos, Ensayos e Investigación)
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
  VALUES (v_path_uuid, 3370, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write a simple narrative or description, for example, ''My last holiday'', with some inaccuracies in vocabulary and grammar (Textos, Ensayos e Investigación)', 'Práctica guiada de writing: write a simple narrative or description, for example, ''My last holiday'', with some inaccuracies in vocabulary and grammar (Textos, Ensayos e Investigación).', '{"instruction":"write a simple narrative or description, for example, ''My last holiday'', with some inaccuracies in vocabulary and grammar (Textos, Ensayos e Investigación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
