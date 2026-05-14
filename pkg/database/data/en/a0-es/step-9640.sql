-- ============================================================
-- Seed: A0 English Path – STEP 9640 – Reading – pick up nuances of meaning/opinion (Socialización)
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
  VALUES (v_path_uuid, 9640, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'pick up nuances of meaning/opinion (Socialización)', 'Práctica guiada de reading: pick up nuances of meaning/opinion (Socialización).', '{"instruction":"pick up nuances of meaning/opinion (Socialización)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
