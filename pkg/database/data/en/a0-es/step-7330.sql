-- ============================================================
-- Seed: A0 English Path – STEP 7330 – Speaking – keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))
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
  VALUES (v_path_uuid, 7330, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))', 'Práctica guiada de speaking: keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social)).', '{"instruction":"keep up conversations of a casual nature for an extended period of time and discuss abstract/ cultural topics with a good degree of fluency and range of expression (Convivencia (Host Families y Vida Social))","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
