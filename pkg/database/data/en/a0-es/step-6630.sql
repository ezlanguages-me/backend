-- ============================================================
-- Seed: A0 English Path – STEP 6630 – Speaking – ask for clarification and further explanation, and is likely to understand the answer (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6630, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask for clarification and further explanation, and is likely to understand the answer (Turismo y Entretenimiento)', 'Práctica guiada de speaking: ask for clarification and further explanation, and is likely to understand the answer (Turismo y Entretenimiento).', '{"instruction":"ask for clarification and further explanation, and is likely to understand the answer (Turismo y Entretenimiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
