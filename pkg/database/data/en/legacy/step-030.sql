-- ============================================================
-- Seed: A0 English Path – STEP 30 – Deck – VERBOS (Lista maestra en posición temprana: verbos de acción, estados y necesidades básicas)
-- Source language: Spanish
-- Generated from ordered-steps-table.md
-- ============================================================
DO $seed$ 
DECLARE 
    v_path_id UUID; 
    v_deck_id UUID; 
    v_root_id UUID; 
    v_past_id UUID; 
    v_pp_id UUID; 
    v_item JSONB;
    
    ];

BEGIN

-- 1. Obtener el path
SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

-- Prevenir duplicados en testing borrando si ya existía el paso 30 en decks
DELETE FROM deck WHERE step_order = 30 AND path_uuid = v_path_id;

-- 2. Insertar el Deck
INSERT INTO deck (path_uuid, step_order, source_language, type) 
VALUES (v_path_id, 30, 'en', 'deck') 
RETURNING uuid INTO v_deck_id;

-- 3. Insertar Traducción y Metadata del Deck
INSERT INTO deck_translation (deck_uuid, language, title) 
VALUES (
    v_deck_id,
    'es',
    'Los Verbos'
);

INSERT INTO deck_translation (deck_uuid, language, title) 
VALUES (
    v_deck_id,
    'de',
    'Die Verben'
);

-- 4. Bucle para insertar los verbos y sus inflexiones
FOREACH v_item IN ARRAY v_verbs
LOOP
    -- ==================================================
    -- A) Insertar el verbo raíz (Infinitive)
    -- ==================================================
    SELECT get_or_create_word(v_item->>'v', 'en', v_item->>'ex') INTO v_root_id;

    -- A.1) Traducción y pronunciación de la raíz
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron_v')
    ON CONFLICT DO NOTHING;

    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_root_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de_v')
    ON CONFLICT DO NOTHING;

    -- A.2) Vincular el verbo raíz al deck
    INSERT INTO deck_words (deck_uuid, word_uuid) 
    VALUES (v_deck_id, v_root_id)
    ON CONFLICT DO NOTHING;

    -- ==================================================
    -- B) Insertar la inflexión en Pasado Simple (Past)
    -- ==================================================
    INSERT INTO word (term, is_root, source_language, inflection_type, root_word) 
    VALUES (v_item->>'p', FALSE, 'en', 'past', v_root_id) 
    RETURNING uuid INTO v_past_id;

    -- B.1) Traducción y PRONUNCIACIÓN del Pasado Simple
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_past_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron_p')
    ON CONFLICT DO NOTHING;

    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_past_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de_p')
    ON CONFLICT DO NOTHING;

    -- B.2) Vincular Inflexión
    INSERT INTO word_inflection (word_uuid, inflection_uuid) 
    VALUES (v_root_id, v_past_id);

    -- ==================================================
    -- C) Insertar la inflexión en Participio Pasado (Past Participle)
    -- ==================================================
    INSERT INTO word (term, is_root, source_language, inflection_type, root_word) 
    VALUES (v_item->>'pp', FALSE, 'en', 'past_participle', v_root_id) 
    RETURNING uuid INTO v_pp_id;

    -- C.1) Traducción y PRONUNCIACIÓN del Participio Pasado
    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_pp_id, 'es', jsonb_build_object('translation', v_item->>'es'), v_item->>'pron_pp')
    ON CONFLICT DO NOTHING;

    INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
    VALUES (v_pp_id, 'de', jsonb_build_object('translation', v_item->>'de'), v_item->>'pron_de_pp')
    ON CONFLICT DO NOTHING;

    -- C.2) Vincular Inflexión
    INSERT INTO word_inflection (word_uuid, inflection_uuid) 
    VALUES (v_root_id, v_pp_id);

END LOOP;
END;
$seed$;