-- ============================================================
-- Seed: A0 English Path – STEP 3470 – Reading – understand, given sufficient time, most information of a factual nature that (s)he is likely to come across during the course of study (Textos, Ensayos e Investigación)
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
  VALUES (v_path_uuid, 3470, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand, given sufficient time, most information of a factual nature that (s)he is likely to come across during the course of study (Textos, Ensayos e Investigación)', 'Práctica guiada de reading: understand, given sufficient time, most information of a factual nature that (s)he is likely to come across during the course of study (Textos, Ensayos e Investigación).', '{"instruction":"understand, given sufficient time, most information of a factual nature that (s)he is likely to come across during the course of study (Textos, Ensayos e Investigación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
