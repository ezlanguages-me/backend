-- ============================================================
-- Seed: A0 English Path – STEP 1410 – Listening – ask to open an account at a bank
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Para abrir la cuenta hay que llevar pasaporte y prueba de domicilio.", "p_de": "Für die Kontoeröffnung braucht man Reisepass und Adressnachweis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El formulario pide número de teléfono y correo electrónico.", "p_de": "Das Formular verlangt Telefonnummer und E-Mail.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El primer depósito es de veinte euros.", "p_de": "Die erste Einzahlung beträgt zwanzig Euro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No se puede usar la banca en línea el mismo día.", "p_de": "Online-Banking kann man nicht am selben Tag nutzen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tarjeta de débito llega en una semana.", "p_de": "Die Debitkarte kommt in einer Woche an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El PIN llega en una carta separada.", "p_de": "Die PIN kommt in einem separaten Brief.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El empleado pide una foto del perro del cliente.", "p_de": "Der Mitarbeiter bittet um ein Foto vom Hund des Kunden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La explicación es para una cuenta básica.", "p_de": "Die Erklärung ist für ein Basiskonto.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué documento personal debes llevar?", "p_de": "Welches persönliche Dokument soll man mitbringen?", "s": {"type": "multiple_choice", "options": ["A passport", "A cinema ticket", "A stamp"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué prueba adicional necesitas?", "p_de": "Welchen zusätzlichen Nachweis braucht man?", "s": {"type": "multiple_choice", "options": ["Proof of address", "A shopping list", "A bus map"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué datos van en el formulario?", "p_de": "Welche Daten kommen auf das Formular?", "s": {"type": "multiple_choice", "options": ["Phone number and email", "Shoe size and favorite song", "Flight number only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto es el primer depósito?", "p_de": "Wie hoch ist die erste Einzahlung?", "s": {"type": "multiple_choice", "options": ["Twenty euros", "Two euros", "One hundred euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes usar hoy mismo?", "p_de": "Was kann man noch heute nutzen?", "s": {"type": "multiple_choice", "options": ["Online banking", "The debit card", "A new passport"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo llega la tarjeta?", "p_de": "Wann kommt die Karte?", "s": {"type": "multiple_choice", "options": ["In one week", "In one hour", "In one month"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo llega el PIN?", "p_de": "Wie kommt die PIN?", "s": {"type": "multiple_choice", "options": ["In a separate letter", "By taxi", "By loudspeaker"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de cuenta es?", "p_de": "Welche Kontoart ist es?", "s": {"type": "multiple_choice", "options": ["A basic account", "A museum account", "A student bus card"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1410 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 1410 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 1410, 'en', 'listening', 'banking', $transcript$
# AUDIO PROFILE: Bank clerk
## "Opening a Basic Account"

## THE SCENE: The account services desk in a local bank
A new customer asks what is necessary to open a basic bank account. The clerk gives a simple checklist.

### DIRECTOR'S NOTES
Style:
* Calm and practical explanation with repeated key items.
* The clerk groups information into documents, form, deposit, and card delivery.

Pace: Slow and steady.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise listening for bank requirements, timelines, and simple procedures.
The language is useful for opening an account in person.

#### TRANSCRIPT
[friendly] To open a basic account, please bring your passport and one proof of address.
[clear] We need your phone number and email on the form.
[practical] The first deposit is twenty euros.
[helpful] You can use online banking today.
[organized] Your debit card arrives in one week.
[reassuring] Your PIN comes in a separate letter.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'es', 'El empleado explica los requisitos para abrir una cuenta', 'Escucha una lista clara de requisitos para abrir una cuenta básica.');

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'de', 'Der Mitarbeiter erklärt die Voraussetzungen für ein Konto', 'Höre eine klare Liste der Voraussetzungen für ein Basiskonto.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
