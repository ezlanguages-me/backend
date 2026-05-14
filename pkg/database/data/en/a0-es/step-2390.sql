-- ============================================================
-- Seed: A0 English Path – STEP 2390 – Speaking – understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)
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
  VALUES (v_path_uuid, 2390, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)', 'Práctica guiada de speaking: understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración).', '{"instruction":"understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
