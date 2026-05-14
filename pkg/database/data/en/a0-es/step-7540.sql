-- ============================================================
-- Seed: A0 English Path – STEP 7540 – Speaking – express her/his own opinion, and present arguments to a limited extent (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 7540, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'express her/his own opinion, and present arguments to a limited extent (Reuniones y Presentaciones)', 'Práctica guiada de speaking: express her/his own opinion, and present arguments to a limited extent (Reuniones y Presentaciones).', '{"instruction":"express her/his own opinion, and present arguments to a limited extent (Reuniones y Presentaciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
