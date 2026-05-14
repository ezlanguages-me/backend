-- ============================================================
-- Seed: A0 English Path – STEP 3480 – Reading – understand most visuals that (s)he is likely to come across, but MAY sometimes have difficulty with textual commentary (Textos, Ensayos e Investigación)
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
  VALUES (v_path_uuid, 3480, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand most visuals that (s)he is likely to come across, but MAY sometimes have difficulty with textual commentary (Textos, Ensayos e Investigación)', 'Práctica guiada de reading: understand most visuals that (s)he is likely to come across, but MAY sometimes have difficulty with textual commentary (Textos, Ensayos e Investigación).', '{"instruction":"understand most visuals that (s)he is likely to come across, but MAY sometimes have difficulty with textual commentary (Textos, Ensayos e Investigación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
