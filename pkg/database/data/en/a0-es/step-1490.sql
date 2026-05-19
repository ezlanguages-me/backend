-- ============================================================
-- Seed: A0 English Path – STEP 1490 – Listening – understand routine bank explanations
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El límite del cajero automático es de 300 euros al día.", "p_de": "Das Limit am Geldautomaten beträgt 300 Euro pro Tag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sucursal puede dar 1.000 euros el mismo día.", "p_de": "Die Filiale kann am selben Tag 1.000 Euro geben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para cantidades mayores se necesita un día laborable de aviso.", "p_de": "Für größere Beträge braucht man einen Werktag Vorlauf.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta documento de identidad al recoger el dinero.", "p_de": "Man braucht keinen Ausweis bei der Abholung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los extractos siguen llegando por email cada mes.", "p_de": "Die Kontoauszüge kommen weiterhin jeden Monat per E-Mail.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay comisión por retirar dinero en esta sucursal.", "p_de": "Es gibt eine Gebühr für Auszahlungen in dieser Filiale.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La explicación es sobre sellos y paquetes.", "p_de": "Die Erklärung geht um Briefmarken und Pakete.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente pregunta por qué el cajero no dio todo el dinero.", "p_de": "Der Kunde fragt, warum der Automat nicht den ganzen Betrag ausgezahlt hat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuál es el límite diario del cajero?", "p_de": "Wie hoch ist das tägliche Automatenlimit?", "s": {"type": "multiple_choice", "options": ["300 euros", "30 euros", "3,000 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto puede dar la sucursal el mismo día?", "p_de": "Wie viel kann die Filiale am selben Tag geben?", "s": {"type": "multiple_choice", "options": ["1,000 euros", "100 euros", "10 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto aviso hace falta para cantidades mayores?", "p_de": "Wie viel Vorlauf braucht man für größere Beträge?", "s": {"type": "multiple_choice", "options": ["One working day", "One month", "No notice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar al recoger el efectivo?", "p_de": "Was muss man bei der Abholung mitbringen?", "s": {"type": "multiple_choice", "options": ["Your ID", "A postcard", "A customs form"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo llegan los extractos?", "p_de": "Wie kommen die Auszüge?", "s": {"type": "multiple_choice", "options": ["By email", "By bicycle messenger", "By ship"], "answer": 0}}'::jsonb,
        '{"p": "¿Hay comisión en esta sucursal?", "p_de": "Gibt es in dieser Filiale eine Gebühr?", "s": {"type": "multiple_choice", "options": ["No", "Yes, 10 euros", "Only on Sundays"], "answer": 0}}'::jsonb,
        '{"p": "¿Sobre qué habla la asesora?", "p_de": "Worüber spricht die Beraterin?", "s": {"type": "multiple_choice", "options": ["Withdrawal limits", "Parcel boxes", "Train tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tuvo el cliente?", "p_de": "Welches Problem hatte der Kunde?", "s": {"type": "multiple_choice", "options": ["The ATM did not give all the money", "The postbox was full", "The envelope was blue"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1490 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 1490 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 1490, 'en', 'listening', 'banking', $transcript$
# AUDIO PROFILE: Bank advisor
## "Cash Withdrawal Limits"

## THE SCENE: Customer service desk in a bank branch
A customer asks why the ATM did not give all the money. The advisor explains the normal limits and the notice period for larger amounts.

### DIRECTOR'S NOTES
Style:
* Calm explanation with repeated numbers and practical options.
* The advisor compares ATM service and branch service clearly.

Pace: Measured pace.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding everyday explanations about limits, fees, and notice periods.
The recording helps with common cash withdrawal questions.

#### TRANSCRIPT
[reassuring] The ATM limit is three hundred euros per day.
[clear] If you need more cash, the branch can give you one thousand euros on the same day.
[informative] For larger amounts, we need one working day notice.
[practical] Please bring your ID when you collect the cash.
[helpful] Your statements still arrive by email every month.
[friendly] There is no fee for withdrawals at this branch.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'es', 'Explicación sobre límites de retirada', 'Escucha una explicación bancaria rutinaria sobre límites y aviso previo para retirar efectivo.');

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'de', 'Erklärung zu Auszahlungslimits', 'Höre eine routinemäßige Bankerklärung zu Limits und Vorlaufzeit für Bargeldabhebungen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
