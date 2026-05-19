-- ============================================================
-- Seed: A0 English Path – STEP 1080 – Deck – El Entorno Inmediato II (Tareas Domésticas)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "sweep", "meaning": "barrer", "de": "fegen", "ex": "I sweep the kitchen floor every evening.", "pron": "/swiːp/", "pron_de": "/swiːp/"}'::jsonb,
        '{"term": "mop", "meaning": "fregar el suelo", "de": "den Boden wischen", "ex": "We mop the hall on Saturdays.", "pron": "/mɒp/", "pron_de": "/mɒp/"}'::jsonb,
        '{"term": "vacuum", "meaning": "pasar la aspiradora", "de": "staubsaugen", "ex": "He vacuums the living room after lunch.", "pron": "/ˈvækjuːm/", "pron_de": "/ˈvækjuːm/"}'::jsonb,
        '{"term": "dust", "meaning": "quitar el polvo", "de": "Staub wischen", "ex": "She dusts the shelves in the bedroom.", "pron": "/dʌst/", "pron_de": "/dʌst/"}'::jsonb,
        '{"term": "tidy up", "meaning": "ordenar", "de": "aufräumen", "ex": "Please tidy up your desk before dinner.", "pron": "/ˈtaɪdi ʌp/", "pron_de": "/ˈtaɪdi ʌp/"}'::jsonb,
        '{"term": "make the bed", "meaning": "hacer la cama", "de": "das Bett machen", "ex": "I make the bed every morning.", "pron": "/meɪk ðə bed/", "pron_de": "/meɪk ðə bed/"}'::jsonb,
        '{"term": "wash the dishes", "meaning": "lavar los platos", "de": "das Geschirr spülen", "ex": "They wash the dishes together.", "pron": "/wɒʃ ðə ˈdɪʃɪz/", "pron_de": "/wɒʃ ðə ˈdɪʃɪz/"}'::jsonb,
        '{"term": "dry the dishes", "meaning": "secar los platos", "de": "das Geschirr abtrocknen", "ex": "My brother dries the dishes with a towel.", "pron": "/draɪ ðə ˈdɪʃɪz/", "pron_de": "/draɪ ðə ˈdɪʃɪz/"}'::jsonb,
        '{"term": "set the table", "meaning": "poner la mesa", "de": "den Tisch decken", "ex": "Can you set the table, please?", "pron": "/set ðə ˈteɪbəl/", "pron_de": "/set ðə ˈteɪbəl/"}'::jsonb,
        '{"term": "clear the table", "meaning": "recoger la mesa", "de": "den Tisch abräumen", "ex": "We clear the table after dinner.", "pron": "/klɪə ðə ˈteɪbəl/", "pron_de": "/klɪə ðə ˈteɪbəl/"}'::jsonb,
        '{"term": "take out the rubbish", "meaning": "sacar la basura", "de": "den Müll rausbringen", "ex": "Tom takes out the rubbish at night.", "pron": "/teɪk aʊt ðə ˈrʌbɪʃ/", "pron_de": "/teɪk aʊt ðə ˈrʌbɪʃ/"}'::jsonb,
        '{"term": "do the laundry", "meaning": "poner la lavadora", "de": "Wäsche waschen", "ex": "I do the laundry on Sunday.", "pron": "/duː ðə ˈlɔːndri/", "pron_de": "/duː ðə ˈlɔːndri/"}'::jsonb,
        '{"term": "hang up the clothes", "meaning": "tender la ropa", "de": "die Kleidung aufhängen", "ex": "She hangs up the clothes in the garden.", "pron": "/hæŋ ʌp ðə kləʊðz/", "pron_de": "/hæŋ ʌp ðə kləʊðz/"}'::jsonb,
        '{"term": "fold the clothes", "meaning": "doblar la ropa", "de": "die Kleidung falten", "ex": "We fold the clothes on the sofa.", "pron": "/fəʊld ðə kləʊðz/", "pron_de": "/fəʊld ðə kləʊðz/"}'::jsonb,
        '{"term": "iron", "meaning": "planchar", "de": "bügeln", "ex": "My father irons his shirt before work.", "pron": "/ˈaɪən/", "pron_de": "/ˈaɪən/"}'::jsonb,
        '{"term": "cook", "meaning": "cocinar", "de": "kochen", "ex": "I cook dinner at 7 PM.", "pron": "/kʊk/", "pron_de": "/kʊk/"}'::jsonb,
        '{"term": "bake", "meaning": "hornear", "de": "backen", "ex": "She bakes bread on Fridays.", "pron": "/beɪk/", "pron_de": "/beɪk/"}'::jsonb,
        '{"term": "peel", "meaning": "pelar", "de": "schälen", "ex": "Please peel the potatoes.", "pron": "/piːl/", "pron_de": "/piːl/"}'::jsonb,
        '{"term": "chop", "meaning": "cortar en trozos", "de": "hacken", "ex": "He chops the onions very slowly.", "pron": "/tʃɒp/", "pron_de": "/tʃɒp/"}'::jsonb,
        '{"term": "stir", "meaning": "remover", "de": "rühren", "ex": "Stir the soup for two minutes.", "pron": "/stɜːr/", "pron_de": "/stɜːr/"}'::jsonb,
        '{"term": "wipe", "meaning": "limpiar con un paño", "de": "abwischen", "ex": "She wipes the table with a cloth.", "pron": "/waɪp/", "pron_de": "/waɪp/"}'::jsonb,
        '{"term": "clean the bathroom", "meaning": "limpiar el baño", "de": "das Bad putzen", "ex": "We clean the bathroom on Friday.", "pron": "/kliːn ðə ˈbɑːθruːm/", "pron_de": "/kliːn ðə ˈbɑːθruːm/"}'::jsonb,
        '{"term": "clean the window", "meaning": "limpiar la ventana", "de": "das Fenster putzen", "ex": "He cleans the window in the kitchen.", "pron": "/kliːn ðə ˈwɪndəʊ/", "pron_de": "/kliːn ðə ˈwɪndəʊ/"}'::jsonb,
        '{"term": "water the plants", "meaning": "regar las plantas", "de": "die Pflanzen gießen", "ex": "I water the plants every two days.", "pron": "/ˈwɔːtə ðə plɑːnts/", "pron_de": "/ˈwɔːtə ðə plɑːnts/"}'::jsonb,
        '{"term": "feed the cat", "meaning": "dar de comer al gato", "de": "die Katze füttern", "ex": "Please feed the cat at 6 PM.", "pron": "/fiːd ðə kæt/", "pron_de": "/fiːd ðə kæt/"}'::jsonb,
        '{"term": "fix", "meaning": "arreglar", "de": "reparieren", "ex": "Can you fix the loose handle?", "pron": "/fɪks/", "pron_de": "/fɪks/"}'::jsonb,
        '{"term": "light bulb", "meaning": "bombilla", "de": "Glühbirne", "ex": "The light bulb in the hall is new.", "pron": "/laɪt bʌlb/", "pron_de": "/laɪt bʌlb/"}'::jsonb,
        '{"term": "toolbox", "meaning": "caja de herramientas", "de": "Werkzeugkasten", "ex": "The toolbox is under the sink.", "pron": "/ˈtuːlbɒks/", "pron_de": "/ˈtuːlbɒks/"}'::jsonb,
        '{"term": "ladder", "meaning": "escalera", "de": "Leiter", "ex": "The ladder is behind the door.", "pron": "/ˈlædə/", "pron_de": "/ˈlædə/"}'::jsonb,
        '{"term": "bucket", "meaning": "cubo", "de": "Eimer", "ex": "Fill the bucket with warm water.", "pron": "/ˈbʌkɪt/", "pron_de": "/ˈbʌkɪt/"}'::jsonb,
        '{"term": "detergent", "meaning": "detergente", "de": "Waschmittel", "ex": "We need detergent for the laundry.", "pron": "/dɪˈtɜːdʒənt/", "pron_de": "/dɪˈtɜːdʒənt/"}'::jsonb,
        '{"term": "cloth", "meaning": "trapo", "de": "Tuch", "ex": "Use a soft cloth for the table.", "pron": "/klɒθ/", "pron_de": "/klɒθ/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1080 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1080, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'El Entorno Inmediato II (Tareas Domésticas)', 'Vocabulario básico sobre tareas del hogar, limpieza, cocina y pequeños arreglos en casa.'),
        (v_deck_id, 'de', 'Unmittelbare Umgebung II (Hausarbeit)', 'Grundwortschatz zu Hausarbeit, Putzen, Kochen und kleinen Arbeiten im Haushalt.');

    FOREACH card IN ARRAY v_cards LOOP
        INSERT INTO word (term, is_root, source_language, example)
        VALUES (card->>'term', TRUE, 'en', card->>'ex')
        RETURNING uuid INTO v_word_id;

        INSERT INTO word_translation (word_uuid, language, meaning, pronunciation)
        VALUES
            (v_word_id, 'es', jsonb_build_object('translation', card->>'meaning'), card->>'pron'),
            (v_word_id, 'de', jsonb_build_object('translation', card->>'de'), card->>'pron_de');

        INSERT INTO deck_words (deck_uuid, word_uuid)
        VALUES (v_deck_id, v_word_id);
    END LOOP;
END;
$seed$;
