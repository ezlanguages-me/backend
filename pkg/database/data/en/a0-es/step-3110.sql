-- ============================================================
-- Seed: A0 English Path – STEP 3110 – Reading – understand breakdown instructions (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El conductor debe mover el coche a un lugar seguro y poner las luces de emergencia.", "de": "Der Fahrer soll das Auto an einen sicheren Ort bringen und das Warnblinklicht einschalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "En la autopista, el conductor debe esperar dentro del coche.", "de": "Auf der Autobahn soll der Fahrer im Auto warten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El número de Road Help es 0800 44 55 66.", "de": "Die Nummer von Road Help ist 0800 44 55 66.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ubicación puede encontrarse en una señal de la carretera.", "de": "Den Standort kann man auf einem Straßenschild finden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La ayuda solo viene por problemas del motor.", "de": "Die Hilfe kommt nur bei Motorproblemen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El tiempo normal de espera es de unos cuarenta y cinco minutos.", "de": "Die normale Wartezeit ist etwa fünfundvierzig Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El remolque gratuito llega hasta el garaje más cercano dentro de veinticinco kilómetros.", "de": "Das kostenlose Abschleppen geht bis zur nächsten Werkstatt innerhalb von fünfundzwanzig Kilometern.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las bolsas deben quedarse en el coche.", "de": "Die Taschen müssen im Auto bleiben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué debe hacer primero el conductor?", "de": "Was soll der Fahrer zuerst tun?", "s_es": {"type": "multiple_choice", "options": ["Move the car to a safe place and turn on the hazard lights", "Open all the doors", "Walk in the road"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Auto an einen sicheren Ort bringen und das Warnblinklicht einschalten", "Alle Türen öffnen", "Auf der Straße gehen"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debe esperar en la autopista?", "de": "Wo soll man auf der Autobahn warten?", "s_es": {"type": "multiple_choice", "options": ["Behind the barrier", "In front of the car", "In the middle of the road"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter der Leitplanke", "Vor dem Auto", "Mitten auf der Straße"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dos datos debe decir a Road Help?", "de": "Welche zwei Angaben soll man Road Help nennen?", "s_es": {"type": "multiple_choice", "options": ["The car number and your location", "The hotel menu and the weather", "Your shoe size and your age"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Autonummer und den Standort", "Die Speisekarte des Hotels und das Wetter", "Die Schuhgröße und das Alter"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde puede encontrar su ubicación?", "de": "Wo kann man seinen Standort finden?", "s_es": {"type": "multiple_choice", "options": ["On the nearest road sign", "On the radio", "On your bag"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem nächsten Straßenschild", "Im Radio", "Auf der Tasche"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué problema puede venir un mecánico?", "de": "Bei welchem Problem kann ein Mechaniker kommen?", "s_es": {"type": "multiple_choice", "options": ["A flat tyre", "A lost passport", "A late train"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bei einem platten Reifen", "Bei einem verlorenen Reisepass", "Bei einem verspäteten Zug"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto dura la espera normal?", "de": "Wie lange ist die normale Wartezeit?", "s_es": {"type": "multiple_choice", "options": ["About forty five minutes", "About five hours", "About two days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Etwa fünfundvierzig Minuten", "Etwa fünf Stunden", "Etwa zwei Tage"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué servicio gratuito recibe el conductor?", "de": "Welchen kostenlosen Service bekommt der Fahrer?", "s_es": {"type": "multiple_choice", "options": ["One tow to the nearest garage within twenty five kilometres", "One free flight", "One hotel room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Abschleppen zur nächsten Werkstatt innerhalb von fünfundzwanzig Kilometern", "Einen kostenlosen Flug", "Ein Hotelzimmer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe llevar consigo?", "de": "Was soll man bei sich behalten?", "s_es": {"type": "multiple_choice", "options": ["Your key, phone, and rental papers", "Only the empty bottle", "Only the radio"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schlüssel, Telefon und Mietpapiere", "Nur die leere Flasche", "Nur das Radio"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3110 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 3110 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3110, 'en', 'reading', 'transport', $content$
Road Help Card for Rental Cars

If your car stops, move it to a safe place and turn on the hazard lights. If you are on a motorway, leave the car on the passenger side and wait behind the barrier.

Call Road Help on 0800 44 55 66. Tell the team your car number, your location, and the problem. You can find your location on the nearest road sign.

A mechanic can come for a flat tyre, a flat battery, or an engine problem. The normal waiting time is about forty five minutes. Keep your key, phone, and rental papers with you.

Road Help gives one free tow to the nearest garage within twenty five kilometres. Bags stay with the driver. Do not leave children alone in the car.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee instrucciones para una avería en carretera', 'Lee una tarjeta de ayuda en carretera para un coche de alquiler y entiende qué hacer si el coche se para.'),
        (v_reading_id, 'de', 'Lies Anweisungen bei einer Panne', 'Lies eine Karte mit Pannenhilfe für einen Mietwagen und verstehe, was man tun soll, wenn das Auto stehen bleibt.');

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
