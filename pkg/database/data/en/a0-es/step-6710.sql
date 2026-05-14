-- ============================================================
-- Seed: A0 English Path – STEP 6710 – Reading – understand most tourist brochures, guidebooks etc (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6710, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand most tourist brochures, guidebooks etc (Turismo y Entretenimiento)', 'Práctica guiada de reading: understand most tourist brochures, guidebooks etc (Turismo y Entretenimiento).', '{"instruction":"understand most tourist brochures, guidebooks etc (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
