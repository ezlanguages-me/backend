-- ============================================================
-- Seed: A0 English Path – STEP 9630 – Speaking – participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)
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
  VALUES (v_path_uuid, 9630, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)', 'Práctica guiada de speaking: participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización).', '{"instruction":"participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
