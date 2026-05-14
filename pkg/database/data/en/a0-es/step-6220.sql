-- ============================================================
-- Seed: A0 English Path – STEP 6220 – Reading – keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 6220, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social))', 'Práctica guiada de reading: keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social)).', '{"instruction":"keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social))","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
