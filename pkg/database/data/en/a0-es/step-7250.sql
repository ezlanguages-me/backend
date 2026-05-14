-- ============================================================
-- Seed: A0 English Path – STEP 7250 – Deck – Conceptos Abstractos (Política, Sociedad, Filosofía y Ciencia)
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
  VALUES (v_path_uuid, 7250, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'Conceptos Abstractos (Política, Sociedad, Filosofía y Ciencia)', 'Vocabulario inicial para: Conceptos Abstractos (Política, Sociedad, Filosofía y Ciencia).');
END;
$seed$;
