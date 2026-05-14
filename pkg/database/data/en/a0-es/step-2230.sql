-- ============================================================
-- Seed: A0 English Path – STEP 2230 – Speaking – ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)
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
  VALUES (v_path_uuid, 2230, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)', 'Práctica guiada de speaking: ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración).', '{"instruction":"ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
