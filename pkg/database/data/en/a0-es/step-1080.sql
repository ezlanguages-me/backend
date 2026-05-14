-- ============================================================
-- Seed: A0 English Path – STEP 1080 – Deck – El Entorno Inmediato II (Tareas Domésticas)
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
  VALUES (v_path_uuid, 1080, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'El Entorno Inmediato II (Tareas Domésticas)', 'Vocabulario inicial para: El Entorno Inmediato II (Tareas Domésticas).');
END;
$seed$;
