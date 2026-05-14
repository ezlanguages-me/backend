-- ============================================================
-- Seed: A0 English Path – STEP 2730 – Reading – ask for advice and understand the answer, provided this is given in everyday language (Salud)
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
  VALUES (v_path_uuid, 2730, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'ask for advice and understand the answer, provided this is given in everyday language (Salud)', 'Práctica guiada de reading: ask for advice and understand the answer, provided this is given in everyday language (Salud).', '{"instruction":"ask for advice and understand the answer, provided this is given in everyday language (Salud)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
