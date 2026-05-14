-- ============================================================
-- Seed: A0 English Path – STEP 6000 – Reading – establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)
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
  VALUES (v_path_uuid, 6000, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)', 'Práctica guiada de reading: establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres).', '{"instruction":"establish to his/her own satisfaction that the accommodation on offer fulfils all his/her needs (Alquileres)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
