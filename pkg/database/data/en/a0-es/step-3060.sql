-- ============================================================
-- Seed: A0 English Path – STEP 3060 – Speaking – deal with most routine situations likely to arise when either making travel arrangements through a travel agent or when actually travelling (Viajes y Transporte)
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
  VALUES (v_path_uuid, 3060, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'deal with most routine situations likely to arise when either making travel arrangements through a travel agent or when actually travelling (Viajes y Transporte)', 'Práctica guiada de speaking: deal with most routine situations likely to arise when either making travel arrangements through a travel agent or when actually travelling (Viajes y Transporte).', '{"instruction":"deal with most routine situations likely to arise when either making travel arrangements through a travel agent or when actually travelling (Viajes y Transporte)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
