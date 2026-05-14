-- ============================================================
-- Seed: A0 English Path – STEP 6250 – Speaking – keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 6250, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social))', 'Práctica guiada de speaking: keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social)).', '{"instruction":"keep up a casual conversation for a reasonable period of time, provided that this is of a mainly familiar, predictable nature (Convivencia (Host Families y Vida Social))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
