-- ============================================================
-- Seed: A0 English Path – STEP 1100 – Deck – Preposiciones de Lugar y Movimiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "in", "meaning": "en, dentro de", "de": "in", "ex": "The keys are in the bag.", "pron": "/ɪn/", "pron_de": "/ɪn/"}'::jsonb,
        '{"term": "on", "meaning": "sobre, en", "de": "auf", "ex": "The phone is on the table.", "pron": "/ɒn/", "pron_de": "/ɒn/"}'::jsonb,
        '{"term": "at", "meaning": "en", "de": "an, bei", "ex": "She is at the door.", "pron": "/æt/", "pron_de": "/æt/"}'::jsonb,
        '{"term": "under", "meaning": "debajo de", "de": "unter", "ex": "The shoes are under the bed.", "pron": "/ˈʌndə/", "pron_de": "/ˈʌndə/"}'::jsonb,
        '{"term": "above", "meaning": "encima de", "de": "über", "ex": "The lamp is above the desk.", "pron": "/əˈbʌv/", "pron_de": "/əˈbʌv/"}'::jsonb,
        '{"term": "below", "meaning": "debajo de", "de": "unterhalb von", "ex": "The picture is below the clock.", "pron": "/bɪˈləʊ/", "pron_de": "/bɪˈləʊ/"}'::jsonb,
        '{"term": "between", "meaning": "entre", "de": "zwischen", "ex": "The bank is between the café and the post office.", "pron": "/bɪˈtwiːn/", "pron_de": "/bɪˈtwiːn/"}'::jsonb,
        '{"term": "behind", "meaning": "detrás de", "de": "hinter", "ex": "The bike is behind the house.", "pron": "/bɪˈhaɪnd/", "pron_de": "/bɪˈhaɪnd/"}'::jsonb,
        '{"term": "in front of", "meaning": "delante de", "de": "vor", "ex": "The bus stop is in front of the school.", "pron": "/ɪn frʌnt əv/", "pron_de": "/ɪn frʌnt əv/"}'::jsonb,
        '{"term": "next to", "meaning": "al lado de", "de": "neben", "ex": "The pharmacy is next to the bakery.", "pron": "/nekst tuː/", "pron_de": "/nekst tuː/"}'::jsonb,
        '{"term": "near", "meaning": "cerca de", "de": "in der Nähe von", "ex": "Our flat is near the station.", "pron": "/nɪə/", "pron_de": "/nɪə/"}'::jsonb,
        '{"term": "far from", "meaning": "lejos de", "de": "weit von", "ex": "The hotel is far from the airport.", "pron": "/fɑː frəm/", "pron_de": "/fɑː frəm/"}'::jsonb,
        '{"term": "opposite", "meaning": "enfrente de", "de": "gegenüber", "ex": "The cinema is opposite the museum.", "pron": "/ˈɒpəzɪt/", "pron_de": "/ˈɒpəzɪt/"}'::jsonb,
        '{"term": "inside", "meaning": "dentro de", "de": "drinnen", "ex": "Wait inside the shop.", "pron": "/ɪnˈsaɪd/", "pron_de": "/ɪnˈsaɪd/"}'::jsonb,
        '{"term": "outside", "meaning": "fuera de", "de": "draußen, außerhalb", "ex": "The bicycles are outside the library.", "pron": "/ˌaʊtˈsaɪd/", "pron_de": "/ˌaʊtˈsaɪd/"}'::jsonb,
        '{"term": "left", "meaning": "izquierda", "de": "links", "ex": "Turn left at the traffic light.", "pron": "/left/", "pron_de": "/left/"}'::jsonb,
        '{"term": "right", "meaning": "derecha", "de": "rechts", "ex": "The bank is on your right.", "pron": "/raɪt/", "pron_de": "/raɪt/"}'::jsonb,
        '{"term": "straight ahead", "meaning": "todo recto", "de": "geradeaus", "ex": "Walk straight ahead for two blocks.", "pron": "/streɪt əˈhed/", "pron_de": "/streɪt əˈhed/"}'::jsonb,
        '{"term": "up", "meaning": "arriba, hacia arriba", "de": "hinauf, oben", "ex": "Go up the stairs.", "pron": "/ʌp/", "pron_de": "/ʌp/"}'::jsonb,
        '{"term": "down", "meaning": "abajo, hacia abajo", "de": "hinunter, unten", "ex": "Go down to the platform.", "pron": "/daʊn/", "pron_de": "/daʊn/"}'::jsonb,
        '{"term": "into", "meaning": "dentro de, hacia dentro", "de": "hinein in", "ex": "Put the book into the bag.", "pron": "/ˈɪntuː/", "pron_de": "/ˈɪntuː/"}'::jsonb,
        '{"term": "onto", "meaning": "encima de, hacia arriba sobre", "de": "auf ... hinauf", "ex": "Jump onto the bus carefully.", "pron": "/ˈɒntuː/", "pron_de": "/ˈɒntuː/"}'::jsonb,
        '{"term": "across", "meaning": "al otro lado de, cruzando", "de": "über, quer über", "ex": "Walk across the street.", "pron": "/əˈkrɒs/", "pron_de": "/əˈkrɒs/"}'::jsonb,
        '{"term": "along", "meaning": "a lo largo de", "de": "entlang", "ex": "We walk along the river.", "pron": "/əˈlɒŋ/", "pron_de": "/əˈlɒŋ/"}'::jsonb,
        '{"term": "through", "meaning": "a través de", "de": "durch", "ex": "Go through the park.", "pron": "/θruː/", "pron_de": "/θruː/"}'::jsonb,
        '{"term": "around", "meaning": "alrededor de", "de": "um ... herum", "ex": "We drive around the city centre.", "pron": "/əˈraʊnd/", "pron_de": "/əˈraʊnd/"}'::jsonb,
        '{"term": "over", "meaning": "por encima de", "de": "über", "ex": "The bridge goes over the road.", "pron": "/ˈəʊvə/", "pron_de": "/ˈəʊvə/"}'::jsonb,
        '{"term": "toward", "meaning": "hacia", "de": "auf ... zu", "ex": "The dog runs toward the gate.", "pron": "/təˈwɔːd/", "pron_de": "/təˈwɔːd/"}'::jsonb,
        '{"term": "away from", "meaning": "lejos de", "de": "weg von", "ex": "Please move away from the door.", "pron": "/əˈweɪ frəm/", "pron_de": "/əˈweɪ frəm/"}'::jsonb,
        '{"term": "across from", "meaning": "enfrente de", "de": "gegenüber von", "ex": "The café is across from the bank.", "pron": "/əˈkrɒs frəm/", "pron_de": "/əˈkrɒs frəm/"}'::jsonb,
        '{"term": "corner", "meaning": "esquina", "de": "Ecke", "ex": "Meet me at the corner.", "pron": "/ˈkɔːnə/", "pron_de": "/ˈkɔːnə/"}'::jsonb,
        '{"term": "middle", "meaning": "medio, centro", "de": "Mitte", "ex": "The ball is in the middle of the room.", "pron": "/ˈmɪdəl/", "pron_de": "/ˈmɪdəl/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1100 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1100, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'Preposiciones de Lugar y Movimiento', 'Palabras básicas para indicar posición, dirección y movimiento en espacios cotidianos.'),
        (v_deck_id, 'de', 'Präpositionen des Ortes und der Bewegung', 'Grundwörter für Position, Richtung und Bewegung in alltäglichen Räumen.');

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
