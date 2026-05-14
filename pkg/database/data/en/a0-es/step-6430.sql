-- ============================================================
-- Seed: A0 English Path – STEP 6430 – Speaking – understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6430, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)', 'Práctica guiada de speaking: understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento).', '{"instruction":"understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
