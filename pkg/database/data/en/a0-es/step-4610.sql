-- ============================================================
-- Seed: A0 English Path – STEP 4610 – Reading – understand the reports that (s)he is likely to come across, including the finer points, implications etc. of a complex report (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4610, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the reports that (s)he is likely to come across, including the finer points, implications etc. of a complex report (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: understand the reports that (s)he is likely to come across, including the finer points, implications etc. of a complex report (Correspondencia e Informes Profesionales).', '{"instruction":"understand the reports that (s)he is likely to come across, including the finer points, implications etc. of a complex report (Correspondencia e Informes Profesionales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
