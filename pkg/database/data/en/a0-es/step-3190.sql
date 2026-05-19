-- ============================================================
-- Seed: A0 English Path – STEP 3190 – Reading – understand flight and train announcements (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El tren 204 a Lake City lleva quince minutos de retraso.", "de": "Zug 204 nach Lake City hat fünfzehn Minuten Verspätung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La nueva salida del tren 204 es a las 14:05.", "de": "Die neue Abfahrt von Zug 204 ist um 14:05 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El autobús A1 al aeropuerto va a tiempo.", "de": "Der Bus A1 zum Flughafen ist pünktlich.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay que esperar el autobús del aeropuerto en la parada C.", "de": "Man soll den Flughafenbus an Haltestelle C nehmen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El vuelo AB312 va a Berlin.", "de": "Flug AB312 geht nach Berlin.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La puerta 18 ya esta abierta.", "de": "Gate 18 ist jetzt offen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tren 88 a River Town está cancelado por mal tiempo.", "de": "Zug 88 nach River Town ist wegen schlechten Wetters abgesagt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Los pasajeros a River Town deben usar el tren 90.", "de": "Fahrgaste nach River Town sollen Zug 90 benutzen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué tren lleva retraso?", "de": "Welcher Zug hat Verspätung?", "s_es": {"type": "multiple_choice", "options": ["Train 204 to Lake City", "Train 88 to River Town", "Train 12 to South Port"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zug 204 nach Lake City", "Zug 88 nach River Town", "Zug 12 nach South Port"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la nueva hora de salida?", "de": "Wie lautet die neue Abfahrtszeit?", "s_es": {"type": "multiple_choice", "options": ["14:25", "14:05", "15:25"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14:25", "14:05", "15:25"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué parada se espera el autobús A1?", "de": "An welcher Haltestelle wartet man auf den Bus A1?", "s_es": {"type": "multiple_choice", "options": ["Stop B", "Stop C", "Stop F"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Haltestelle B", "Haltestelle C", "Haltestelle F"], "answer": 0}}'::jsonb,
        '{"es": "¿A dónde va el vuelo AB312?", "de": "Wohin geht Flug AB312?", "s_es": {"type": "multiple_choice", "options": ["Berlin", "Madrid", "Rome"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Berlin", "Madrid", "Rom"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora cierra el embarque?", "de": "Um wie viel Uhr schließt das Boarding?", "s_es": {"type": "multiple_choice", "options": ["09:10", "09:40", "10:10"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["09:10", "09:40", "10:10"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué está cancelado el tren 88?", "de": "Warum ist Zug 88 abgesagt?", "s_es": {"type": "multiple_choice", "options": ["Because of staff illness", "Because of snow", "Because of a new bridge"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wegen Personalausfall", "Wegen Schnee", "Wegen einer neuen Brücke"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde qué andén sale el tren 90?", "de": "Von welchem Bahnsteig fährt Zug 90 ab?", "s_es": {"type": "multiple_choice", "options": ["Platform 2", "Platform 6", "Platform 9"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bahnsteig 2", "Bahnsteig 6", "Bahnsteig 9"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué servicio va a tiempo?", "de": "Welcher Service ist pünktlich?", "s_es": {"type": "multiple_choice", "options": ["Airport bus A1", "Train 204", "Train 88"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Flughafenbus A1", "Zug 204", "Zug 88"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3190 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3190 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3190, 'en', 'reading', 'transport', $content$
Travel Announcements

Train 204 to Lake City: delayed 15 minutes. New departure time 14:25. Platform 6.

Airport bus A1 to West Airport: on time. Please wait at Stop B.

Flight AB312 to Berlin: gate 18 is now open. Boarding closes at 09:10.

Train 88 to River Town: cancelled because of staff illness. Use train 90 at 16:40 from Platform 2.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee anuncios de trenes y vuelos', 'Lee varios anuncios cortos de viaje sobre retrasos, puertas y cambios de plataforma.'),
        (v_reading_id, 'de', 'Lies Ansagen zu Zügen und Flügen', 'Lies mehrere kurze Reiseansagen zu Verspätungen, Gates und Bahnsteigänderungen.');

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
