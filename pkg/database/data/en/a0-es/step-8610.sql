-- ============================================================
-- Seed: A0 English Path – STEP 8610 – Writing – display sensitivity to the conventions of presentation and 'politeness' (impersonal style, appropriate use of modality to reflect the degree of confidence with which the conclusions are presented) (Textos, Ensayos e Investigación)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_writing_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO writing (path_uuid, step_order, source_language)
  VALUES (v_path_uuid, 8610, 'en')
  RETURNING uuid INTO v_writing_uuid;

  INSERT INTO writing_translation (writing_uuid, language, title, description, prompt)
  VALUES (v_writing_uuid, 'es', 'display sensitivity to the conventions of presentation and ''politeness'' (impersonal style, appropriate use of modality to reflect the degree of confidence with which the conclusions are presented) (Textos, Ensayos e Investigación)', 'Práctica guiada de writing: display sensitivity to the conventions of presentation and ''politeness'' (impersonal style, appropriate use of modality to reflect the degree of confidence with which the conclusions are presented) (Textos, Ensayos e Investigación).', '{"instruction":"display sensitivity to the conventions of presentation and ''politeness'' (impersonal style, appropriate use of modality to reflect the degree of confidence with which the conclusions are presented) (Textos, Ensayos e Investigación)","context":"Contenido pendiente.","language":"es"}'::jsonb);
END;
$seed$;
