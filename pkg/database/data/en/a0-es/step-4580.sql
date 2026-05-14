-- ============================================================
-- Seed: A0 English Path – STEP 4580 – Reading – understand most short reports of a predictable nature that (s)he is likely to meet, provided enough time is given (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4580, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand most short reports of a predictable nature that (s)he is likely to meet, provided enough time is given (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: understand most short reports of a predictable nature that (s)he is likely to meet, provided enough time is given (Correspondencia e Informes Profesionales).', '{"instruction":"understand most short reports of a predictable nature that (s)he is likely to meet, provided enough time is given (Correspondencia e Informes Profesionales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
