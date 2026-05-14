-- ============================================================
-- Seed: A0 English Path – STEP 4480 – Reading – recognize and understand at least partially the general meaning of a non-routine letter within own work area (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4480, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'recognize and understand at least partially the general meaning of a non-routine letter within own work area (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: recognize and understand at least partially the general meaning of a non-routine letter within own work area (Correspondencia e Informes Profesionales).', '{"instruction":"recognize and understand at least partially the general meaning of a non-routine letter within own work area (Correspondencia e Informes Profesionales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
