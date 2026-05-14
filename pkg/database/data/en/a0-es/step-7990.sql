-- ============================================================
-- Seed: A0 English Path – STEP 7990 – Reading – follow abstract argumentation, for example the balancing of alternatives and the drawing of a conclusion (Conferencias, Seminarios y Clases)
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
  VALUES (v_path_uuid, 7990, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'follow abstract argumentation, for example the balancing of alternatives and the drawing of a conclusion (Conferencias, Seminarios y Clases)', 'Práctica guiada de reading: follow abstract argumentation, for example the balancing of alternatives and the drawing of a conclusion (Conferencias, Seminarios y Clases).', '{"instruction":"follow abstract argumentation, for example the balancing of alternatives and the drawing of a conclusion (Conferencias, Seminarios y Clases)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
