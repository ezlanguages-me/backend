-- ============================================================
-- Seed: A0 English Path – STEP 1470 – Speaking – ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1470, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales)', 'Práctica guiada de speaking: ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales).', '{"instruction":"ask questions related to different types of post office services and understand answers if sympathetically expressed (Servicios Financieros y Postales)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
