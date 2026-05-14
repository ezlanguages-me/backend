-- ============================================================
-- Seed: A0 English Path – STEP 6800 – Speaking – participate in a conversation in a casual or semi-formal situation for a short time (Socialización)
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
  VALUES (v_path_uuid, 6800, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'participate in a conversation in a casual or semi-formal situation for a short time (Socialización)', 'Práctica guiada de speaking: participate in a conversation in a casual or semi-formal situation for a short time (Socialización).', '{"instruction":"participate in a conversation in a casual or semi-formal situation for a short time (Socialización)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
