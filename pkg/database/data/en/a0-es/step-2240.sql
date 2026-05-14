-- ============================================================
-- Seed: A0 English Path – STEP 2240 – Reading – make a complaint about straightforward matters, for example, the service or the bill (Restauración)
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
  VALUES (v_path_uuid, 2240, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'make a complaint about straightforward matters, for example, the service or the bill (Restauración)', 'Práctica guiada de reading: make a complaint about straightforward matters, for example, the service or the bill (Restauración).', '{"instruction":"make a complaint about straightforward matters, for example, the service or the bill (Restauración)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
