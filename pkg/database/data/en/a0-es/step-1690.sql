-- ============================================================
-- Seed: A0 English Path – STEP 1690 – Reading – go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)
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
  VALUES (v_path_uuid, 1690, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)', 'Práctica guiada de reading: go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte).', '{"instruction":"go to a travel information centre at, for example, a railway/bus station and ask for information as to how to get from A to B (Viajes y Transporte)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
