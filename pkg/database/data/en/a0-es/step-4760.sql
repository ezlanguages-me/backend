-- ============================================================
-- Seed: A0 English Path – STEP 4760 – Reading – take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)
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
  VALUES (v_path_uuid, 4760, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)', 'Práctica guiada de reading: take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional).', '{"instruction":"take more complex messages, provided that the caller dictates these clearly and sympathetically (Teléfono Profesional)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
