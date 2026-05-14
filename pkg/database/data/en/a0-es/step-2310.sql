-- ============================================================
-- Seed: A0 English Path – STEP 2310 – Speaking – order a meal and ask for clarification about dishes on the menu (Restauración)
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
  VALUES (v_path_uuid, 2310, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'order a meal and ask for clarification about dishes on the menu (Restauración)', 'Práctica guiada de speaking: order a meal and ask for clarification about dishes on the menu (Restauración).', '{"instruction":"order a meal and ask for clarification about dishes on the menu (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
