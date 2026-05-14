-- ============================================================
-- Seed: A0 English Path – STEP 3120 – Listening – understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_listening_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO listening (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 3120, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte)', 'Práctica de listening: understand detailed, complex conditions of hire, e.g. conditions relating to break-down or theft of a hired car (Viajes y Transporte).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
