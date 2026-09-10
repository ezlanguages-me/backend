-- ============================================================
-- Seed: English Path – Step 0000 – Deck
-- Title:       El Abecedario
-- Description: 
-- Source language: en  |  Translation: es
-- ============================================================
DO $seed$
DECLARE
  v_path_uuid UUID;
  v_deck_uuid UUID;
  v_en_uuid   UUID;
  v_es_uuid   UUID;
  item        JSONB;

  -- Each entry: en = English letter, es = Spanish letter name, pron = phonetic for ES speakers
  letters JSONB[] := ARRAY[
    '{"en":"a","es":"a",       "pron":"/éi/"      }'::jsonb,
    '{"en":"b","es":"b",      "pron":"/bi/"      }'::jsonb,
    '{"en":"c","es":"c",      "pron":"/si/"      }'::jsonb,
    '{"en":"d","es":"d",      "pron":"/di/"      }'::jsonb,
    '{"en":"e","es":"e",       "pron":"/i/"       }'::jsonb,
    '{"en":"f","es":"f",     "pron":"/ef/"      }'::jsonb,
    '{"en":"g","es":"g",      "pron":"/yiy/"     }'::jsonb,
    '{"en":"h","es":"h",   "pron":"/éich/"    }'::jsonb,
    '{"en":"i","es":"i",       "pron":"/ái/"      }'::jsonb,
    '{"en":"j","es":"j",    "pron":"/yéi/"     }'::jsonb,
    '{"en":"k","es":"k",      "pron":"/kéi/"     }'::jsonb,
    '{"en":"l","es":"l",     "pron":"/el/"      }'::jsonb,
    '{"en":"m","es":"m",     "pron":"/em/"      }'::jsonb,
    '{"en":"n","es":"n",     "pron":"/en/"      }'::jsonb,
    '{"en":"o","es":"o",       "pron":"/óu/"      }'::jsonb,
    '{"en":"p","es":"p",      "pron":"/pi/"      }'::jsonb,
    '{"en":"q","es":"q",      "pron":"/kiú/"     }'::jsonb,
    '{"en":"r","es":"r",    "pron":"/ar/"      }'::jsonb,
    '{"en":"s","es":"s",     "pron":"/es/"      }'::jsonb,
    '{"en":"t","es":"t",      "pron":"/ti/"      }'::jsonb,
    '{"en":"u","es":"u",       "pron":"/yíu/"     }'::jsonb,
    '{"en":"v","es":"v",     "pron":"/vi/"      }'::jsonb,
    '{"en":"w","es":"w", "pron":"/dábelyu/" }'::jsonb,
    '{"en":"x","es":"x",   "pron":"/ex/"      }'::jsonb,
    '{"en":"y","es":"y",      "pron":"/uái/"     }'::jsonb,
    '{"en":"z","es":"z",    "pron":"/zi/"      }'::jsonb
  ];
BEGIN
  -- ── Path ─────────────────────────────────────────────────────────────────────
  SELECT uuid INTO v_path_uuid FROM path WHERE source_language = 'en' LIMIT 1;
  IF v_path_uuid IS NULL THEN
    INSERT INTO path (source_language) VALUES ('en') RETURNING uuid INTO v_path_uuid;
  END IF;

  -- ── Deck (idempotent: skip if step 0 already exists) ──────────────────────
  SELECT uuid INTO v_deck_uuid FROM deck
  WHERE path_uuid = v_path_uuid AND step_order = 0 AND source_language = 'en';

  IF v_deck_uuid IS NULL THEN
    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_uuid, 0, 'en', 'deck')
    RETURNING uuid INTO v_deck_uuid;
  END IF;

  INSERT INTO deck_translation (deck_uuid, language, title, description)
  VALUES (v_deck_uuid, 'es', 'El Abecedario', '')
  ON CONFLICT (deck_uuid, language) DO NOTHING;

  -- ── Letters ──────────────────────────────────────────────────────────────────
  -- For each pair: upsert both word rows, link EN word to deck, create bridge.
  FOREACH item IN ARRAY letters LOOP

    -- English letter word
    v_en_uuid := get_or_create_word(item->>'en', 'en');

    -- Spanish letter name word (e.g. 'hache' for H, 'doble u' for W)
    v_es_uuid := get_or_create_word(item->>'es', 'es');

    -- Link English letter to this deck
    INSERT INTO deck_words (deck_uuid, word_uuid)
    VALUES (v_deck_uuid, v_en_uuid)
    ON CONFLICT DO NOTHING;

    -- Bridge: English letter → Spanish letter name, with phonetic guide
    INSERT INTO word_translation (source_word_uuid, target_word_uuid, pronunciation)
    VALUES (v_en_uuid, v_es_uuid, item->>'pron')
    ON CONFLICT (source_word_uuid, target_word_uuid) DO NOTHING;

  END LOOP;
END;
$seed$;
