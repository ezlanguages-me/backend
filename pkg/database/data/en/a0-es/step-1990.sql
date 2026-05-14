-- ============================================================
-- Seed: A0 English Path – STEP 1990 – Speaking – get the attention of staff in an appropriate way and order a meal in a restaurant (Restauración)
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
  VALUES (v_path_uuid, 1990, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'get the attention of staff in an appropriate way and order a meal in a restaurant (Restauración)', 'Práctica guiada de speaking: get the attention of staff in an appropriate way and order a meal in a restaurant (Restauración).', '{"instruction":"get the attention of staff in an appropriate way and order a meal in a restaurant (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
