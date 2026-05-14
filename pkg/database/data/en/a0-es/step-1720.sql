-- ============================================================
-- Seed: A0 English Path – STEP 1720 – Speaking – go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)
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
  VALUES (v_path_uuid, 1720, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)', 'Práctica guiada de speaking: go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte).', '{"instruction":"go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
