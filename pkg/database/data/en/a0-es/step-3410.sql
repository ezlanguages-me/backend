-- ============================================================
-- Seed: A0 English Path – STEP 3410 – Deck – El Mundo Natural (Animales, Plantas, Geografía y Clima)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "mountain", "meaning": "montaña", "de": "Berg", "ex": "The mountain is white in winter.", "pron": "/ˈmaʊntən/", "pron_de": "/bɛʁk/"}'::jsonb,
        '{"term": "river", "meaning": "río", "de": "Fluss", "ex": "The river runs through the valley.", "pron": "/ˈrɪvə/", "pron_de": "/flʊs/"}'::jsonb,
        '{"term": "lake", "meaning": "lago", "de": "See", "ex": "The lake is calm this morning.", "pron": "/leɪk/", "pron_de": "/zeː/"}'::jsonb,
        '{"term": "forest", "meaning": "bosque", "de": "Wald", "ex": "We walk through the forest in autumn.", "pron": "/ˈfɒrɪst/", "pron_de": "/valt/"}'::jsonb,
        '{"term": "desert", "meaning": "desierto", "de": "Wüste", "ex": "The desert is hot and dry.", "pron": "/ˈdezət/", "pron_de": "/ˈvyːstə/"}'::jsonb,
        '{"term": "ocean", "meaning": "océano", "de": "Ozean", "ex": "The ocean looks blue from the cliff.", "pron": "/ˈəʊʃən/", "pron_de": "/ot͡seˈaːn/"}'::jsonb,
        '{"term": "beach", "meaning": "playa", "de": "Strand", "ex": "The beach is quiet in the early morning.", "pron": "/biːtʃ/", "pron_de": "/ʃtʁant/"}'::jsonb,
        '{"term": "valley", "meaning": "valle", "de": "Tal", "ex": "There is a small village in the valley.", "pron": "/ˈvæli/", "pron_de": "/taːl/"}'::jsonb,
        '{"term": "cliff", "meaning": "acantilado", "de": "Klippe", "ex": "Do not stand near the cliff edge.", "pron": "/klɪf/", "pron_de": "/ˈklɪpə/"}'::jsonb,
        '{"term": "waterfall", "meaning": "cascada", "de": "Wasserfall", "ex": "The waterfall is very loud after rain.", "pron": "/ˈwɔːtəfɔːl/", "pron_de": "/ˈvasɐfal/"}'::jsonb,
        '{"term": "cloud", "meaning": "nube", "de": "Wolke", "ex": "A dark cloud is over the hills.", "pron": "/klaʊd/", "pron_de": "/ˈvɔlkə/"}'::jsonb,
        '{"term": "thunder", "meaning": "trueno", "de": "Donner", "ex": "I can hear thunder in the distance.", "pron": "/ˈθʌndə/", "pron_de": "/ˈdɔnɐ/"}'::jsonb,
        '{"term": "lightning", "meaning": "relámpago", "de": "Blitz", "ex": "The lightning is bright tonight.", "pron": "/ˈlaɪtnɪŋ/", "pron_de": "/blɪts/"}'::jsonb,
        '{"term": "tornado", "meaning": "tornado", "de": "Tornado", "ex": "The tornado moves across the fields.", "pron": "/tɔːˈneɪdəʊ/", "pron_de": "/tɔʁˈnaːdo/"}'::jsonb,
        '{"term": "hurricane", "meaning": "huracán", "de": "Hurrikan", "ex": "The hurricane warning is on the radio.", "pron": "/ˈhʌrɪkən/", "pron_de": "/hʊʁiˈkaːn/"}'::jsonb,
        '{"term": "drought", "meaning": "sequía", "de": "Dürre", "ex": "The farmers worry about the drought.", "pron": "/draʊt/", "pron_de": "/ˈdʏʁə/"}'::jsonb,
        '{"term": "flood", "meaning": "inundación", "de": "Überschwemmung", "ex": "The flood closes the road near the river.", "pron": "/flʌd/", "pron_de": "/ˌyːbɐˈʃvɛmʊŋ/"}'::jsonb,
        '{"term": "earthquake", "meaning": "terremoto", "de": "Erdbeben", "ex": "The earthquake shakes the houses.", "pron": "/ˈɜːθkweɪk/", "pron_de": "/ˈeːɐ̯tbeːbn̩/"}'::jsonb,
        '{"term": "volcano", "meaning": "volcán", "de": "Vulkan", "ex": "The volcano is active again.", "pron": "/vɒlˈkeɪnəʊ/", "pron_de": "/vʊlˈkaːn/"}'::jsonb,
        '{"term": "tiger", "meaning": "tigre", "de": "Tiger", "ex": "The tiger sleeps in the shade.", "pron": "/ˈtaɪɡə/", "pron_de": "/ˈtiːɡɐ/"}'::jsonb,
        '{"term": "elephant", "meaning": "elefante", "de": "Elefant", "ex": "The elephant drinks a lot of water.", "pron": "/ˈelɪfənt/", "pron_de": "/eleˈfant/"}'::jsonb,
        '{"term": "whale", "meaning": "ballena", "de": "Wal", "ex": "We can see a whale from the boat.", "pron": "/weɪl/", "pron_de": "/vaːl/"}'::jsonb,
        '{"term": "eagle", "meaning": "águila", "de": "Adler", "ex": "The eagle flies above the mountain.", "pron": "/ˈiːɡəl/", "pron_de": "/ˈaːdlɐ/"}'::jsonb,
        '{"term": "snake", "meaning": "serpiente", "de": "Schlange", "ex": "The snake moves slowly over the rock.", "pron": "/sneɪk/", "pron_de": "/ˈʃlaŋə/"}'::jsonb,
        '{"term": "spider", "meaning": "araña", "de": "Spinne", "ex": "A spider is on the wall.", "pron": "/ˈspaɪdə/", "pron_de": "/ˈʃpɪnə/"}'::jsonb,
        '{"term": "oak tree", "meaning": "roble", "de": "Eiche", "ex": "The oak tree is very old.", "pron": "/ˈəʊk triː/", "pron_de": "/ˈaɪçə/"}'::jsonb,
        '{"term": "rose", "meaning": "rosa", "de": "Rose", "ex": "This rose is red and white.", "pron": "/rəʊz/", "pron_de": "/ˈʁoːzə/"}'::jsonb,
        '{"term": "cactus", "meaning": "cactus", "de": "Kaktus", "ex": "The cactus grows in dry places.", "pron": "/ˈkæktəs/", "pron_de": "/ˈkaktʊs/"}'::jsonb,
        '{"term": "coral", "meaning": "coral", "de": "Koralle", "ex": "The coral reef is full of colour.", "pron": "/ˈkɒrəl/", "pron_de": "/koˈʁalə/"}'::jsonb,
        '{"term": "mushroom", "meaning": "seta / hongo", "de": "Pilz", "ex": "A mushroom grows near the tree roots.", "pron": "/ˈmʌʃruːm/", "pron_de": "/pɪlts/"}'::jsonb,
        '{"term": "humid", "meaning": "húmedo", "de": "feucht", "ex": "The air is humid after the storm.", "pron": "/ˈhjuːmɪd/", "pron_de": "/fɔʏçt/"}'::jsonb,
        '{"term": "tropical", "meaning": "tropical", "de": "tropisch", "ex": "The island has a tropical climate.", "pron": "/ˈtrɒpɪkəl/", "pron_de": "/ˈtʁoːpɪʃ/"}'::jsonb,
        '{"term": "arctic", "meaning": "ártico", "de": "arktisch", "ex": "Arctic winters are long and cold.", "pron": "/ˈɑːktɪk/", "pron_de": "/ˈaʁktɪʃ/"}'::jsonb,
        '{"term": "savanna", "meaning": "sabana", "de": "Savanne", "ex": "Lions live in the savanna.", "pron": "/səˈvænə/", "pron_de": "/zaˈvanə/"}'::jsonb,
        '{"term": "ecosystem", "meaning": "ecosistema", "de": "Ökosystem", "ex": "Every ecosystem needs balance.", "pron": "/ˈiːkəʊˌsɪstəm/", "pron_de": "/økoːzʏsˈteːm/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 3410 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 3410, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'El Mundo Natural (Animales, Plantas, Geografía y Clima)', 'Vocabulario básico sobre paisajes, clima, animales, plantas y fenómenos naturales.'),
        (v_deck_id, 'de', 'Die natürliche Welt (Tiere, Pflanzen, Geografie und Klima)', 'Grundwortschatz zu Landschaften, Klima, Tieren, Pflanzen und Naturphänomenen.');

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
