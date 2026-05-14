-- ============================================================
-- Seed: A0 English Path – STEP 7660 – Speaking – argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 7660, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones)', 'Práctica guiada de speaking: argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones).', '{"instruction":"argue effectively for or against a case, and has sufficient language to be able to talk about/discuss most aspects of her/his work (Reuniones y Presentaciones)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
