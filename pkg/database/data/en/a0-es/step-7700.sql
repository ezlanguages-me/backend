-- ============================================================
-- Seed: A0 English Path – STEP 7700 – Speaking – understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 7700, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones)', 'Práctica guiada de speaking: understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones).', '{"instruction":"understand the general meaning of a presentation made at a conference if language is simple and backed up by visuals or video (Reuniones y Presentaciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
