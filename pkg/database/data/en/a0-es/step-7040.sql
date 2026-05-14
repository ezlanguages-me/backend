-- ============================================================
-- Seed: A0 English Path – STEP 7040 – Reading – understand a factual article or report in a newspaper/magazine (Medios de Comunicación)
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
  VALUES (v_path_uuid, 7040, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand a factual article or report in a newspaper/magazine (Medios de Comunicación)', 'Práctica guiada de reading: understand a factual article or report in a newspaper/magazine (Medios de Comunicación).', '{"instruction":"understand a factual article or report in a newspaper/magazine (Medios de Comunicación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
