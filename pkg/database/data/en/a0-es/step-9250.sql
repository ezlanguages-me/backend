-- ============================================================
-- Seed: A0 English Path – STEP 9250 – Speaking – use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)
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
  VALUES (v_path_uuid, 9250, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)', 'Práctica guiada de speaking: use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional).', '{"instruction":"use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
