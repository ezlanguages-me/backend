-- ============================================================
-- Seed: A0 English Path – STEP 3150 – Reading – understand simple forms, for example landing-cards, required for entry into a foreign country (Viajes y Transporte)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3150, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand simple forms, for example landing-cards, required for entry into a foreign country (Viajes y Transporte)', 'Práctica guiada de reading: understand simple forms, for example landing-cards, required for entry into a foreign country (Viajes y Transporte).', '{"instruction":"understand simple forms, for example landing-cards, required for entry into a foreign country (Viajes y Transporte)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
