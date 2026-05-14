-- ============================================================
-- Seed: A0 English Path – STEP 2640 – Speaking – understand simple questions and instructions, e.g. 'take this to a pharmacy', 'stay in bed' (Salud)
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
  VALUES (v_path_uuid, 2640, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand simple questions and instructions, e.g. ''take this to a pharmacy'', ''stay in bed'' (Salud)', 'Práctica guiada de speaking: understand simple questions and instructions, e.g. ''take this to a pharmacy'', ''stay in bed'' (Salud).', '{"instruction":"understand simple questions and instructions, e.g. ''take this to a pharmacy'', ''stay in bed'' (Salud)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
