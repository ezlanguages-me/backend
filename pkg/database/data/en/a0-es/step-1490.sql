-- ============================================================
-- Seed: A0 English Path – STEP 1490 – Listening – understand (for example) routine explanations such as when statements will be issued, notice of withdrawal required (Servicios Financieros y Postales)
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
  VALUES (v_path_uuid, 1490, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'understand (for example) routine explanations such as when statements will be issued, notice of withdrawal required (Servicios Financieros y Postales)', 'Práctica de listening: understand (for example) routine explanations such as when statements will be issued, notice of withdrawal required (Servicios Financieros y Postales).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
