-- ============================================================
-- Seed: A0 English Path – STEP 9180 – Writing – make notes that are useful to both her/himself and to colleagues, even where the subject matter is complex and/or unfamiliar (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 9180, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'make notes that are useful to both her/himself and to colleagues, even where the subject matter is complex and/or unfamiliar (Reuniones y Presentaciones)', 'Práctica guiada de writing: make notes that are useful to both her/himself and to colleagues, even where the subject matter is complex and/or unfamiliar (Reuniones y Presentaciones).', '{"instruction":"make notes that are useful to both her/himself and to colleagues, even where the subject matter is complex and/or unfamiliar (Reuniones y Presentaciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
