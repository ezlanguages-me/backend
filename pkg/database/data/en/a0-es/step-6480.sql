-- ============================================================
-- Seed: A0 English Path – STEP 6480 – Reading – understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6480, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)', 'Práctica guiada de reading: understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento).', '{"instruction":"understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
