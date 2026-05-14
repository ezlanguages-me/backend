-- ============================================================
-- Seed: A0 English Path – STEP 290 – Writing – express opinions of the 'I don't like..' type (Comunicación Telefónica y Correspondencia Personal)
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
  VALUES (v_path_uuid, 290, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'express opinions of the ''I don''t like..'' type (Comunicación Telefónica y Correspondencia Personal)', 'Práctica guiada de writing: express opinions of the ''I don''t like..'' type (Comunicación Telefónica y Correspondencia Personal).', '{"instruction":"express opinions of the ''I don''t like..'' type (Comunicación Telefónica y Correspondencia Personal)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
