-- ============================================================
-- Seed: A0 English Path – STEP 9130 – Writing – make reasonably accurate notes at a meeting or seminar where the subject matter is familiar and predictable (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 9130, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'make reasonably accurate notes at a meeting or seminar where the subject matter is familiar and predictable (Reuniones y Presentaciones)', 'Práctica guiada de writing: make reasonably accurate notes at a meeting or seminar where the subject matter is familiar and predictable (Reuniones y Presentaciones).', '{"instruction":"make reasonably accurate notes at a meeting or seminar where the subject matter is familiar and predictable (Reuniones y Presentaciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
