-- ============================================================
-- Seed: A0 English Path – STEP 360 – Dialogue – ask simple questions of a factual nature and understand the answers (Alojamiento)
-- Source language: Spanish
-- ============================================================

DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La turista tiene una reserva.", "p_de": "Die Touristin hat eine Reservierung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gimnasio está en la planta baja.", "p_de": "Das Fitnessstudio ist im Erdgeschoss.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El restaurante sirve cenas hasta las diez.", "p_de": "Das Restaurant serviert Abendessen bis zehn Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La consigna para equipaje está al lado de recepción.", "p_de": "Der Gepäckraum ist neben der Rezeption.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La lanzadera al aeropuerto sale cada hora.", "p_de": "Der Flughafenshuttle fährt jede Stunde.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde está el gimnasio?", "p_de": "Wo ist das Fitnessstudio?", "s": {"type": "multiple_choice", "options": ["En la segunda planta", "En la planta baja", "En el sótano"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora sirve cenas el restaurante?", "p_de": "Bis wann serviert das Restaurant Abendessen?", "s": {"type": "multiple_choice", "options": ["Hasta las 10 PM", "Hasta las 8 PM", "Hasta las 11 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde puede dejar la maleta la turista?", "p_de": "Wo kann die Touristin ihren Koffer lassen?", "s": {"type": "multiple_choice", "options": ["En la consigna junto a recepción", "En el restaurante", "En el gimnasio"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora sale la lanzadera al aeropuerto?", "p_de": "Um wie viel Uhr fährt der Flughafenshuttle?", "s": {"type": "multiple_choice", "options": ["A las 8:30 AM", "A las 7:30 AM", "A las 9:30 AM"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debe reservar la turista la lanzadera?", "p_de": "Wann soll die Touristin den Shuttle reservieren?", "s": {"type": "multiple_choice", "options": ["Antes de las 9 PM", "Después del desayuno", "Al hacer el check-out"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue WHERE step_order = 360 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 360 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 360, 'en', 'dialogue', 'accommodation', '[{"name": "Tourist", "gender": "female", "avatarURL": "https://example.com/avatars/tourist.png"}, {"name": "Receptionist", "gender": "male", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Servicios del hotel', '');

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Hoteldienste', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 0, 'Receptionist', 'Good evening. Welcome back to Riverside Hotel.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Buenas tardes. Bienvenida de nuevo al Riverside Hotel."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Guten Abend. Willkommen zurück im Riverside Hotel."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 1, 'Tourist', 'Hello. I have a reservation and a few questions about the hotel services.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. Tengo una reserva y unas preguntas sobre los servicios del hotel."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Ich habe eine Reservierung und ein paar Fragen zu den Hoteldiensten."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 2, 'Receptionist', 'Of course. What would you like to know?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Por supuesto. ¿Qué le gustaría saber?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Natürlich. Was möchten Sie wissen?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 3, 'Tourist', 'Is there a gym in the hotel?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Hay gimnasio en el hotel?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Gibt es ein Fitnessstudio im Hotel?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 4, 'Receptionist', 'Yes. The gym is on the second floor and it opens at six in the morning.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. El gimnasio está en la segunda planta y abre a las seis de la mañana."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Das Fitnessstudio ist im zweiten Stock und öffnet um sechs Uhr morgens."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 5, 'Tourist', 'Great. And does the restaurant serve dinner?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Genial. ¿Y el restaurante sirve cenas?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Super. Und serviert das Restaurant Abendessen?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 6, 'Receptionist', 'Yes, dinner is from six to ten in the evening.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí, la cena es de seis a diez de la tarde."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja, das Abendessen ist von sechs bis zehn Uhr abends."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 7, 'Tourist', 'Can I leave my suitcase after check-out, and is there a shuttle to the airport?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Puedo dejar mi maleta después del check-out y hay lanzadera al aeropuerto?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Kann ich meinen Koffer nach dem Check-out lassen, und gibt es einen Shuttle zum Flughafen?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 8, 'Receptionist', 'Yes. The luggage room is next to reception and it is free. The airport shuttle leaves at eight thirty in the morning.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. La consigna está al lado de recepción y es gratis. La lanzadera al aeropuerto sale a las ocho y media de la mañana."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Der Gepäckraum ist neben der Rezeption und kostenlos. Der Flughafenshuttle fährt um acht Uhr dreißig morgens ab."}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 9, 'Tourist', 'Perfect. Do I need to book the shuttle now?')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Perfecto. ¿Tengo que reservar la lanzadera ahora?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Perfekt. Muss ich den Shuttle jetzt reservieren?"}]}]'::jsonb);

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES (v_dialogue_id, 10, 'Receptionist', 'Please book it before nine this evening. I can do that for you now.')
    RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Por favor, resérvela antes de las nueve de esta noche. Puedo hacerlo ahora mismo."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Bitte reservieren Sie ihn vor neun Uhr heute Abend. Ich kann das jetzt für Sie machen."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

