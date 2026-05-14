-- ============================================================
-- Seed: A0 English Path – STEP 2690 – Reading – explain what is wrong in straightforward terms at a chemist's, doctor's, hospital or dentist's, especially if symptoms are visible (Salud)
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
  VALUES (v_path_uuid, 2690, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud)', 'Práctica guiada de reading: explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud).', '{"instruction":"explain what is wrong in straightforward terms at a chemist''s, doctor''s, hospital or dentist''s, especially if symptoms are visible (Salud)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
