-- ============================================================
-- Seed: A0 English Path – STEP 470 – Listening – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO listening (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 470, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)', 'Práctica de listening: understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
