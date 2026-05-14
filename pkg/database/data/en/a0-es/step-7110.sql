-- ============================================================
-- Seed: A0 English Path – STEP 7110 – Reading – participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_reading_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO reading (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 7110, 'en')
  RETURNING uuid INTO v_reading_uuid;

  INSERT INTO reading_translation (reading_uuid, language, title, description, content)
  VALUES (v_reading_uuid, 'es', 'participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal)', 'Práctica guiada de reading: participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal).', '{"instruction":"participate in casual conversation over the phone with a known person on a variety of topics (Comunicación Telefónica y Correspondencia Personal)","passage":"Reading content pending.","notes":"Contenido pendiente."}'::jsonb);
END;
$seed$;
