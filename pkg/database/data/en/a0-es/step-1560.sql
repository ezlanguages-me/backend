-- ============================================================
-- Seed: A0 English Path – STEP 1560 – Reading – understand where to go in a bank or post office by reading the signs
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Cashiers están en el mostrador 1.", "p_de": "Cashiers sind an Schalter 1.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Foreign Exchange está en el mostrador 2.", "p_de": "Foreign Exchange ist an Schalter 2.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Account Services está en la oficina B.", "p_de": "Account Services ist in Büro B.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los cajeros automáticos están en el vestíbulo.", "p_de": "Die Geldautomaten sind in der Lobby.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Customer Service está en Desk A.", "p_de": "Customer Service ist an Desk A.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Registered Mail está en el mostrador 3.", "p_de": "Registered Mail ist an Schalter 3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Parcel Collection está en el mostrador 2.", "p_de": "Parcel Collection ist an Schalter 2.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Tracking Help está en el Information Desk.", "p_de": "Tracking Help ist am Information Desk.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde vas para cambiar dinero?", "p_de": "Wohin geht man zum Geldwechsel?", "s": {"type": "multiple_choice", "options": ["Counter 2", "Office B", "Counter 5"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde vas para servicios de cuenta?", "p_de": "Wohin geht man für Kontodienste?", "s": {"type": "multiple_choice", "options": ["Counter 4", "Desk A", "Lobby"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están los préstamos?", "p_de": "Wo sind die Kredite?", "s": {"type": "multiple_choice", "options": ["Office B", "Counter 1", "Information Desk"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están los ATMs?", "p_de": "Wo sind die Geldautomaten?", "s": {"type": "multiple_choice", "options": ["Lobby", "Counter 3", "Office B"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde compras sellos?", "p_de": "Wo kauft man Briefmarken?", "s": {"type": "multiple_choice", "options": ["Counter 1", "Counter 4", "Desk A"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde recoges un paquete?", "p_de": "Wo holt man ein Paket ab?", "s": {"type": "multiple_choice", "options": ["Counter 5", "Counter 2", "Office B"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde preguntas por seguimiento?", "p_de": "Wo fragt man nach Sendungsverfolgung?", "s": {"type": "multiple_choice", "options": ["Information Desk", "Lobby", "Loans Office"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué estás leyendo?", "p_de": "Was liest du?", "s": {"type": "multiple_choice", "options": ["Signs in a bank and post office", "A restaurant menu", "A homework list"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1560 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1560 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1560, 'en', 'reading', 'banking', 'BANK LOBBY SIGNS

Cashiers → Counter 1
Foreign Exchange → Counter 2
Account Services → Counter 4
Loans → Office B
ATMs → Lobby
Customer Service → Desk A

POST OFFICE SIGNS

Stamps and Envelopes → Counter 1
Registered Mail → Counter 3
Parcel Collection → Counter 5
Tracking Help → Information Desk')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Señales dentro del banco y de correos', 'Lee señales reales para saber adónde ir dentro del banco o de la oficina de correos.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Schilder in Bank und Post', 'Lies echte Schilder, um den richtigen Ort in Bank oder Post zu finden.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
