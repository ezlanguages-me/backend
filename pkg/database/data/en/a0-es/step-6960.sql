-- ============================================================
-- Seed: A0 English Path – STEP 6960 – Speaking – understand most of what is said in a TV or radio programme, or in a film (Medios de Comunicación)
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
  VALUES (v_path_uuid, 6960, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'understand most of what is said in a TV or radio programme, or in a film (Medios de Comunicación)', 'Práctica guiada de speaking: understand most of what is said in a TV or radio programme, or in a film (Medios de Comunicación).', '{"instruction":"understand most of what is said in a TV or radio programme, or in a film (Medios de Comunicación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
