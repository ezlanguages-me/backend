-- ============================================================
-- Seed: A0 English Path – STEP 1330 – Listening – ask for simple post office services
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El empleado confirma que pueden enviar el paquete a Perú.", "p_de": "Der Mitarbeiter bestätigt, dass das Paket nach Peru geschickt werden kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paquete pesa un kilo.", "p_de": "Das Paket wiegt ein Kilo.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El precio es de doce libras.", "p_de": "Der Preis beträgt zwölf Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente no necesita escribir la dirección.", "p_de": "Der Kunde muss die Adresse nicht schreiben.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que completar un formulario de aduanas.", "p_de": "Man muss ein Zollformular ausfüllen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paquete llega normalmente en cinco días laborables.", "p_de": "Das Paket kommt normalerweise in fünf Werktagen an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El recibo incluye el número de seguimiento.", "p_de": "Der Beleg enthält die Sendungsnummer.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El empleado dice que tire el recibo.", "p_de": "Der Mitarbeiter sagt, man soll den Beleg wegwerfen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Adónde va el paquete?", "p_de": "Wohin geht das Paket?", "s": {"type": "multiple_choice", "options": ["To Peru", "To Portugal", "To Poland"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde pone el cliente el paquete?", "p_de": "Worauf legt der Kunde das Paket?", "s": {"type": "multiple_choice", "options": ["On the scale", "On the floor", "On a chair"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto pesa el paquete?", "p_de": "Wie viel wiegt das Paket?", "s": {"type": "multiple_choice", "options": ["One kilo", "Five kilos", "Half a kilo"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta?", "p_de": "Wie viel kostet es?", "s": {"type": "multiple_choice", "options": ["Twelve pounds", "Two pounds", "Twenty pounds"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe escribir el cliente?", "p_de": "Was muss der Kunde schreiben?", "s": {"type": "multiple_choice", "options": ["The address", "A shopping list", "A phone password"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué formulario completa?", "p_de": "Welches Formular füllt der Kunde aus?", "s": {"type": "multiple_choice", "options": ["A customs form", "A job application", "A train ticket form"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo llega normalmente el paquete?", "p_de": "Wann kommt das Paket normalerweise an?", "s": {"type": "multiple_choice", "options": ["In five working days", "In one month", "The same afternoon"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay en el recibo?", "p_de": "Was steht auf dem Beleg?", "s": {"type": "multiple_choice", "options": ["The tracking number", "A hotel number", "A classroom number"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 1330 AND path_uuid = v_path_id);
        DELETE FROM listening WHERE step_order = 1330 AND path_uuid = v_path_id;

        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 1330, 'en', 'listening', 'postal', $transcript$
# AUDIO PROFILE: Post office clerk
## "Sending a Small Parcel"

## THE SCENE: A neighborhood post office counter
A customer arrives with a small parcel for Peru. The clerk explains the basic steps slowly and clearly.

### DIRECTOR'S NOTES
Style:
* Friendly service language with short practical sentences.
* Important details such as price, form, and tracking are easy to hear.

Pace: Slow and clear.

Accent: Neutral accent.

### SAMPLE CONTEXT
Learners hear the kind of help they receive at a normal post office counter.
The focus is on weight, price, form, and receipt details.

#### TRANSCRIPT
[friendly] Good morning. Yes, we can send this parcel to Peru.
[clear] Please put it on the scale.
[helpful] It is one kilo, so the price is twelve pounds.
[practical] Please write the address here and complete this customs form.
[reassuring] The parcel usually arrives in five working days.
[organized] Here is your receipt with the tracking number.
[polite] Keep the receipt, please.
$transcript$)
        RETURNING uuid INTO v_listening_id;

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'es', 'Preguntar por el envío de un paquete', 'Escucha a un empleado de correos explicar el proceso básico para enviar un paquete.');

        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES (v_listening_id, 'de', 'Nach dem Versand eines Pakets fragen', 'Höre einen Postmitarbeiter, der den einfachen Ablauf für den Paketversand erklärt.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
