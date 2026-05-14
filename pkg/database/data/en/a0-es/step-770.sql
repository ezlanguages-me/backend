-- ============================================================
-- Seed: A0 English Path – STEP 770 – Writing – leave a simple message giving information on e.g. where he/she has gone, what time he/she will be back (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 770, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'leave a simple message giving information on e.g. where he/she has gone, what time he/she will be back (Correspondencia e Informes Profesionales)', 'Práctica guiada de writing: leave a simple message giving information on e.g. where he/she has gone, what time he/she will be back (Correspondencia e Informes Profesionales).', '{"instruction":"leave a simple message giving information on e.g. where he/she has gone, what time he/she will be back (Correspondencia e Informes Profesionales)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
