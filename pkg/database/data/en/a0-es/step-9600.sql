-- ============================================================
-- Seed: A0 English Path – STEP 9600 – Reading – participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)
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
  VALUES (v_path_uuid, 9600, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)', 'Práctica guiada de reading: participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización).', '{"instruction":"participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
