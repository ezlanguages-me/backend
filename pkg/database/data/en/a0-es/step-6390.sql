-- ============================================================
-- Seed: A0 English Path – STEP 6390 – Speaking – ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6390, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento)', 'Práctica guiada de speaking: ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento).', '{"instruction":"ask for and understand the required information from a tourist office, provided this is of a familiar, non-specialised nature (Turismo y Entretenimiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
