-- ============================================================
-- Seed: A0 English Path – STEP 7080 – Listening – participate in a simple phone conversation with a known person on a predictable topic, e.g. travel arrangements (Comunicación Telefónica y Correspondencia Personal)
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
  VALUES (v_path_uuid, 7080, 'en')
  RETURNING uuid INTO v_listening_uuid;

  INSERT INTO listening_translation (listening_uuid, language, title, description, transcript)
  VALUES (v_listening_uuid, 'es', 'participate in a simple phone conversation with a known person on a predictable topic, e.g. travel arrangements (Comunicación Telefónica y Correspondencia Personal)', 'Práctica de listening: participate in a simple phone conversation with a known person on a predictable topic, e.g. travel arrangements (Comunicación Telefónica y Correspondencia Personal).', '[{"speaker":"Guide","text":"Listening content pending.","translation":"Contenido pendiente."}]'::jsonb);
END;
$seed$;
