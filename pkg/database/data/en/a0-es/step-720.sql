-- ============================================================
-- Seed: A0 English Path – STEP 720 – Speaking – understand simple phone messages, e.g. 'We're arriving tomorrow at half past four' (Comunicación Telefónica y Correspondencia Personal)
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
  VALUES (v_path_uuid, 720, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand simple phone messages, e.g. ''We''re arriving tomorrow at half past four'' (Comunicación Telefónica y Correspondencia Personal)', 'Práctica guiada de speaking: understand simple phone messages, e.g. ''We''re arriving tomorrow at half past four'' (Comunicación Telefónica y Correspondencia Personal).', '{"instruction":"understand simple phone messages, e.g. ''We''re arriving tomorrow at half past four'' (Comunicación Telefónica y Correspondencia Personal)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
