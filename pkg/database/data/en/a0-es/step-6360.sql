-- ============================================================
-- Seed: A0 English Path – STEP 6360 – Reading – ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6360, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento)', 'Práctica guiada de reading: ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento).', '{"instruction":"ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
