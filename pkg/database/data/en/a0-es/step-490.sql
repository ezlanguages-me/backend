-- ============================================================
-- Seed: A0 English Path – STEP 490 – Speaking – understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)
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
  VALUES (v_path_uuid, 490, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)', 'Práctica guiada de speaking: understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres).', '{"instruction":"understand the basics of renting a room/flat/house, for example the cost per week, simple rules (Alquileres)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
