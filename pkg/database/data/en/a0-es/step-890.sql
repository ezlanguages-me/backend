-- ============================================================
-- Seed: A0 English Path – STEP 890 – Speaking – understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites)
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
  VALUES (v_path_uuid, 890, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites)', 'Práctica guiada de speaking: understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites).', '{"instruction":"understand basic instructions on class times, dates and room numbers, and on assignments to be carried out (Gestión del Estudio y Trámites)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
