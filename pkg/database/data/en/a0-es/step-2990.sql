-- ============================================================
-- Seed: A0 English Path – STEP 2990 – Reading – understand basic information such as cost per hour/day (Viajes y Transporte)
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
  VALUES (v_path_uuid, 2990, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand basic information such as cost per hour/day (Viajes y Transporte)', 'Práctica guiada de reading: understand basic information such as cost per hour/day (Viajes y Transporte).', '{"instruction":"understand basic information such as cost per hour/day (Viajes y Transporte)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
