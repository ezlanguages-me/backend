-- ============================================================
-- Seed: A0 English Path – STEP 3540 – Speaking – book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_speaking_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO speaking (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3540, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento)', 'Práctica guiada de speaking: book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento).', '{"instruction":"book a room (face-to-face) in a hotel, bed and breakfast, etc (Alojamiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
