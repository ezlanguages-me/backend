-- ============================================================
-- Seed: A0 English Path – STEP 630 – Deck – Los Fundamentos (El Tiempo, fechas, horas y frecuencia)
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
  VALUES (v_path_uuid, 630, 'en', 'deck')
  RETURNING uuid INTO v_deck_uuid;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'Los Fundamentos (El Tiempo, fechas, horas y frecuencia)', 'Vocabulario inicial para: Los Fundamentos (El Tiempo, fechas, horas y frecuencia).');
END;
$seed$;
