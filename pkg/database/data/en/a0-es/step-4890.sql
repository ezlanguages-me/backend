-- ============================================================
-- Seed: A0 English Path – STEP 4890 – Listening – handle a difficult phone call (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_listening_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El cliente llama por una factura incorrecta.", "p_de": "Der Kunde ruft wegen einer falschen Rechnung an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La factura muestra un recargo por retraso.", "p_de": "Die Rechnung zeigt eine Mahngebühr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El agente se niega a mirar el número de factura.", "p_de": "Der Mitarbeiter weigert sich, die Rechnungsnummer anzusehen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El número de factura es BX-92.", "p_de": "Die Rechnungsnummer ist BX-92.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pagó la factura la semana pasada.", "p_de": "Der Kunde hat die Rechnung letzte Woche bezahlt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El agente enviará una copia corregida en una hora.", "p_de": "Der Mitarbeiter schickt in einer Stunde eine korrigierte Kopie.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cargo extra seguirá en la factura.", "p_de": "Die Zusatzgebühr bleibt auf der Rechnung.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El gerente también puede devolver la llamada por la tarde.", "p_de": "Der Manager kann am Nachmittag ebenfalls zurückrufen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué está molesto el cliente?", "p_de": "Warum ist der Kunde verärgert?", "s": {"type": "multiple_choice", "options": ["The invoice is wrong and has a late fee", "The training room is closed", "The meeting changed rooms"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace primero el agente?", "p_de": "Was macht der Mitarbeiter zuerst?", "s": {"type": "multiple_choice", "options": ["Checks the invoice number", "Ends the call", "Asks for a new order"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número dice el cliente?", "p_de": "Welche Nummer nennt der Kunde?", "s": {"type": "multiple_choice", "options": ["BX-92", "SP-44", "RX-29"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo pagó el cliente?", "p_de": "Wann hat der Kunde bezahlt?", "s": {"type": "multiple_choice", "options": ["Last week", "This morning", "Last month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué enviará el agente?", "p_de": "Was schickt der Mitarbeiter?", "s": {"type": "multiple_choice", "options": ["A corrected copy", "A visitor badge", "A parking pass"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo quitará el cargo extra?", "p_de": "Wann entfernt er die Zusatzgebühr?", "s": {"type": "multiple_choice", "options": ["Today", "Next month", "After the weekend"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién más puede llamar si hace falta?", "p_de": "Wer kann sonst noch anrufen, wenn es nötig ist?", "s": {"type": "multiple_choice", "options": ["The manager", "The driver", "The professor"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo habla el agente?", "p_de": "Wie spricht der Mitarbeiter?", "s": {"type": "multiple_choice", "options": ["Calmly and helpfully", "Angrily and fast", "Very quietly and unclearly"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4890 AND path_uuid = v_path_id);
    DELETE FROM listening WHERE step_order = 4890 AND path_uuid = v_path_id;

    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (v_path_id, 4890, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Support agent and upset customer
## THE SCENE: A tense call about an incorrect invoice
A customer is unhappy about a late fee on the wrong invoice, and the support agent tries to solve the problem calmly.

### DIRECTOR'S NOTES
Style:
* The customer sounds frustrated, but the agent stays calm and practical.
* Problem details and next steps are repeated clearly.

Pace: Natural with short pauses for checking information.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding apologies, invoice details, and calm problem-solving language during a difficult work call.

#### TRANSCRIPT
[upset] Customer: I am calling because your invoice is wrong and it shows a late fee.
[calm] Agent: I am sorry about that. Let me check the number first.
[clear] Customer: The invoice number is BX-92, and I paid it last week.
[professional] Agent: Thank you. I can see the payment now, so the late fee should not be there.
[helpful] Agent: I will send a corrected copy within one hour and remove the extra charge today.
[reassuring] Agent: If you need it, my manager can also call you back this afternoon.
$transcript$)
    RETURNING uuid INTO v_listening_id;

    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'es', 'Gestionar una llamada difícil', '');
    INSERT INTO listening_translation (listening_uuid, language, title, description)
    VALUES (v_listening_id, 'de', 'Ein schwieriges Telefonat bearbeiten', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
