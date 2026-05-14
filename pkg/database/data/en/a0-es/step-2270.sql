-- ============================================================
-- Seed: A0 English Path – STEP 2270 – Speaking – make a complaint about straightforward matters, for example, the service or the bill (Restauración)
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
  VALUES (v_path_uuid, 2270, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'make a complaint about straightforward matters, for example, the service or the bill (Restauración)', 'Práctica guiada de speaking: make a complaint about straightforward matters, for example, the service or the bill (Restauración).', '{"instruction":"make a complaint about straightforward matters, for example, the service or the bill (Restauración)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
