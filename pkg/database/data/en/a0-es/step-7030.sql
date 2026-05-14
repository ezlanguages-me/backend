-- ============================================================
-- Seed: A0 English Path – STEP 7030 – Reading – understand the general meaning of a newspaper report of events, where the topic is known and there is a high level of predictability (Medios de Comunicación)
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
  VALUES (v_path_uuid, 7030, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'understand the general meaning of a newspaper report of events, where the topic is known and there is a high level of predictability (Medios de Comunicación)', 'Práctica guiada de reading: understand the general meaning of a newspaper report of events, where the topic is known and there is a high level of predictability (Medios de Comunicación).', '{"instruction":"understand the general meaning of a newspaper report of events, where the topic is known and there is a high level of predictability (Medios de Comunicación)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
