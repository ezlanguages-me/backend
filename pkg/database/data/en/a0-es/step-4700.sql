-- ============================================================
-- Seed: A0 English Path – STEP 4700 – Reading – understand instructions, for example in a manual, in the form of a continuous text, provided that (s)he is familiar with the type of product, equipment etc. being explained (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4700, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand instructions, for example in a manual, in the form of a continuous text, provided that (s)he is familiar with the type of product, equipment etc. being explained (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: understand instructions, for example in a manual, in the form of a continuous text, provided that (s)he is familiar with the type of product, equipment etc. being explained (Correspondencia e Informes Profesionales).', '{"instruction":"understand instructions, for example in a manual, in the form of a continuous text, provided that (s)he is familiar with the type of product, equipment etc. being explained (Correspondencia e Informes Profesionales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
