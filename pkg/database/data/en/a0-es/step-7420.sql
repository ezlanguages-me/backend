-- ============================================================
-- Seed: A0 English Path – STEP 7420 – Speaking – express opinions in simple terms, for example, 'I don't agree', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 7420, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'express opinions in simple terms, for example, ''I don''t agree'', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones)', 'Práctica guiada de speaking: express opinions in simple terms, for example, ''I don''t agree'', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones).', '{"instruction":"express opinions in simple terms, for example, ''I don''t agree'', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
