-- ============================================================
-- Seed: A0 English Path – STEP 1400 – Reading – ask to open an account at a bank provided that the procedure is straightforward (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La cuenta se llama Easy Start Account.", "p_de": "Das Konto heißt Easy Start Account.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede abrir en diez minutos.", "p_de": "Man kann es in zehn Minuten eröffnen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Solo hace falta un pasaporte y nada más.", "p_de": "Man braucht nur einen Reisepass und sonst nichts.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que llevar una prueba de domicilio.", "p_de": "Man muss einen Adressnachweis mitbringen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El primer depósito es de 25 euros.", "p_de": "Die erste Einzahlung beträgt 25 Euro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cuenta tiene una cuota mensual.", "p_de": "Das Konto hat eine monatliche Gebühr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tarjeta de débito llega en cinco días laborables.", "p_de": "Die Debitkarte kommt in fünf Werktagen an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los extractos llegan por correo electrónico cada mes.", "p_de": "Die Kontoauszüge kommen jeden Monat per E-Mail.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Dónde abres la cuenta?", "p_de": "Wo eröffnet man das Konto?", "s": {"type": "multiple_choice", "options": ["At Account Services", "At the parcel counter", "At the café"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué documento adicional necesitas además del pasaporte o DNI?", "p_de": "Welches zusätzliche Dokument braucht man außer Reisepass oder Ausweis?", "s": {"type": "multiple_choice", "options": ["Proof of address", "A train ticket", "A school notebook"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué rellenas?", "p_de": "Was füllt man aus?", "s": {"type": "multiple_choice", "options": ["One short form", "A long medical form", "A customs form"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué información escribes?", "p_de": "Welche Angaben schreibt man?", "s": {"type": "multiple_choice", "options": ["Name, address, phone number, and email", "Only a favorite color", "Only a passport number"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el primer depósito?", "p_de": "Wie hoch ist die erste Einzahlung?", "s": {"type": "multiple_choice", "options": ["25 euros", "5 euros", "250 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tarjeta recibes?", "p_de": "Welche Karte bekommt man?", "s": {"type": "multiple_choice", "options": ["A debit card", "A library card", "A travel card"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo llegan los extractos?", "p_de": "Wie kommen die Kontoauszüge?", "s": {"type": "multiple_choice", "options": ["By email every month", "By taxi every Friday", "By text message every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde pides un extracto en papel?", "p_de": "Wo fragt man nach einem Papierauszug?", "s": {"type": "multiple_choice", "options": ["At the branch", "At the airport", "At the postbox"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1400 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1400 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1400, 'en', 'reading', 'banking', 'Easy Start Account

Open a basic account in ten minutes at Account Services. Bring your passport or national ID and one proof of address, for example a utility bill or a rental letter.

Please complete one short form with your name, address, phone number, and email. The first deposit is 25 euros.

The account has no monthly fee. You receive a debit card in five working days, and you can use online banking and the ATM on the same day.

Statements arrive by email every month. You can ask for a paper statement at the branch.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Abrir una cuenta bancaria sencilla', 'Lee un folleto bancario sencillo con requisitos, depósito inicial y servicios básicos.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Ein einfaches Bankkonto eröffnen', 'Lies einen einfachen Bankprospekt mit Voraussetzungen, erster Einzahlung und Basisleistungen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
