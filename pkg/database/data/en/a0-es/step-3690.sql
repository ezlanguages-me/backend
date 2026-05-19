-- ============================================================
-- Seed: A0 English Path – STEP 3690 – Reading – understand tourism brochures (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Hay mapas gratis en la Tourist Office de King Street.", "p_de": "Es gibt kostenlose Stadtpläne im Tourist Office in der King Street.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los boat tours salen del museo.", "p_de": "Die Bootstouren starten am Museum.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay un paseo en barco a las 11 AM y otro a las 3 PM.", "p_de": "Es gibt eine Bootstour um 11 Uhr und eine um 15 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El market está abierto el sábado de 9 AM a 4 PM.", "p_de": "Der Markt ist am Samstag von 9 Uhr bis 16 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El City Pass cuesta £10.", "p_de": "Der City Pass kostet £10.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El City Pass incluye el history museum y un boat tour.", "p_de": "Der City Pass enthält das history museum und eine Bootstour.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La Tourist Office cierra a las 8 PM.", "p_de": "Das Tourist Office schließt um 20 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El último bus a Hill Park sale a las 7:30 PM.", "p_de": "Der letzte Bus zum Hill Park fährt um 19:30 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde consigues mapas gratis?", "p_de": "Wo bekommt man kostenlose Karten?", "s_es": {"type": "multiple_choice", "options": ["At the Tourist Office on King Street", "At the central bridge", "At Hill Park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Tourist Office in der King Street", "An der zentralen Brücke", "Im Hill Park"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde dónde salen los boat tours?", "p_de": "Von wo fahren die Bootstouren ab?", "s_es": {"type": "multiple_choice", "options": ["From the central bridge", "From the market", "From the clock tower"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Von der zentralen Brücke", "Vom Markt", "Vom Uhrturm"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora sale la primera boat tour?", "p_de": "Um wie viel Uhr fährt die erste Bootstour?", "s_es": {"type": "multiple_choice", "options": ["11 AM", "9 AM", "3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["11 Uhr", "9 Uhr", "15 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo abre el market?", "p_de": "Wann ist der Markt geöffnet?", "s_es": {"type": "multiple_choice", "options": ["On Saturday from 9 AM to 4 PM", "Every day until 9 PM", "On Sunday morning only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Samstag von 9 Uhr bis 16 Uhr", "Jeden Tag bis 21 Uhr", "Nur am Sonntagvormittag"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el City Pass?", "p_de": "Wie viel kostet der City Pass?", "s_es": {"type": "multiple_choice", "options": ["£12", "£10", "£15"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£12", "£10", "£15"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluye el City Pass?", "p_de": "Was beinhaltet der City Pass?", "s_es": {"type": "multiple_choice", "options": ["The history museum and one boat tour", "Two bus tickets", "Only the market"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das History Museum und eine Bootstour", "Zwei Bustickets", "Nur den Markt"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora abre la Tourist Office?", "p_de": "Bis wann ist das Tourist Office geöffnet?", "s_es": {"type": "multiple_choice", "options": ["6 PM", "7:30 PM", "9 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 Uhr", "19:30 Uhr", "21 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿A dónde va el último bus de las 7:30 PM?", "p_de": "Wohin fährt der letzte Bus um 19:30 Uhr?", "s_es": {"type": "multiple_choice", "options": ["To Hill Park", "To the airport", "To the market"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum Hill Park", "Zum Flughafen", "Zum Markt"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3690 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3690 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3690, 'en', 'reading', 'tourism', $content$Visit River City this weekend. Walk through the Old Town and see the clock tower. Free city maps are available at the Tourist Office on King Street.

Boat tours leave from the central bridge at 11 AM and 3 PM every day. The market in Market Square is open on Saturday from 9 AM to 4 PM.

Buy a City Pass for £12. It includes the history museum and one boat tour. The Tourist Office is open from 9 AM to 6 PM. The last bus to Hill Park leaves at 7:30 PM.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee folletos turísticos', 'Lee un folleto con lugares, horarios y servicios para visitantes en una ciudad.'),
            (v_reading_id, 'de', 'Lies Tourismusbroschüren', 'Lies einen Prospekt mit Orten, Zeiten und Angeboten für Besucher einer Stadt.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
