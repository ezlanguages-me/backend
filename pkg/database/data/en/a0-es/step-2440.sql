-- ============================================================
-- Seed: A0 English Path – STEP 2440 – Reading – understand most descriptions of common dishes in self-service/fast food establishments (Restauración)
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
  VALUES (v_path_uuid, 2440, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand most descriptions of common dishes in self-service/fast food establishments (Restauración)', 'Práctica guiada de reading: understand most descriptions of common dishes in self-service/fast food establishments (Restauración).', '{"instruction":"understand most descriptions of common dishes in self-service/fast food establishments (Restauración)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
