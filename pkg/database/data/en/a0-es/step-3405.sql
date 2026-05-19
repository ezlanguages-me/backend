-- ============================================================
-- Seed: A0 English Path – STEP 3405 – Deck – El Trabajo y la Oficina
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_deck_uuid UUID;
BEGIN
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;

  INSERT INTO deck (path_uuid, step_order, source_language, type)
  VALUES (v_path_uuid, 3405, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'El Trabajo y la Oficina', 'Vocabulario del entorno laboral y la oficina: desk, computer, meeting, report, deadline, colleague, manager, project, etc.');
END;
$seed$;
