-- ============================================================
-- Seed: A0 English Path – STEP 6470 – Speaking – give simple explanations about familiar places (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6470, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'give simple explanations about familiar places (Turismo y Entretenimiento)', 'Práctica guiada de speaking: give simple explanations about familiar places (Turismo y Entretenimiento).', '{"instruction":"give simple explanations about familiar places (Turismo y Entretenimiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
