-- ============================================================
-- Seed: A0 English Path – STEP 2510 – Deck – Supervivencia II (Salud, Cuerpo Humano y Enfermedades)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_deck_id UUID;
    v_word_id UUID;
    card JSONB;
    v_cards JSONB[] := ARRAY[
        '{"term": "head", "meaning": "cabeza", "de": "Kopf", "ex": "My head hurts today.", "pron": "/hed/", "pron_de": "/hed/"}'::jsonb,
        '{"term": "neck", "meaning": "cuello", "de": "Hals", "ex": "I have pain in my neck.", "pron": "/nek/", "pron_de": "/nek/"}'::jsonb,
        '{"term": "shoulder", "meaning": "hombro", "de": "Schulter", "ex": "My left shoulder is sore.", "pron": "/ˈʃəʊldə/", "pron_de": "/ˈʃəʊldə/"}'::jsonb,
        '{"term": "arm", "meaning": "brazo", "de": "Arm", "ex": "Raise your arm slowly.", "pron": "/ɑːm/", "pron_de": "/ɑːm/"}'::jsonb,
        '{"term": "elbow", "meaning": "codo", "de": "Ellbogen", "ex": "He hit his elbow on the door.", "pron": "/ˈelbəʊ/", "pron_de": "/ˈelbəʊ/"}'::jsonb,
        '{"term": "wrist", "meaning": "muñeca", "de": "Handgelenk", "ex": "Her wrist is swollen.", "pron": "/rɪst/", "pron_de": "/rɪst/"}'::jsonb,
        '{"term": "hand", "meaning": "mano", "de": "Hand", "ex": "Wash your hands before food.", "pron": "/hænd/", "pron_de": "/hænd/"}'::jsonb,
        '{"term": "finger", "meaning": "dedo", "de": "Finger", "ex": "I cut my finger.", "pron": "/ˈfɪŋɡə/", "pron_de": "/ˈfɪŋɡə/"}'::jsonb,
        '{"term": "chest", "meaning": "pecho", "de": "Brust", "ex": "She has chest pain.", "pron": "/tʃest/", "pron_de": "/tʃest/"}'::jsonb,
        '{"term": "stomach", "meaning": "estómago, barriga", "de": "Magen, Bauch", "ex": "My stomach feels bad.", "pron": "/ˈstʌmək/", "pron_de": "/ˈstʌmək/"}'::jsonb,
        '{"term": "back", "meaning": "espalda", "de": "Rücken", "ex": "His back hurts after work.", "pron": "/bæk/", "pron_de": "/bæk/"}'::jsonb,
        '{"term": "hip", "meaning": "cadera", "de": "Hüfte", "ex": "She has pain in her hip.", "pron": "/hɪp/", "pron_de": "/hɪp/"}'::jsonb,
        '{"term": "leg", "meaning": "pierna", "de": "Bein", "ex": "My leg is tired.", "pron": "/leɡ/", "pron_de": "/leɡ/"}'::jsonb,
        '{"term": "knee", "meaning": "rodilla", "de": "Knie", "ex": "He fell on his knee.", "pron": "/niː/", "pron_de": "/niː/"}'::jsonb,
        '{"term": "ankle", "meaning": "tobillo", "de": "Knöchel", "ex": "I twisted my ankle.", "pron": "/ˈæŋkəl/", "pron_de": "/ˈæŋkəl/"}'::jsonb,
        '{"term": "foot", "meaning": "pie", "de": "Fuß", "ex": "My foot is cold.", "pron": "/fʊt/", "pron_de": "/fʊt/"}'::jsonb,
        '{"term": "toe", "meaning": "dedo del pie", "de": "Zeh", "ex": "She hurt her big toe.", "pron": "/təʊ/", "pron_de": "/təʊ/"}'::jsonb,
        '{"term": "eye", "meaning": "ojo", "de": "Auge", "ex": "My eye is red.", "pron": "/aɪ/", "pron_de": "/aɪ/"}'::jsonb,
        '{"term": "ear", "meaning": "oreja, oído", "de": "Ohr", "ex": "I have ear pain.", "pron": "/ɪə/", "pron_de": "/ɪə/"}'::jsonb,
        '{"term": "nose", "meaning": "nariz", "de": "Nase", "ex": "My nose is blocked.", "pron": "/nəʊz/", "pron_de": "/nəʊz/"}'::jsonb,
        '{"term": "mouth", "meaning": "boca", "de": "Mund", "ex": "Open your mouth, please.", "pron": "/maʊθ/", "pron_de": "/maʊθ/"}'::jsonb,
        '{"term": "throat", "meaning": "garganta", "de": "Hals", "ex": "I have a sore throat.", "pron": "/θrəʊt/", "pron_de": "/θrəʊt/"}'::jsonb,
        '{"term": "pain", "meaning": "dolor", "de": "Schmerz", "ex": "The pain is strong.", "pron": "/peɪn/", "pron_de": "/peɪn/"}'::jsonb,
        '{"term": "ache", "meaning": "dolor continuo", "de": "Schmerz", "ex": "I have an ache in my back.", "pron": "/eɪk/", "pron_de": "/eɪk/"}'::jsonb,
        '{"term": "fever", "meaning": "fiebre", "de": "Fieber", "ex": "She has a high fever.", "pron": "/ˈfiːvə/", "pron_de": "/ˈfiːvə/"}'::jsonb,
        '{"term": "cough", "meaning": "tos", "de": "Husten", "ex": "His cough is bad at night.", "pron": "/kɒf/", "pron_de": "/kɒf/"}'::jsonb,
        '{"term": "cold", "meaning": "resfriado", "de": "Erkältung", "ex": "I think I have a cold.", "pron": "/kəʊld/", "pron_de": "/kəʊld/"}'::jsonb,
        '{"term": "flu", "meaning": "gripe", "de": "Grippe", "ex": "The doctor says it is flu.", "pron": "/fluː/", "pron_de": "/fluː/"}'::jsonb,
        '{"term": "allergy", "meaning": "alergia", "de": "Allergie", "ex": "Do you have any allergy?", "pron": "/ˈælədʒi/", "pron_de": "/ˈælədʒi/"}'::jsonb,
        '{"term": "rash", "meaning": "erupción", "de": "Ausschlag", "ex": "The rash is on my arm.", "pron": "/ræʃ/", "pron_de": "/ræʃ/"}'::jsonb,
        '{"term": "nausea", "meaning": "náusea", "de": "Übelkeit", "ex": "I feel nausea after the trip.", "pron": "/ˈnɔːziə/", "pron_de": "/ˈnɔːziə/"}'::jsonb,
        '{"term": "headache", "meaning": "dolor de cabeza", "de": "Kopfschmerzen", "ex": "I have a headache.", "pron": "/ˈhedeɪk/", "pron_de": "/ˈhedeɪk/"}'::jsonb,
        '{"term": "toothache", "meaning": "dolor de muelas", "de": "Zahnschmerzen", "ex": "She has a toothache.", "pron": "/ˈtuːθeɪk/", "pron_de": "/ˈtuːθeɪk/"}'::jsonb,
        '{"term": "prescription", "meaning": "receta médica", "de": "Rezept", "ex": "The doctor gave me a prescription.", "pron": "/prɪˈskrɪpʃən/", "pron_de": "/prɪˈskrɪpʃən/"}'::jsonb,
        '{"term": "medicine", "meaning": "medicina", "de": "Medizin", "ex": "Take the medicine after food.", "pron": "/ˈmedsən/", "pron_de": "/ˈmedsən/"}'::jsonb,
        '{"term": "pharmacy", "meaning": "farmacia", "de": "Apotheke", "ex": "The pharmacy closes at six.", "pron": "/ˈfɑːməsi/", "pron_de": "/ˈfɑːməsi/"}'::jsonb,
        '{"term": "hospital", "meaning": "hospital", "de": "Krankenhaus", "ex": "The hospital is near the station.", "pron": "/ˈhɒspɪtəl/", "pron_de": "/ˈhɒspɪtəl/"}'::jsonb,
        '{"term": "doctor", "meaning": "médico, médica", "de": "Arzt, Ärztin", "ex": "The doctor is very kind.", "pron": "/ˈdɒktə/", "pron_de": "/ˈdɒktə/"}'::jsonb,
        '{"term": "nurse", "meaning": "enfermero, enfermera", "de": "Pfleger, Krankenschwester", "ex": "The nurse asks simple questions.", "pron": "/nɜːs/", "pron_de": "/nɜːs/"}'::jsonb,
        '{"term": "appointment", "meaning": "cita", "de": "Termin", "ex": "My appointment is at ten thirty.", "pron": "/əˈpɔɪntmənt/", "pron_de": "/əˈpɔɪntmənt/"}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM deck WHERE step_order = 2510 AND path_uuid = v_path_id;

    INSERT INTO deck (path_uuid, step_order, source_language, type)
    VALUES (v_path_id, 2510, 'en', 'deck')
    RETURNING uuid INTO v_deck_id;

    INSERT INTO deck_translation (deck_uuid, language, title, description)
    VALUES
        (v_deck_id, 'es', 'Supervivencia II (Salud, Cuerpo Humano y Enfermedades)', 'Vocabulario esencial sobre partes del cuerpo, síntomas, enfermedades y atención médica básica.'),
        (v_deck_id, 'de', 'Überleben II (Gesundheit, Körper und Krankheiten)', 'Grundwortschatz zu Körperteilen, Symptomen, Krankheiten und einfacher medizinischer Versorgung.');

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
