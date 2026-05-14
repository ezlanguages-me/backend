-- ============================================================
-- Seed: A0 English Path – STEP 3510 – Reading – book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento)
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
  VALUES (v_path_uuid, 3510, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento)', 'Práctica guiada de reading: book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento).', '{"instruction":"book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
