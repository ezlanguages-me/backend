-- ============================================================
-- Seed: A0 English Path – STEP 1530 – Listening – deal effectively with routine bank/post office transactions
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El cliente quiere ingresar 300 euros.", "p_de": "Der Kunde möchte 300 Euro einzahlen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empleada pide tarjeta de débito y documento de identidad.", "p_de": "Die Mitarbeiterin verlangt Debitkarte und Ausweis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empleada no puede imprimir el saldo.", "p_de": "Die Mitarbeiterin kann den Kontostand nicht ausdrucken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Después del ingreso, el saldo es de 840 euros.", "p_de": "Nach der Einzahlung beträgt der Kontostand 840 Euro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empleada entrega un recibo del ingreso.", "p_de": "Die Mitarbeiterin gibt einen Einzahlungsbeleg.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que comprobar la cantidad antes de salir.", "p_de": "Man soll den Betrag vor dem Gehen prüfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La conversación es sobre un paquete internacional.", "p_de": "Das Gespräch geht um ein internationales Paket.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente está en un banco por la mañana.", "p_de": "Der Kunde ist morgens in einer Bank.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto dinero ingresa?", "p_de": "Wie viel Geld zahlt er ein?", "s": {"type": "multiple_choice", "options": ["300 euros", "30 euros", "3,000 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muestra el cliente?", "p_de": "Was zeigt der Kunde?", "s": {"type": "multiple_choice", "options": ["His debit card and ID", "A parcel and a stamp", "A hotel key"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede imprimir la empleada?", "p_de": "Was kann die Mitarbeiterin drucken?", "s": {"type": "multiple_choice", "options": ["The current balance", "A cinema ticket", "A customs form"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el saldo después del ingreso?", "p_de": "Wie hoch ist der Kontostand nach der Einzahlung?", "s": {"type": "multiple_choice", "options": ["840 euros", "480 euros", "84 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué recibe el cliente?", "p_de": "Was bekommt der Kunde?", "s": {"type": "multiple_choice", "options": ["A receipt", "A new passport", "A postcard"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer antes de salir?", "p_de": "Was soll er vor dem Gehen tun?", "s": {"type": "multiple_choice", "options": ["Check the amount", "Buy coffee", "Call the post office"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de operación hace?", "p_de": "Welche Art von Vorgang macht er?", "s": {"type": "multiple_choice", "options": ["A deposit and balance check", "A parcel return", "A train reservation"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde ocurre la conversación?", "p_de": "Wo findet das Gespräch statt?", "s": {"type": "multiple_choice", "options": ["At a bank counter", "At a library desk", "At a bus stop"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1530 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 1530 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 1530, 'en', 'listening', 'financial', $transcript$
# AUDIO PROFILE: Bank teller
## "Deposit and Balance Check"

## THE SCENE: A normal bank counter on a weekday morning
A customer wants to deposit cash and check the account balance. The teller explains each routine step.

### DIRECTOR'S NOTES
Style:
* Efficient counter language with short confirmations.
* Key actions are heard in the order they happen.

Pace: Natural but clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear a routine deposit, a balance check, and a printed receipt.
The recording helps with everyday bank counter tasks.

#### TRANSCRIPT
[friendly] Good morning. I want to deposit three hundred euros into my account.
[professional] No problem. Please show me your debit card and ID.
[organized] Thank you. I can also print your current balance.
[clear] After the deposit, your balance is eight hundred and forty euros.
[helpful] Here is the receipt for the deposit.
[polite] Please check the amount before you leave.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'es', 'Conversación bancaria rutinaria', 'Escucha una operación bancaria de rutina con ingreso, saldo y recibo.');

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'de', 'Routinegespräch in der Bank', 'Höre einen routinemäßigen Bankvorgang mit Einzahlung, Kontostand und Beleg.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
