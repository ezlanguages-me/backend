-- ============================================================
-- Seed: A0 English Path – STEP 6400 – Reading – understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6400, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)', 'Práctica guiada de reading: understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento).', '{"instruction":"understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
