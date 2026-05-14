-- ============================================================
-- Seed: A0 English Path – STEP 900 – Reading – check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 900, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio y Trámites)', 'Práctica guiada de reading: check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio y Trámites).', '{"instruction":"check instructions with teacher or lecturer by virtually repeating them (Gestión del Estudio y Trámites)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
