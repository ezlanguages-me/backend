-- ============================================================
-- Seed: A0 English Path – STEP 1450 – Listening – ask questions related to post office services
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El empleado puede ayudar a seguir el paquete.", "p_de": "Der Mitarbeiter kann bei der Sendungsverfolgung helfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente debe mostrar el recibo con el número de seguimiento.", "p_de": "Der Kunde soll den Beleg mit der Sendungsnummer zeigen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El sistema dice que el paquete salió de la ciudad anoche.", "p_de": "Das System sagt, dass das Paket gestern Nacht die Stadt verlassen hat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paquete llega hoy antes de las seis.", "p_de": "Das Paket kommt heute vor sechs Uhr an.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "También se puede comprobar el seguimiento en línea.", "p_de": "Man kann die Verfolgung auch online prüfen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La oficina puede enviar actualizaciones por mensajes de texto.", "p_de": "Die Post kann Updates per SMS senden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El empleado pide un número de tarjeta bancaria.", "p_de": "Der Mitarbeiter verlangt eine Bankkartennummer.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La conversación trata de un paquete perdido en un hotel.", "p_de": "Das Gespräch handelt von einem verlorenen Paket in einem Hotel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué debe enseñar el cliente?", "p_de": "Was soll der Kunde zeigen?", "s": {"type": "multiple_choice", "options": ["The receipt with the tracking number", "A train ticket", "A passport photo"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasó anoche?", "p_de": "Was ist gestern Nacht passiert?", "s": {"type": "multiple_choice", "options": ["The parcel left the city", "The parcel was opened", "The parcel returned to the shop"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe llegar?", "p_de": "Wann soll es ankommen?", "s": {"type": "multiple_choice", "options": ["Tomorrow before six in the evening", "Today at noon", "Next month"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde más se puede mirar el seguimiento?", "p_de": "Wo kann man die Verfolgung sonst noch sehen?", "s": {"type": "multiple_choice", "options": ["Online", "Only in a bank", "Only at school"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de actualizaciones ofrecen?", "p_de": "Welche Art von Updates bieten sie an?", "s": {"type": "multiple_choice", "options": ["Text messages", "Postcards", "Radio messages"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién ayuda al cliente?", "p_de": "Wer hilft dem Kunden?", "s": {"type": "multiple_choice", "options": ["A post office clerk", "A bank manager", "A taxi driver"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio se explica?", "p_de": "Welcher Service wird erklärt?", "s": {"type": "multiple_choice", "options": ["Parcel tracking", "Opening an account", "Buying museum tickets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué busca el cliente?", "p_de": "Wonach fragt der Kunde?", "s": {"type": "multiple_choice", "options": ["Where the parcel is", "How to rent a flat", "How to open a school"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1450 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 1450 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 1450, 'en', 'listening', 'postal', $transcript$
# AUDIO PROFILE: Post office clerk
## "Tracking a Parcel"

## THE SCENE: Information desk at the post office
A customer asks where a parcel is. The clerk explains what the tracking number shows and how to get updates.

### DIRECTOR'S NOTES
Style:
* Reassuring service language for a worried customer.
* Dates and service details are repeated in simple form.

Pace: Steady and calm.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners practise understanding receipt numbers, delivery status, and tracking options.
The recording is useful when a parcel has not arrived yet.

#### TRANSCRIPT
[calm] I can help you track the parcel.
[clear] Please show me the receipt with the tracking number.
[informative] The system says the parcel left the city last night.
[helpful] It should arrive tomorrow before six in the evening.
[practical] You can also check the tracking online.
[friendly] If you want updates on your phone, we can send text messages.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'es', 'Información sobre el seguimiento de un paquete', 'Escucha una explicación sencilla sobre cómo seguir un paquete.');

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'de', 'Informationen zur Sendungsverfolgung', 'Höre eine einfache Erklärung, wie man ein Paket verfolgt.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
