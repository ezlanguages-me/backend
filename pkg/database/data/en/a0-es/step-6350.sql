-- ============================================================
-- Seed: A0 English Path – STEP 6350 – Writing – write letters on a limited range of predictable topics related to personal experience (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 6350, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'write letters on a limited range of predictable topics related to personal experience (Convivencia (Host Families y Vida Social))', 'Práctica guiada de writing: write letters on a limited range of predictable topics related to personal experience (Convivencia (Host Families y Vida Social)).', '{"instruction":"write letters on a limited range of predictable topics related to personal experience (Convivencia (Host Families y Vida Social))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
