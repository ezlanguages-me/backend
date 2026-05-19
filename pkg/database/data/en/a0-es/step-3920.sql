-- ============================================================
-- Seed: A0 English Path – STEP 3920 – Dialogue – present work requirements to a client (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Consultant", "text": "For this service, we need access to the office on Monday at 8 AM.", "es": "Para este servicio, necesitamos acceso a la oficina el lunes a las 8 AM.", "de": "Für diesen Service brauchen wir am Montag um 8 Uhr Zugang zum Büro."}'::jsonb,
    '{"character": "Client", "text": "That is fine. What else do you need?", "es": "Está bien. ¿Qué más necesitan?", "de": "Das ist in Ordnung. Was brauchen Sie noch?"}'::jsonb,
    '{"character": "Consultant", "text": "We need one meeting room, two power points, and a contact person on site.", "es": "Necesitamos una sala de reuniones, dos enchufes y una persona de contacto en el lugar.", "de": "Wir brauchen einen Besprechungsraum, zwei Steckdosen und eine Kontaktperson vor Ort."}'::jsonb,
    '{"character": "Client", "text": "Can we use the small meeting room on the first floor?", "es": "¿Podemos usar la sala pequeña de la primera planta?", "de": "Können wir den kleinen Besprechungsraum im ersten Stock benutzen?"}'::jsonb,
    '{"character": "Consultant", "text": "Yes, that room is fine if it is free until noon.", "es": "Sí, esa sala está bien si está libre hasta el mediodía.", "de": "Ja, dieser Raum ist in Ordnung, wenn er bis Mittag frei ist."}'::jsonb,
    '{"character": "Client", "text": "It is free all morning.", "es": "Está libre toda la mañana.", "de": "Er ist den ganzen Vormittag frei."}'::jsonb,
    '{"character": "Consultant", "text": "Perfect. We will also need the final file by email today.", "es": "Perfecto. También necesitaremos hoy el archivo final por email.", "de": "Perfekt. Wir brauchen außerdem heute noch die endgültige Datei per E-Mail."}'::jsonb,
    '{"character": "Client", "text": "I can send it before 5 PM.", "es": "Puedo enviarlo antes de las 5 PM.", "de": "Ich kann sie vor 17 Uhr schicken."}'::jsonb,
    '{"character": "Consultant", "text": "Great. Then we can start the setup on time.", "es": "Muy bien. Entonces podremos empezar el montaje a tiempo.", "de": "Sehr gut. Dann können wir den Aufbau pünktlich beginnen."}'::jsonb,
    '{"character": "Client", "text": "Thank you for the clear plan.", "es": "Gracias por el plan claro.", "de": "Danke für den klaren Plan."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El servicio necesita acceso el lunes a las 8 AM.", "p_de": "Der Service braucht am Montag um 8 Uhr Zugang.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "Solo hace falta un enchufe.", "p_de": "Es wird nur eine Steckdose gebraucht.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "Se puede usar la sala pequeña si está libre hasta el mediodía.", "p_de": "Der kleine Raum kann genutzt werden, wenn er bis Mittag frei ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La sala está ocupada toda la mañana.", "p_de": "Der Raum ist den ganzen Vormittag belegt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El archivo final se enviará por email antes de las 5 PM.", "p_de": "Die endgültige Datei wird vor 17 Uhr per E-Mail geschickt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Cuándo necesitan acceso a la oficina?", "p_de": "Wann brauchen sie Zugang zum Büro?", "s_es": {"type": "multiple_choice", "options": ["Monday at 8 AM", "Tuesday at noon", "Friday at 5 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Montag um 8 Uhr", "Dienstag um 12 Uhr", "Freitag um 17 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué espacio necesitan?", "p_de": "Welchen Raum brauchen sie?", "s_es": {"type": "multiple_choice", "options": ["One meeting room", "A hotel room", "A kitchen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einen Besprechungsraum", "Ein Hotelzimmer", "Eine Küche"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuántos power points necesitan?", "p_de": "Wie viele Steckdosen brauchen sie?", "s_es": {"type": "multiple_choice", "options": ["Two", "One", "Four"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Eine", "Vier"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué debe mandar el cliente hoy?", "p_de": "Was muss der Kunde heute schicken?", "s_es": {"type": "multiple_choice", "options": ["The final file by email", "A taxi voucher", "The office key"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die endgültige Datei per E-Mail", "Einen Taxigutschein", "Den Büroschlüssel"], "answer": 0}}'::jsonb,
    '{"p": "¿Hasta qué hora puede enviarla?", "p_de": "Bis wann kann er sie schicken?", "s_es": {"type": "multiple_choice", "options": ["Before 5 PM", "Before noon", "Before 8 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor 17 Uhr", "Vor Mittag", "Vor 8 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3920 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 3920 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3920, 'en', 'dialogue', 'professional', '[{"name": "Consultant", "gender": "female", "avatarURL": "https://example.com/avatars/consultant.png"}, {"name": "Client", "gender": "male", "avatarURL": "https://example.com/avatars/client.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Presenta requisitos de trabajo a un cliente', 'Practica cómo explicar de forma simple el alcance, la fecha y los materiales de un servicio.'),
        (v_dialogue_id, 'de', 'Präsentiere einem Kunden Arbeitsanforderungen', 'Übe, wie man einem Kunden Umfang, Termin und Material eines Service erklärt.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
