-- ============================================================
-- Seed: A0 English Path – STEP 6500 – Dialogue – understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_dialogue_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO dialogue (path_uuid, step_order, source_language, category, characters)
  VALUES (v_path_uuid, 6500, 'en', 'practice', '[{"name":"Guide","gender":"neutral","avatarURL":"https://example.com/avatars/guide.png"},{"name":"Learner","gender":"neutral","avatarURL":"https://example.com/avatars/learner.png"}]'::jsonb)
  RETURNING uuid INTO v_dialogue_uuid;

  INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
  VALUES (v_dialogue_uuid, 'es', 'understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento)', 'Práctica guiada de diálogo: understand the general outline of a guided tour where the type of place visited (cathedral, art gallery etc.) is familiar (Turismo y Entretenimiento).');

  INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
  VALUES
    (v_dialogue_uuid, 0, 'Guide', 'Let''s practice this situation.'),
    (v_dialogue_uuid, 1, 'Learner', 'Okay, I am ready.');

  INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
  VALUES
    ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_uuid AND line_order = 0), 'es', '[{"translations":[{"languageCode":"es","translation":"Practiquemos esta situación."}]}]'::jsonb),
    ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_uuid AND line_order = 1), 'es', '[{"translations":[{"languageCode":"es","translation":"Vale, estoy listo."}]}]'::jsonb);
END;
$seed$;
