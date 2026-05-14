-- ============================================================
-- Seed: A0 English Path – STEP 2720 – Speaking – explain what is wrong in straightforward terms at a chemist's, doctor's, hospital or dentist's, especially if symptoms are visible (Salud)
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
  VALUES (v_path_uuid, 2720, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud)', 'Práctica guiada de speaking: explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud).', '{"instruction":"explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
