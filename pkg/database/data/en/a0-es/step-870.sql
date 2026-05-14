-- ============================================================
-- Seed: A0 English Path – STEP 870 – Listening – understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 870, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites)', 'Práctica de listening: understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
