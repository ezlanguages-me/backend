-- ============================================================
-- Seed: A0 English Path – STEP 2900 – Deck – Vida en Sociedad II (Transporte, Vehículos y Conducción)
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
  VALUES (v_path_uuid, 2900, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'Vida en Sociedad II (Transporte, Vehículos y Conducción)', 'Vocabulario inicial para: Vida en Sociedad II (Transporte, Vehículos y Conducción).');
END;
$seed$;
