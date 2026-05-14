-- ============================================================
-- Seed: A0 English Path – STEP 7300 – Reading – keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 7300, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))', 'Práctica guiada de reading: keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social)).', '{"instruction":"keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
