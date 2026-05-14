-- ============================================================
-- Seed: A0 English Path – STEP 4640 – Reading – understand the general meaning of a theoretical article within own work area (Correspondencia e Informes Profesionales)
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
  VALUES (v_path_uuid, 4640, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the general meaning of a theoretical article within own work area (Correspondencia e Informes Profesionales)', 'Práctica guiada de reading: understand the general meaning of a theoretical article within own work area (Correspondencia e Informes Profesionales).', '{"instruction":"understand the general meaning of a theoretical article within own work area (Correspondencia e Informes Profesionales)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
