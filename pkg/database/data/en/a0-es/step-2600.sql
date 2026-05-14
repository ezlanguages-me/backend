-- ============================================================
-- Seed: A0 English Path – STEP 2600 – Speaking – indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud)
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
  VALUES (v_path_uuid, 2600, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud)', 'Práctica guiada de speaking: indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud).', '{"instruction":"indicate the nature of a problem to a health professional, perhaps using gestures and body language (Salud)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
