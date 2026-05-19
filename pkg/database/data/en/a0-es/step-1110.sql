-- ============================================================
-- Seed: A0 English Path – STEP 1110 – Deck – Vida en Sociedad I (La Ciudad)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "street", "meaning": "calle", "de": "Straße", "ex": "This street is very quiet at night.", "pron": "/striːt/", "pron_de": "/striːt/"}'::jsonb,
        '{"term": "avenue", "meaning": "avenida", "de": "Alee", "ex": "The hotel is on King Avenue.", "pron": "/ˈævənjuː/", "pron_de": "/ˈævənjuː/"}'::jsonb,
        '{"term": "square", "meaning": "plaza", "de": "Platz", "ex": "We meet in the main square.", "pron": "/skweə/", "pron_de": "/skweə/"}'::jsonb,
        '{"term": "corner", "meaning": "esquina", "de": "Ecke", "ex": "Turn left at the corner.", "pron": "/ˈkɔːnə/", "pron_de": "/ˈkɔːnə/"}'::jsonb,
        '{"term": "block", "meaning": "manzana", "de": "Block", "ex": "My office is two blocks away.", "pron": "/blɒk/", "pron_de": "/blɒk/"}'::jsonb,
        '{"term": "neighbourhood", "meaning": "barrio", "de": "Viertel", "ex": "I live in a quiet neighbourhood.", "pron": "/ˈneɪbəhʊd/", "pron_de": "/ˈneɪbəhʊd/"}'::jsonb,
        '{"term": "park", "meaning": "parque", "de": "Park", "ex": "The children play in the park.", "pron": "/pɑːk/", "pron_de": "/pɑːk/"}'::jsonb,
        '{"term": "museum", "meaning": "museo", "de": "Museum", "ex": "The museum opens at 10 AM.", "pron": "/mjuˈziːəm/", "pron_de": "/mjuˈziːəm/"}'::jsonb,
        '{"term": "library", "meaning": "biblioteca", "de": "Bibliothek", "ex": "She studies in the library.", "pron": "/ˈlaɪbrəri/", "pron_de": "/ˈlaɪbrəri/"}'::jsonb,
        '{"term": "bus stop", "meaning": "parada de autobús", "de": "Bushaltestelle", "ex": "The bus stop is next to the bank.", "pron": "/ˈbʌs stɒp/", "pron_de": "/ˈbʌs stɒp/"}'::jsonb,
        '{"term": "station", "meaning": "estación", "de": "Bahnhof", "ex": "The station is near the river.", "pron": "/ˈsteɪʃən/", "pron_de": "/ˈsteɪʃən/"}'::jsonb,
        '{"term": "traffic light", "meaning": "semáforo", "de": "Ampel", "ex": "Wait at the traffic light.", "pron": "/ˈtræfɪk laɪt/", "pron_de": "/ˈtræfɪk laɪt/"}'::jsonb,
        '{"term": "zebra crossing", "meaning": "paso de peatones", "de": "Zebrastreifen", "ex": "Use the zebra crossing, please.", "pron": "/ˈziːbrə ˌkrɒsɪŋ/", "pron_de": "/ˈziːbrə ˌkrɒsɪŋ/"}'::jsonb,
        '{"term": "roundabout", "meaning": "rotonda", "de": "Kreisverkehr", "ex": "Take the second exit at the roundabout.", "pron": "/ˈraʊndəbaʊt/", "pron_de": "/ˈraʊndəbaʊt/"}'::jsonb,
        '{"term": "bridge", "meaning": "puente", "de": "Brücke", "ex": "The bridge goes over the river.", "pron": "/brɪdʒ/", "pron_de": "/brɪdʒ/"}'::jsonb,
        '{"term": "river", "meaning": "río", "de": "Fluss", "ex": "The river is behind the station.", "pron": "/ˈrɪvə/", "pron_de": "/ˈrɪvə/"}'::jsonb,
        '{"term": "market", "meaning": "mercado", "de": "Markt", "ex": "Fresh fruit is at the market.", "pron": "/ˈmɑːkɪt/", "pron_de": "/ˈmɑːkɪt/"}'::jsonb,
        '{"term": "bakery", "meaning": "panadería", "de": "Bäckerei", "ex": "The bakery sells warm bread.", "pron": "/ˈbeɪkəri/", "pron_de": "/ˈbeɪkəri/"}'::jsonb,
        '{"term": "pharmacy", "meaning": "farmacia", "de": "Apotheke", "ex": "The pharmacy is opposite the café.", "pron": "/ˈfɑːməsi/", "pron_de": "/ˈfɑːməsi/"}'::jsonb,
        '{"term": "hospital", "meaning": "hospital", "de": "Krankenhaus", "ex": "The hospital is on Hill Street.", "pron": "/ˈhɒspɪtəl/", "pron_de": "/ˈhɒspɪtəl/"}'::jsonb,
        '{"term": "town hall", "meaning": "ayuntamiento", "de": "Rathaus", "ex": "The town hall is in the square.", "pron": "/ˌtaʊn ˈhɔːl/", "pron_de": "/ˌtaʊn ˈhɔːl/"}'::jsonb,
        '{"term": "post office", "meaning": "oficina de correos", "de": "Post", "ex": "The post office closes at 5 PM.", "pron": "/ˈpəʊst ˌɒfɪs/", "pron_de": "/ˈpəʊst ˌɒfɪs/"}'::jsonb,
        '{"term": "bank", "meaning": "banco", "de": "Bank", "ex": "There is a bank near the museum.", "pron": "/bæŋk/", "pron_de": "/bæŋk/"}'::jsonb,
        '{"term": "cinema", "meaning": "cine", "de": "Kino", "ex": "We go to the cinema on Friday.", "pron": "/ˈsɪnəmə/", "pron_de": "/ˈsɪnəmə/"}'::jsonb,
        '{"term": "theatre", "meaning": "teatro", "de": "Theater", "ex": "The theatre is next to the hotel.", "pron": "/ˈθɪətə/", "pron_de": "/ˈθɪətə/"}'::jsonb,
        '{"term": "playground", "meaning": "parque infantil", "de": "Spielplatz", "ex": "The playground is behind the school.", "pron": "/ˈpleɪɡraʊnd/", "pron_de": "/ˈpleɪɡraʊnd/"}'::jsonb,
        '{"term": "church", "meaning": "iglesia", "de": "Kirche", "ex": "The old church is very small.", "pron": "/tʃɜːtʃ/", "pron_de": "/tʃɜːtʃ/"}'::jsonb,
        '{"term": "fountain", "meaning": "fuente", "de": "Brunnen", "ex": "Meet me by the fountain.", "pron": "/ˈfaʊntən/", "pron_de": "/ˈfaʊntən/"}'::jsonb,
        '{"term": "map", "meaning": "mapa", "de": "Karte", "ex": "I need a city map.", "pron": "/mæp/", "pron_de": "/mæp/"}'::jsonb,
        '{"term": "address", "meaning": "dirección", "de": "Adresse", "ex": "What is the address of the hotel?", "pron": "/əˈdres/", "pron_de": "/əˈdres/"}'::jsonb,
        '{"term": "city centre", "meaning": "centro de la ciudad", "de": "Stadtzentrum", "ex": "The bus goes to the city centre.", "pron": "/ˌsɪti ˈsentə/", "pron_de": "/ˌsɪti ˈsentə/"}'::jsonb,
        '{"term": "subway", "meaning": "metro", "de": "U-Bahn", "ex": "Take the subway to the museum.", "pron": "/ˈsʌbweɪ/", "pron_de": "/ˈsʌbweɪ/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 1110 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 1110, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'Vida en Sociedad I (La Ciudad)', 'Vocabulario esencial sobre calles, edificios, transporte y orientación en la ciudad.'),
        (v_deck_id, 'de', 'Leben in der Gesellschaft I (Die Stadt)', 'Grundwortschatz zu Straßen, Gebäuden, Verkehr und Orientierung in der Stadt.');

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
