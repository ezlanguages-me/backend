-- ============================================================
-- Seed: A0 English Path – STEP 3020 – Speaking – understand basic information such as cost per hour/day (Viajes y Transporte)
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
  VALUES (v_path_uuid, 3020, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand basic information such as cost per hour/day (Viajes y Transporte)', 'Práctica guiada de speaking: understand basic information such as cost per hour/day (Viajes y Transporte).', '{"instruction":"understand basic information such as cost per hour/day (Viajes y Transporte)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
