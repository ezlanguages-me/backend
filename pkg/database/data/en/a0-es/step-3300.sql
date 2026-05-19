-- ============================================================
-- Seed: A0 English Path – STEP 3300 – Reading – understand theft/crime notices
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Hubo carteristas en el mercado del sábado.", "de": "Im Samstagsmarkt waren Taschendiebe unterwegs.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los robos del mercado ocurrieron entre la una y las tres.", "de": "Die Diebstähle auf dem Markt passierten zwischen ein und drei Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El aviso recomienda llevar el teléfono en un bolsillo delantero.", "de": "Der Hinweis empfiehlt, das Telefon in einer Vordertasche zu tragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Robaron dos bicicletas fuera de Riverside Library.", "de": "Vor der Riverside Library wurden zwei Fahrräder gestohlen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las bicicletas pueden dejarse en cualquier lugar junto al río.", "de": "Fahrräder können überall am Fluss abgestellt werden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Encontraron una cartera negra en Green Lane.", "de": "Eine schwarze Geldbörse wurde in Green Lane gefunden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El objeto encontrado tiene el número 17.", "de": "Der gefundene Gegenstand hat die Nummer 17.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Siempre hay que llamar al 112, incluso si nadie está en peligro.", "de": "Man soll immer 112 anrufen, auch wenn niemand in Gefahr ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Dónde trabajaron los carteristas?", "de": "Wo waren die Taschendiebe aktiv?", "s_es": {"type": "multiple_choice", "options": ["In the Saturday market", "At the bus station", "Inside the library"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf dem Samstagsmarkt", "Am Busbahnhof", "In der Bibliothek"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe cerrar la gente?", "de": "Was sollen die Leute schließen?", "s_es": {"type": "multiple_choice", "options": ["Their bag", "Their bike light", "Their notebook"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ihre Tasche", "Ihr Fahrradlicht", "Ihr Notizbuch"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántas bicicletas robaron?", "de": "Wie viele Fahrräder wurden gestohlen?", "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Four"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eins", "Vier"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde deben dejarse las bicicletas?", "de": "Wo sollen Fahrräder abgestellt werden?", "s_es": {"type": "multiple_choice", "options": ["In the metal bike area by the main door", "Behind the library café", "On Green Lane"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Metall-Fahrradbereich an der Haupttür", "Hinter dem Bibliothekscafé", "In Green Lane"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde llevaron la cartera encontrada?", "de": "Wohin brachte man die gefundene Geldbörse?", "s_es": {"type": "multiple_choice", "options": ["To South Police Desk", "To Riverside Library", "To Café 17"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum South Police Desk", "Zur Riverside Library", "Zu Café 17"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número debe pedir la persona dueña?", "de": "Welche Nummer soll die Besitzerin oder der Besitzer nennen?", "s_es": {"type": "multiple_choice", "options": ["Item 17", "Case 71", "Desk 6"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Gegenstand 17", "Fall 71", "Schalter 6"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número se usa para un informe sin urgencia?", "de": "Welche Nummer benutzt man für eine nicht dringende Meldung?", "s_es": {"type": "multiple_choice", "options": ["101", "112", "999"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["101", "112", "999"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué no debe hacer una persona si ve un robo?", "de": "Was soll eine Person nicht tun, wenn sie einen Diebstahl sieht?", "s_es": {"type": "multiple_choice", "options": ["Follow the suspect alone", "Call the police", "Close the bag"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dem Verdächtigen allein folgen", "Die Polizei anrufen", "Die Tasche schließen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3300 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3300 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3300 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3300 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3300 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3300 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3300 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3300 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3300 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3300 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 3300, 'en', 'reading', 'emergency', $content$
Town Police Safety Notice. Pickpockets worked in the Saturday market between 11 AM and 1 PM. Keep your phone in a front pocket and close your bag.

Two bicycles were stolen outside Riverside Library last night. Use two locks and leave bikes only in the metal bike area by the main door.

A black wallet was found on Green Lane at 6 PM and taken to South Police Desk. Ask for item 17 if you think it is yours.

If you see a theft, do not follow the suspect alone. Call 101 for a non-emergency report or 112 if someone is in danger.
$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee avisos sobre robos y seguridad', 'Lee varios avisos de la policía local sobre carteristas, bicicletas y objetos encontrados.'),
        (v_reading_id, 'de', 'Lies Hinweise zu Diebstahl und Sicherheit', 'Lies mehrere Hinweise der örtlichen Polizei zu Taschendiebstahl, Fahrrädern und Fundstücken.');

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
