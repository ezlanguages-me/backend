-- ============================================================
-- Seed: A0 English Path – STEP 6410 – Listening – understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)
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
  VALUES (v_path_uuid, 6410, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento)', 'Práctica de listening: understand the outline of simple information given on a guided tour in a predictable situation (Turismo y Entretenimiento).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
