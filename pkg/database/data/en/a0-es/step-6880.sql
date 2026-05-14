-- ============================================================
-- Seed: A0 English Path – STEP 6880 – Speaking – follow the plot of a film or play where action clearly illustrates the dialogue, for example a 'western' (Medios de Comunicación)
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
  VALUES (v_path_uuid, 6880, 'en')
  RETURNING uuid INTO v_speaking_uuid;

  INSERT INTO speaking_translation (speaking_uuid, language, title, description, prompt)
  VALUES (v_speaking_uuid, 'es', 'follow the plot of a film or play where action clearly illustrates the dialogue, for example a ''western'' (Medios de Comunicación)', 'Práctica guiada de speaking: follow the plot of a film or play where action clearly illustrates the dialogue, for example a ''western'' (Medios de Comunicación).', '{"instruction":"follow the plot of a film or play where action clearly illustrates the dialogue, for example a ''western'' (Medios de Comunicación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
