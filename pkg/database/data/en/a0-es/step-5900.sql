-- ============================================================
-- Seed: A0 English Path – STEP 5900 – Dialogue – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Receptionist", "text": "Good evening. Welcome to the Riverside Hotel.", "es": "Buenas noches. Bienvenido al Hotel Riverside.", "de": "Guten Abend. Willkommen im Hotel Riverside."}'::jsonb,
        '{"character": "Guest", "text": "Hello. I have a booking for two nights.", "es": "Hola. Tengo una reserva para dos noches.", "de": "Hallo. Ich habe eine Buchung für zwei Nächte."}'::jsonb,
        '{"character": "Receptionist", "text": "May I see your passport, please?", "es": "¿Puedo ver su pasaporte, por favor?", "de": "Darf ich bitte Ihren Pass sehen?"}'::jsonb,
        '{"character": "Guest", "text": "Of course. I also need a wake-up call at 7 AM.", "es": "Claro. También necesito una llamada de despertador a las 7 AM.", "de": "Natürlich. Ich brauche auch einen Weckruf um 7 Uhr."}'::jsonb,
        '{"character": "Receptionist", "text": "That is no problem. Breakfast is from 7 AM to 10 AM.", "es": "No hay problema. El desayuno es de 7 AM a 10 AM.", "de": "Kein Problem. Frühstück gibt es von 7 bis 10 Uhr."}'::jsonb,
        '{"character": "Guest", "text": "Can you send a message to my room if someone calls?", "es": "¿Puede mandar un mensaje a mi habitación si alguien llama?", "de": "Können Sie eine Nachricht auf mein Zimmer schicken, wenn jemand anruft?"}'::jsonb,
        '{"character": "Receptionist", "text": "Yes. Please use the phone on your desk if you need us.", "es": "Sí. Use el teléfono de su escritorio si nos necesita.", "de": "Ja. Bitte benutzen Sie das Telefon auf Ihrem Schreibtisch, wenn Sie uns brauchen."}'::jsonb,
        '{"character": "Guest", "text": "Thank you. Is the restaurant open tonight?", "es": "Gracias. ¿El restaurante está abierto esta noche?", "de": "Danke. Ist das Restaurant heute Abend geöffnet?"}'::jsonb,
        '{"character": "Receptionist", "text": "Yes, until 9:30 PM.", "es": "Sí, hasta las 9:30 PM.", "de": "Ja, bis 21:30 Uhr."}'::jsonb,
        '{"character": "Guest", "text": "Perfect. I will take my key now.", "es": "Perfecto. Tomaré mi llave ahora.", "de": "Perfekt. Ich nehme jetzt meinen Schlüssel."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El huésped se queda dos noches.", "de": "Der Gast bleibt zwei Nächte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La recepción pide ver el pasaporte.", "de": "Die Rezeption möchte den Pass sehen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El desayuno es de 6 AM a 9 AM.", "de": "Frühstück ist von 6 bis 9 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El huésped necesita una llamada de despertador.", "de": "Der Gast braucht einen Weckruf.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El restaurante cierra a las 8 PM.", "de": "Das Restaurant schließt um 20 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Cuántas noches se queda el huésped?", "de": "Wie viele Nächte bleibt der Gast?", "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eine", "Drei"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué documento pide la recepción?", "de": "Welches Dokument verlangt die Rezeption?", "s_es": {"type": "multiple_choice", "options": ["Passport", "Bus ticket", "Library card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Pass", "Busticket", "Bibliotheksausweis"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora empieza el desayuno?", "de": "Wann beginnt das Frühstück?", "s_es": {"type": "multiple_choice", "options": ["7 AM", "8 AM", "6 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["7 Uhr", "8 Uhr", "6 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora está abierto el restaurante?", "de": "Bis wann ist das Restaurant geöffnet?", "s_es": {"type": "multiple_choice", "options": ["9:30 PM", "8 PM", "10:30 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["21:30 Uhr", "20 Uhr", "22:30 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué quiere hacer el huésped si alguien llama?", "de": "Was möchte der Gast tun, wenn jemand anruft?", "s_es": {"type": "multiple_choice", "options": ["Receive a message in the room", "Leave the hotel", "Cancel the booking"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Nachricht ins Zimmer bekommen", "Das Hotel verlassen", "Die Buchung stornieren"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5900 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5900 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5900, 'en', 'dialogue', 'Alojamiento', '[{"name": "Staff", "gender": "neutral", "avatarURL": "https://example.com/avatars/staff.png"}, {"name": "Learner", "gender": "neutral", "avatarURL": "https://example.com/avatars/learner.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Resuelve situaciones en el hotel', 'Lee un diálogo con una recepción de hotel sobre llegada, desayuno y mensajes.'),
        (v_dialogue_id, 'de', 'Meistere Alltagssituationen im Hotel', 'Lies einen Dialog an der Hotelrezeption über Ankunft, Frühstück und Nachrichten.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_id, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_id, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
