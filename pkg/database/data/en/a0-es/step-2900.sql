-- ============================================================
-- Seed: A0 English Path – STEP 2900 – Deck – Vida en Sociedad II (Transporte, Vehículos y Conducción)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "car", "meaning": "coche / carro", "de": "Auto", "ex": "The car is in the parking area.", "pron": "/kɑː/", "pron_de": "/ˈaʊtoː/"}'::jsonb,
        '{"term": "bus", "meaning": "autobús", "de": "Bus", "ex": "The bus stops near the station.", "pron": "/bʌs/", "pron_de": "/bʊs/"}'::jsonb,
        '{"term": "train", "meaning": "tren", "de": "Zug", "ex": "The train arrives at platform four.", "pron": "/treɪn/", "pron_de": "/tsuːk/"}'::jsonb,
        '{"term": "taxi", "meaning": "taxi", "de": "Taxi", "ex": "We take a taxi to the airport.", "pron": "/ˈtæksi/", "pron_de": "/ˈtaksi/"}'::jsonb,
        '{"term": "motorcycle", "meaning": "motocicleta", "de": "Motorrad", "ex": "His motorcycle is very fast.", "pron": "/ˈməʊtəˌsaɪkəl/", "pron_de": "/ˈmoːtoˌʁaːt/"}'::jsonb,
        '{"term": "bicycle", "meaning": "bicicleta", "de": "Fahrrad", "ex": "She rides her bicycle to school.", "pron": "/ˈbaɪsɪkəl/", "pron_de": "/ˈfaːʁʁaːt/"}'::jsonb,
        '{"term": "plane", "meaning": "avión", "de": "Flugzeug", "ex": "The plane leaves at midday.", "pron": "/pleɪn/", "pron_de": "/ˈfluːktsɔʏk/"}'::jsonb,
        '{"term": "ship", "meaning": "barco", "de": "Schiff", "ex": "The ship is in the harbour.", "pron": "/ʃɪp/", "pron_de": "/ʃɪf/"}'::jsonb,
        '{"term": "ferry", "meaning": "ferri", "de": "Fähre", "ex": "The ferry goes to the island every hour.", "pron": "/ˈferi/", "pron_de": "/ˈfɛːʁə/"}'::jsonb,
        '{"term": "ticket", "meaning": "billete", "de": "Fahrkarte", "ex": "I buy my ticket at the machine.", "pron": "/ˈtɪkɪt/", "pron_de": "/ˈfaːɐ̯kaʁtə/"}'::jsonb,
        '{"term": "platform", "meaning": "andén", "de": "Bahnsteig", "ex": "Our train leaves from platform two.", "pron": "/ˈplætfɔːm/", "pron_de": "/ˈbaːnʃtaɪk/"}'::jsonb,
        '{"term": "departure", "meaning": "salida", "de": "Abfahrt", "ex": "The departure time is 09:15.", "pron": "/dɪˈpɑːtʃə/", "pron_de": "/ˈapfaːɐ̯t/"}'::jsonb,
        '{"term": "arrival", "meaning": "llegada", "de": "Ankunft", "ex": "The arrival board is next to the café.", "pron": "/əˈraɪvəl/", "pron_de": "/ˈankʊnft/"}'::jsonb,
        '{"term": "highway", "meaning": "autopista", "de": "Autobahn", "ex": "There is heavy traffic on the highway.", "pron": "/ˈhaɪweɪ/", "pron_de": "/ˈaʊtoˌbaːn/"}'::jsonb,
        '{"term": "traffic", "meaning": "tráfico", "de": "Verkehr", "ex": "Morning traffic is slow today.", "pron": "/ˈtræfɪk/", "pron_de": "/fɛɐ̯ˈkeːɐ̯/"}'::jsonb,
        '{"term": "parking", "meaning": "aparcamiento", "de": "Parken / Parkplatz", "ex": "Parking is free after six.", "pron": "/ˈpɑːkɪŋ/", "pron_de": "/ˈpaʁkn̩ / ˈpaʁkplats/"}'::jsonb,
        '{"term": "seatbelt", "meaning": "cinturón de seguridad", "de": "Sicherheitsgurt", "ex": "Please fasten your seatbelt.", "pron": "/ˈsiːtbelt/", "pron_de": "/ˈzɪçɐhaɪtsˌɡʊʁt/"}'::jsonb,
        '{"term": "GPS", "meaning": "GPS", "de": "GPS", "ex": "The GPS shows a faster route.", "pron": "/ˌdʒiː piː ˈes/", "pron_de": "/ɡeː peː ˈʔɛs/"}'::jsonb,
        '{"term": "diesel", "meaning": "diésel", "de": "Diesel", "ex": "This van uses diesel.", "pron": "/ˈdiːzəl/", "pron_de": "/ˈdiːzl̩/"}'::jsonb,
        '{"term": "petrol / gas", "meaning": "gasolina", "de": "Benzin", "ex": "We need petrol before the trip.", "pron": "/ˈpetrəl / ɡæs/", "pron_de": "/bɛnˈtsiːn/"}'::jsonb,
        '{"term": "toll", "meaning": "peaje", "de": "Maut", "ex": "You pay a toll on this road.", "pron": "/təʊl/", "pron_de": "/maʊt/"}'::jsonb,
        '{"term": "roundabout", "meaning": "rotonda", "de": "Kreisverkehr", "ex": "Take the second exit at the roundabout.", "pron": "/ˈraʊndəbaʊt/", "pron_de": "/ˈkʁaɪsfɛɐ̯keːɐ̯/"}'::jsonb,
        '{"term": "crossroads", "meaning": "cruce", "de": "Kreuzung", "ex": "Turn left at the crossroads.", "pron": "/ˈkrɒsˌrəʊdz/", "pron_de": "/ˈkʁɔɪtsʊŋ/"}'::jsonb,
        '{"term": "pedestrian", "meaning": "peatón", "de": "Fußgänger", "ex": "The pedestrian waits at the crossing.", "pron": "/pəˈdestriən/", "pron_de": "/ˈfuːsˌɡɛŋɐ/"}'::jsonb,
        '{"term": "signal", "meaning": "señal", "de": "Signal", "ex": "The signal is green now.", "pron": "/ˈsɪɡnəl/", "pron_de": "/zɪɡˈnaːl/"}'::jsonb,
        '{"term": "speed limit", "meaning": "límite de velocidad", "de": "Geschwindigkeitsbegrenzung", "ex": "The speed limit is fifty here.", "pron": "/ˈspiːd ˌlɪmɪt/", "pron_de": "/ɡəˈʃvɪndɪçkaɪtsbəˌɡʁɛntsʊŋ/"}'::jsonb,
        '{"term": "breakdown", "meaning": "avería", "de": "Panne", "ex": "A breakdown can block the road.", "pron": "/ˈbreɪkdaʊn/", "pron_de": "/ˈpanə/"}'::jsonb,
        '{"term": "mechanic", "meaning": "mecánico", "de": "Mechaniker", "ex": "The mechanic checks the engine.", "pron": "/məˈkænɪk/", "pron_de": "/meˈçaːnɪkɐ/"}'::jsonb,
        '{"term": "airport", "meaning": "aeropuerto", "de": "Flughafen", "ex": "The airport bus is outside.", "pron": "/ˈeəpɔːt/", "pron_de": "/ˈfluːkhaːfn̩/"}'::jsonb,
        '{"term": "station", "meaning": "estación", "de": "Bahnhof", "ex": "The station is near the city centre.", "pron": "/ˈsteɪʃən/", "pron_de": "/ˈbaːnhoːf/"}'::jsonb,
        '{"term": "terminal", "meaning": "terminal", "de": "Terminal", "ex": "Our terminal is number one.", "pron": "/ˈtɜːmɪnəl/", "pron_de": "/tɛʁmiˈnaːl/"}'::jsonb,
        '{"term": "boarding pass", "meaning": "tarjeta de embarque", "de": "Bordkarte", "ex": "Show your boarding pass at the gate.", "pron": "/ˈbɔːdɪŋ pɑːs/", "pron_de": "/ˈbɔʁtkaʁtə/"}'::jsonb,
        '{"term": "passport", "meaning": "pasaporte", "de": "Reisepass", "ex": "Keep your passport in a safe place.", "pron": "/ˈpɑːspɔːt/", "pron_de": "/ˈʁaɪzəˌpas/"}'::jsonb,
        '{"term": "customs", "meaning": "aduanas", "de": "Zoll", "ex": "Customs checks every bag.", "pron": "/ˈkʌstəmz/", "pron_de": "/tsɔl/"}'::jsonb,
        '{"term": "luggage", "meaning": "equipaje", "de": "Gepäck", "ex": "My luggage is quite heavy.", "pron": "/ˈlʌɡɪdʒ/", "pron_de": "/ɡəˈpɛk/"}'::jsonb,
        '{"term": "delay", "meaning": "retraso", "de": "Verspätung", "ex": "There is a delay because of fog.", "pron": "/dɪˈleɪ/", "pron_de": "/fɛɐ̯ˈʃpɛːtʊŋ/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 2900 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 2900, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'Vida en Sociedad II (Transporte, Vehículos y Conducción)', 'Vocabulario básico sobre transporte, vehículos, carreteras, documentos de viaje y conducción.'),
        (v_deck_id, 'de', 'Leben in der Gesellschaft II (Transport, Fahrzeuge und Fahren)', 'Grundwortschatz zu Transport, Fahrzeugen, Straßen, Reisedokumenten und dem Fahren.');

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
