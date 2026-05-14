-- ============================================================
-- Seed: A0 English Path – STEP 7390 – Reading – express opinions in simple terms, for example, 'I don't agree', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 7390, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'express opinions in simple terms, for example, ''I don''t agree'', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones)', 'Práctica guiada de reading: express opinions in simple terms, for example, ''I don''t agree'', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones).', '{"instruction":"express opinions in simple terms, for example, ''I don''t agree'', provided that the question/issue has been put clearly and simply (Reuniones y Presentaciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
