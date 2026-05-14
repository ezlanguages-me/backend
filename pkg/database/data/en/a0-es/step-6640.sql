-- ============================================================
-- Seed: A0 English Path – STEP 6640 – Reading – show visitors round and give a detailed description of a place (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6640, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'show visitors round and give a detailed description of a place (Turismo y Entretenimiento)', 'Práctica guiada de reading: show visitors round and give a detailed description of a place (Turismo y Entretenimiento).', '{"instruction":"show visitors round and give a detailed description of a place (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
