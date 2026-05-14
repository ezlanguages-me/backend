-- ============================================================
-- Seed: A0 English Path – STEP 580 – Reading – express opinions in a limited way (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 580, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'express opinions in a limited way (Convivencia (Host Families y Vida Social))', 'Práctica guiada de reading: express opinions in a limited way (Convivencia (Host Families y Vida Social)).', '{"instruction":"express opinions in a limited way (Convivencia (Host Families y Vida Social))","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
