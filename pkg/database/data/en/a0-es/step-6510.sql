-- ============================================================
-- Seed: A0 English Path – STEP 6510 – Speaking – understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6510, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)', 'Práctica guiada de speaking: understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento).', '{"instruction":"understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
