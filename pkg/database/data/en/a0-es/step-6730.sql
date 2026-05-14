-- ============================================================
-- Seed: A0 English Path – STEP 6730 – Reading – socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización)
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
  VALUES (v_path_uuid, 6730, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización)', 'Práctica guiada de reading: socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización).', '{"instruction":"socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
