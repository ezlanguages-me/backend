-- ============================================================
-- Seed: A0 English Path – STEP 5690 – Reading – scan articles, textbooks etc. in own or related areas of study to form reliable judgements as to their relevance / usefulness, at a moderate speed (Textos, Ensayos e Investigación)
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
  VALUES (v_path_uuid, 5690, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'scan articles, textbooks etc. in own or related areas of study to form reliable judgements as to their relevance / usefulness, at a moderate speed (Textos, Ensayos e Investigación)', 'Práctica guiada de reading: scan articles, textbooks etc. in own or related areas of study to form reliable judgements as to their relevance / usefulness, at a moderate speed (Textos, Ensayos e Investigación).', '{"instruction":"scan articles, textbooks etc. in own or related areas of study to form reliable judgements as to their relevance / usefulness, at a moderate speed (Textos, Ensayos e Investigación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
