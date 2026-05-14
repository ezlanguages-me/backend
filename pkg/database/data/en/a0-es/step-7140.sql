-- ============================================================
-- Seed: A0 English Path – STEP 7140 – Speaking – participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal)
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
  VALUES (v_path_uuid, 7140, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal)', 'Práctica guiada de speaking: participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal).', '{"instruction":"participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
