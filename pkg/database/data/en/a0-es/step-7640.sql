-- ============================================================
-- Seed: A0 English Path – STEP 7640 – Listening – argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO listening (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 7640, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones)', 'Práctica de listening: argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
