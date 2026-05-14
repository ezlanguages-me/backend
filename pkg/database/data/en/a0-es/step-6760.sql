-- ============================================================
-- Seed: A0 English Path – STEP 6760 – Speaking – socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización)
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
  VALUES (v_path_uuid, 6760, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización)', 'Práctica guiada de speaking: socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización).', '{"instruction":"socialise casually, by taking part in routine, predictable conversations e.g. at discos, in hotels etc (Socialización)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
