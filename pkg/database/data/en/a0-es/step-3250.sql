-- ============================================================
-- Seed: A0 English Path – STEP 3250 – Reading – indicate nature of problem and understand simple instructions and questions (Emergencias)
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
  VALUES (v_path_uuid, 3250, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'indicate nature of problem and understand simple instructions and questions (Emergencias)', 'Práctica guiada de reading: indicate nature of problem and understand simple instructions and questions (Emergencias).', '{"instruction":"indicate nature of problem and understand simple instructions and questions (Emergencias)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
