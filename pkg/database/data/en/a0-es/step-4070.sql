-- ============================================================
-- Seed: A0 English Path – STEP 4070 – Listening – take and pass on simple messages of a routine kind (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_listening_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La persona que llama se llama Tom Bradley.", "p_de": "Die anrufende Person heißt Tom Bradley.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tom llama para hacer un pedido nuevo.", "p_de": "Tom ruft an, um eine neue Bestellung aufzugeben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El número de referencia del pedido es ORD-7734.", "p_de": "Die Bestellreferenz ist ORD-7734.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tom necesita la entrega antes del viernes.", "p_de": "Tom braucht die Lieferung bis Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tom deja su dirección de correo electrónico.", "p_de": "Tom hinterlässt seine E-Mail-Adresse.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Tom quiere que le envíen una confirmación por escrito.", "p_de": "Tom möchte eine schriftliche Bestätigung erhalten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El número de Tom es el 07700 900 123.", "p_de": "Toms Nummer ist 07700 900 123.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La recepcionista dice que no puede pasar el mensaje.", "p_de": "Die Rezeptionistin sagt, dass sie die Nachricht nicht weitergeben kann.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cómo se llama la persona que llama?", "p_de": "Wie heißt die anrufende Person?", "s_es": {"type": "multiple_choice", "options": ["Tom Bradley", "Ana García", "Mr López"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tom Bradley", "Ana García", "Herr López"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué llama Tom?", "p_de": "Warum ruft Tom an?", "s_es": {"type": "multiple_choice", "options": ["To check on an existing order", "To place a new order", "To make a complaint"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um eine bestehende Bestellung zu prüfen", "Um eine neue Bestellung aufzugeben", "Um eine Beschwerde einzureichen"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la referencia del pedido?", "p_de": "Was ist die Bestellreferenz?", "s_es": {"type": "multiple_choice", "options": ["ORD-7734", "ORD-3347", "ORD-4421"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["ORD-7734", "ORD-3347", "ORD-4421"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo necesita Tom la entrega?", "p_de": "Wann braucht Tom die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["Before Friday", "Next Monday", "In two weeks"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Freitag", "Nächsten Montag", "In zwei Wochen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quiere Tom que le envíen?", "p_de": "Was möchte Tom zugesandt bekommen?", "s_es": {"type": "multiple_choice", "options": ["A written confirmation", "A new catalogue", "An invoice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine schriftliche Bestätigung", "Einen neuen Katalog", "Eine Rechnung"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el número de Tom?", "p_de": "Was ist Toms Nummer?", "s_es": {"type": "multiple_choice", "options": ["07700 900 123", "07700 100 456", "07900 900 123"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["07700 900 123", "07700 100 456", "07900 900 123"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará la recepcionista?", "p_de": "Was wird die Rezeptionistin tun?", "s_es": {"type": "multiple_choice", "options": ["Pass on the message", "Transfer the call immediately", "Ask Tom to call back"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Nachricht weitergeben", "Das Gespräch sofort weiterleiten", "Tom bitten zurückzurufen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se practica en esta escucha?", "p_de": "Was wird in diesem Hörtext geübt?", "s_es": {"type": "multiple_choice", "options": ["Taking and passing on a message", "Making a complaint", "Booking a meeting room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Nachricht entgegennehmen und weitergeben", "Eine Beschwerde einreichen", "Einen Besprechungsraum buchen"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order = 4070 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening');
        DELETE FROM listening WHERE step_order = 4070 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'listening';
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (v_path_id, 4070, 'en', 'listening', 'professional', $transcript$
# AUDIO PROFILE: Tom (caller) and Receptionist at a professional services company
## "Taking a Routine Message"

## THE SCENE: A receptionist answers the phone and takes a message
Tom calls the office and needs to leave a message for the manager.

### DIRECTOR'S NOTES
Style:
* Natural, polite telephone conversation with clear message details.
* Key information – name, reference number, date – is stated clearly.

Pace: Moderate; receptionist repeats key details back.

Accent: Neutral accents.

#### TRANSCRIPT
[answering] Receptionist: Good morning, ProServ Solutions. How can I help?
[caller] Tom: Hello, this is Tom Bradley from Delta Supplies. Could I leave a message for the purchasing manager?
[helpful] Receptionist: Of course. Go ahead, please.
[clear] Tom: I am calling about order ORD-7734. We need to confirm the delivery before Friday.
[specific] Tom: Could someone send us a written confirmation by email today?
[noting] Receptionist: Certainly. So, that is Tom Bradley, order ORD-7734, and you need written confirmation before Friday.
[confirming] Tom: That is correct. My number is 07700 900 123 in case there are any questions.
[closing] Receptionist: Thank you, Mr Bradley. I will pass the message on immediately.
$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title, description)
        VALUES
            (v_listening_id, 'es', 'Escucha cómo se toma y transmite un mensaje rutinario', 'Escucha una llamada telefónica donde se toman y repiten los detalles de un mensaje de trabajo.'),
            (v_listening_id, 'de', 'Höre, wie eine Routinenachricht aufgenommen und weitergegeben wird', 'Höre ein Telefongespräch, bei dem Nachrichtendetails aufgenommen und wiederholt werden.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_listening_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
