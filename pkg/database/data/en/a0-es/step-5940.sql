-- ============================================================
-- Seed: A0 English Path – STEP 5940 – Reading – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El servicio de habitaciones está disponible por la noche.", "de": "Der Zimmerservice ist abends verfügbar.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La lavandería exige dejar la ropa antes del mediodía.", "de": "Der Wäscheservice verlangt, dass man die Kleidung vor Mittag abgibt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El gimnasio está en la primera planta.", "de": "Der Fitnessraum ist im ersten Stock.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La piscina abre de 8 AM a 8 PM.", "de": "Der Pool ist von 8 bis 20 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las bebidas calientes son gratuitas en el salón entre 4 PM y 6 PM.", "de": "Heißgetränke sind in der Lounge zwischen 16 und 18 Uhr kostenlos.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La recepción puede ayudar con taxis.", "de": "Die Rezeption kann bei Taxis helfen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El aparcamiento gratuito está delante del hotel.", "de": "Der kostenlose Parkplatz liegt vor dem Hotel.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El ascensor está junto a la recepción.", "de": "Der Aufzug steht neben der Rezeption.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿A qué hora abre el gimnasio?", "de": "Wann öffnet der Fitnessraum?", "s_es": {"type": "multiple_choice", "options": ["6 AM", "8 AM", "10 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6 Uhr", "8 Uhr", "10 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está la piscina?", "de": "Wo ist der Pool?", "s_es": {"type": "multiple_choice", "options": ["On the first floor", "On the third floor", "On the roof"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im ersten Stock", "Im dritten Stock", "Auf dem Dach"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo está disponible el servicio de habitaciones?", "de": "Wann ist der Zimmerservice verfügbar?", "s_es": {"type": "multiple_choice", "options": ["6 PM to 10 PM", "6 AM to 10 AM", "All night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 bis 22 Uhr", "6 bis 10 Uhr", "Die ganze Nacht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué deben hacer antes del mediodía?", "de": "Was muss man vor Mittag tun?", "s_es": {"type": "multiple_choice", "options": ["Hand in clothes", "Check out", "Book a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kleidung abgeben", "Auschecken", "Ein Taxi buchen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué ofrece la recepción?", "de": "Wobei hilft die Rezeption?", "s_es": {"type": "multiple_choice", "options": ["Extra towels", "Movie tickets only", "Train driving lessons"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zusätzliche Handtücher", "Nur Kinokarten", "Fahrstunden im Zug"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el aparcamiento gratuito?", "de": "Wo ist der kostenlose Parkplatz?", "s_es": {"type": "multiple_choice", "options": ["Behind the hotel", "Next to the pool", "On the third floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter dem Hotel", "Neben dem Pool", "Im dritten Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué está junto a recepción?", "de": "Was steht neben der Rezeption?", "s_es": {"type": "multiple_choice", "options": ["Lift", "Laundry room", "Gym"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Aufzug", "Waschraum", "Fitnessraum"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo son gratis las bebidas calientes?", "de": "Wann sind heiße Getränke kostenlos?", "s_es": {"type": "multiple_choice", "options": ["4 PM to 6 PM", "6 AM to 8 AM", "9 PM to 11 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["16 bis 18 Uhr", "6 bis 8 Uhr", "21 bis 23 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5940 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5940 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5940, 'en', 'reading', 'Alojamiento', $reading$
Riverside Hotel services

Room service is available from 6 PM to 10 PM. Laundry service is open every day, but you must hand in clothes before noon.

The gym is on the third floor and opens at 6 AM. The swimming pool is on the first floor and opens from 8 AM to 8 PM.

Hot drinks are free in the lounge between 4 PM and 6 PM. Guests can ask reception for extra towels, a wake-up call, or taxi help.

Free parking is behind the hotel. The lift is next to reception and works to all floors.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee la descripción de los servicios del hotel', 'Lee una descripción breve de los servicios, instalaciones y horarios del hotel.'),
        (v_reading_id, 'de', 'Lies die Beschreibung der Hotelleistungen', 'Lies eine kurze Beschreibung der Hotelservices, Einrichtungen und Zeiten.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;

