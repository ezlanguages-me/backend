-- ============================================================
-- Seed: A0 English Path – STEP 1580 – Reading – understand messages on automatic cash machines
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El primer mensaje pide insertar la tarjeta.", "p_de": "Die erste Meldung bittet darum, die Karte einzustecken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Después eliges un idioma.", "p_de": "Danach wählt man eine Sprache.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cajero pide escribir la dirección postal.", "p_de": "Der Automat verlangt die Postanschrift.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Una opción de operación es consultar el saldo.", "p_de": "Eine Transaktionsoption ist die Kontostandsabfrage.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mensaje Processing, please wait indica que la operación está en curso.", "p_de": "Die Meldung Processing, please wait bedeutet, dass der Vorgang läuft.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Insufficient funds significa que hay suficiente dinero.", "p_de": "Insufficient funds bedeutet, dass genug Geld vorhanden ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cajero puede ofrecer recibo.", "p_de": "Der Automat kann einen Beleg anbieten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El último mensaje recuerda no olvidar la tarjeta.", "p_de": "Die letzte Meldung erinnert daran, die Karte nicht zu vergessen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué haces primero?", "p_de": "Was macht man zuerst?", "s": {"type": "multiple_choice", "options": ["Insert your card", "Take your cash", "Write your email"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué eliges después de insertar la tarjeta?", "p_de": "Was wählt man nach dem Einstecken der Karte?", "s": {"type": "multiple_choice", "options": ["Language", "A hotel room", "A parcel counter"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número introduces?", "p_de": "Welche Nummer gibt man ein?", "s": {"type": "multiple_choice", "options": ["Your PIN", "Your postcode only", "A tracking number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué operación aparece en la pantalla?", "p_de": "Welche Funktion erscheint auf dem Bildschirm?", "s": {"type": "multiple_choice", "options": ["Cash withdrawal", "Postbox rental", "Loan office"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa Insufficient funds?", "p_de": "Was bedeutet Insufficient funds?", "s": {"type": "multiple_choice", "options": ["There is not enough money", "The bank is closed", "The card is new"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes pedir al final?", "p_de": "Was kann man am Ende wählen?", "s": {"type": "multiple_choice", "options": ["A receipt", "A stamp", "A passport"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debes olvidar?", "p_de": "Was darf man nicht vergessen?", "s": {"type": "multiple_choice", "options": ["Your card", "Your umbrella only", "The counter number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué estás leyendo?", "p_de": "Was liest du?", "s": {"type": "multiple_choice", "options": ["ATM screen messages", "A school timetable", "A weather report"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1580 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1580 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1580, 'en', 'reading', 'banking', 'ATM SCREEN MESSAGES

Welcome. Please insert your card.
Select language.
Enter your PIN.
Select transaction: Cash withdrawal / Balance / Receipt.
Enter amount.
Processing, please wait.
Insufficient funds.
Take your cash.
Would you like a receipt?
Do not forget your card.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Mensajes de un cajero automático', 'Lee mensajes reales y frecuentes de un cajero automático.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Meldungen am Geldautomaten', 'Lies echte und häufige Meldungen eines Geldautomaten.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
