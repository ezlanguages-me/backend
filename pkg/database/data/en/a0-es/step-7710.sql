-- ============================================================
-- Seed: A0 English Path – STEP 7710 – Reading – follow a simple presentation/demonstration and understand explanations with reference to a product or topic within own area of expertise (Reuniones y Presentaciones)
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
  VALUES (v_path_uuid, 7710, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'follow a simple presentation/demonstration and understand explanations with reference to a product or topic within own area of expertise (Reuniones y Presentaciones)', 'Práctica guiada de reading: follow a simple presentation/demonstration and understand explanations with reference to a product or topic within own area of expertise (Reuniones y Presentaciones).', '{"instruction":"follow a simple presentation/demonstration and understand explanations with reference to a product or topic within own area of expertise (Reuniones y Presentaciones)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
