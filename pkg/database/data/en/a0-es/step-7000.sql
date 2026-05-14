-- ============================================================
-- Seed: A0 English Path – STEP 7000 – Speaking – understand in detail an argument in a discussion programme (Medios de Comunicación)
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
  VALUES (v_path_uuid, 7000, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand in detail an argument in a discussion programme (Medios de Comunicación)', 'Práctica guiada de speaking: understand in detail an argument in a discussion programme (Medios de Comunicación).', '{"instruction":"understand in detail an argument in a discussion programme (Medios de Comunicación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
