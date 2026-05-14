-- ============================================================
-- Seed: A0 English Path – STEP 3650 – Speaking – CAN, on arrival in a foreign country, answer routine questions such as 'How long are you staying?' and respond appropriately (Viajes y Transporte)
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
  VALUES (v_path_uuid, 3650, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'CAN, on arrival in a foreign country, answer routine questions such as ''How long are you staying?'' and respond appropriately (Viajes y Transporte)', 'Práctica guiada de speaking: CAN, on arrival in a foreign country, answer routine questions such as ''How long are you staying?'' and respond appropriately (Viajes y Transporte).', '{"instruction":"CAN, on arrival in a foreign country, answer routine questions such as ''How long are you staying?'' and respond appropriately (Viajes y Transporte)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
