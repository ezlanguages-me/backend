-- ============================================================
-- Seed: A0 English Path – STEP 3280 – Speaking – indicate nature of problem and understand simple instructions and questions (Emergencias)
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
  VALUES (v_path_uuid, 3280, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'indicate nature of problem and understand simple instructions and questions (Emergencias)', 'Práctica guiada de speaking: indicate nature of problem and understand simple instructions and questions (Emergencias).', '{"instruction":"indicate nature of problem and understand simple instructions and questions (Emergencias)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
