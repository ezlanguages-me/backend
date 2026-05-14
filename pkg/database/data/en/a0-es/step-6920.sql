-- ============================================================
-- Seed: A0 English Path – STEP 6920 – Speaking – identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación)
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
  VALUES (v_path_uuid, 6920, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación)', 'Práctica guiada de speaking: identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación).', '{"instruction":"identify the main topic of, for example, a news broadcast on TV where there is a strong visual element (Medios de Comunicación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
