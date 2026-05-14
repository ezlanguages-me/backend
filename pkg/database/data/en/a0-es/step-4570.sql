-- ============================================================
-- Seed: A0 English Path – STEP 4570 – Reading – understand a short report on a familiar matter, provided that it is clearly expressed in simple language, the contents are predictable, and enough time is given (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4570, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand a short report on a familiar matter, provided that it is clearly expressed in simple language, the contents are predictable, and enough time is given (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: understand a short report on a familiar matter, provided that it is clearly expressed in simple language, the contents are predictable, and enough time is given (Correspondencia e Informes Profesionales).', '{"instruction":"understand a short report on a familiar matter, provided that it is clearly expressed in simple language, the contents are predictable, and enough time is given (Correspondencia e Informes Profesionales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
