-- ============================================================
-- Seed: A0 English Path – STEP 5980 – Reading – understand simple literature found in hotels on tours, etc (Alojamiento)
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
  VALUES (v_path_uuid, 5980, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand simple literature found in hotels on tours, etc (Alojamiento)', 'Práctica guiada de reading: understand simple literature found in hotels on tours, etc (Alojamiento).', '{"instruction":"understand simple literature found in hotels on tours, etc (Alojamiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
