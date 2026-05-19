-- ============================================================
-- Seed: A0 English Path – STEP 1370 – Listening – ask to change money at a bank
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La cajera puede cambiar euros a dólares.", "p_de": "Die Mitarbeiterin kann Euro in Dollar wechseln.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un euro vale un dólar y diez centavos.", "p_de": "Ein Euro ist einen Dollar und zehn Cent wert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente muestra un pasaporte.", "p_de": "Der Kunde zeigt einen Reisepass.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay que firmar ningún formulario.", "p_de": "Man muss kein Formular unterschreiben.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Después de la comisión, el cliente recibe 105 dólares.", "p_de": "Nach der Gebühr bekommt der Kunde 105 Dollar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La comisión es de cinco dólares.", "p_de": "Die Gebühr beträgt fünf Dollar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cajera no entrega recibo.", "p_de": "Die Mitarbeiterin gibt keinen Beleg.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que contar el dinero antes de salir.", "p_de": "Man soll das Geld vor dem Gehen zählen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué moneda quiere el cliente?", "p_de": "Welche Währung möchte der Kunde?", "s": {"type": "multiple_choice", "options": ["Dollars", "Pounds", "Coins only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la tasa de hoy?", "p_de": "Wie ist der Kurs heute?", "s": {"type": "multiple_choice", "options": ["One euro = 1.10 dollars", "One euro = 2 dollars", "One euro = 0.50 dollars"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué documento muestra el cliente?", "p_de": "Welches Dokument zeigt der Kunde?", "s": {"type": "multiple_choice", "options": ["A passport", "A library card", "A driving map"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe firmar?", "p_de": "Was muss er unterschreiben?", "s": {"type": "multiple_choice", "options": ["A short form", "A long contract", "A school report"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dinero recibe?", "p_de": "Wie viel Geld bekommt er?", "s": {"type": "multiple_choice", "options": ["105 dollars", "95 dollars", "150 dollars"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recibe además del dinero?", "p_de": "Was bekommt er außer dem Geld?", "s": {"type": "multiple_choice", "options": ["A receipt", "A sandwich", "A passport photo"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer antes de salir?", "p_de": "Was soll er vor dem Gehen tun?", "s": {"type": "multiple_choice", "options": ["Count the money", "Call the hotel", "Buy stamps"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ocurre la escena?", "p_de": "Wo spielt die Szene?", "s": {"type": "multiple_choice", "options": ["At a bank exchange desk", "At a museum", "At a train station"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1370 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 1370 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 1370, 'en', 'listening', 'financial', $transcript$
# AUDIO PROFILE: Bank teller
## "Changing Euros into Dollars"

## THE SCENE: A foreign exchange desk inside a bank
A customer wants to change 100 euros into dollars. The teller explains the process step by step.

### DIRECTOR'S NOTES
Style:
* Short service language with clear numbers and actions.
* The teller repeats the key documents and fees.

Pace: Slow, careful pace for numbers.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise common bank exchange language with ID, form, and receipt details.
The recording is useful for simple travel money situations.

#### TRANSCRIPT
[professional] Good afternoon. Yes, we can change your euros into dollars.
[clear] Today, one euro is one dollar and ten cents.
[helpful] Please show me your passport and sign this short form.
[organized] For one hundred euros, you receive one hundred and five dollars after the five dollar fee.
[friendly] Here are your notes and coins.
[polite] This is your receipt. Please count the money before you leave.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'es', 'La cajera explica cómo cambiar dinero', 'Escucha una explicación sencilla del proceso para cambiar euros por dólares.');

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'de', 'Die Bankangestellte erklärt den Geldwechsel', 'Höre eine einfache Erklärung des Ablaufs, um Euro in Dollar zu wechseln.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
