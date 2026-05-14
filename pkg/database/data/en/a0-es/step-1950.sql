-- ============================================================
-- Seed: A0 English Path – STEP 1950 – Speaking – go to a self-service or fast food establishment and order a meal (Restauración)
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
  VALUES (v_path_uuid, 1950, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'go to a self-service or fast food establishment and order a meal (Restauración)', 'Práctica guiada de speaking: go to a self-service or fast food establishment and order a meal (Restauración).', '{"instruction":"go to a self-service or fast food establishment and order a meal (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
