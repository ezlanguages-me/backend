-- ============================================================
-- Seed: A0 English Path – STEP 9220 – Reading – use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)
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
  VALUES (v_path_uuid, 9220, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)', 'Práctica guiada de reading: use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional).', '{"instruction":"use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
