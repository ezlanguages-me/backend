-- ============================================================
-- Seed: A0 English Path – STEP 600 – Dialogue – express opinions in a limited way (Convivencia - Host Families)
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
        '{"p": "A Alex le gustan las conversaciones de la tarde con su familia anfitriona.", "p_de": "Alex mag die Abendgespräche mit seiner Gastfamilie.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La habitación de Alex es oscura.", "p_de": "Alexs Zimmer ist dunkel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los fines de semana pasean al perro en el parque.", "p_de": "Am Wochenende gehen sie mit dem Hund im Park spazieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "A Alex le gusta la cola del baño por la mañana.", "p_de": "Alex mag die Warteschlange am Morgen im Bad.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué le gusta mucho a Alex por la tarde?", "p_de": "Was mag Alex am Abend sehr?", "s": {"type": "multiple_choice", "options": ["Hablar con su familia anfitriona", "Lavar la ropa", "Cocinar solo"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describe Alex su habitación?", "p_de": "Wie beschreibt Alex sein Zimmer?", "s": {"type": "multiple_choice", "options": ["Luminosa", "Muy pequeña y fría", "Ruidosa y oscura"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hacen los fines de semana?", "p_de": "Was machen sie am Wochenende?", "s": {"type": "multiple_choice", "options": ["Pasear al perro en el parque", "Ir al aeropuerto", "Estudiar todo el día"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no le gusta a Alex?", "p_de": "Was gefällt Alex nicht?", "s": {"type": "multiple_choice", "options": ["La cola del baño y el wifi lento", "La comida y la ciudad", "El autobús y la cama"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM dialogue WHERE step_order = 600 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 600, 'en', 'dialogue', 'social', '[{"name": "Alex", "gender": "male", "avatarURL": "https://example.com/avatars/alex.png"}, {"name": "Friend", "gender": "female", "avatarURL": "https://example.com/avatars/friend.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Hablar de otros aspectos de la familia anfitriona', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Über andere Seiten der Gastfamilie sprechen', '');

    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 0, 'Alex', 'I really like my host family.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Me gusta mucho mi familia anfitriona."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich mag meine Gastfamilie sehr."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 1, 'Friend', 'What do you like most now?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Qué es lo que más te gusta ahora?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Was gefällt dir jetzt am meisten?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 2, 'Alex', 'I like the evening chats with my host mother. She always asks about my day.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Me gustan las charlas de la tarde con mi madre anfitriona. Siempre pregunta por mi día."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich mag die Abendgespräche mit meiner Gastmutter. Sie fragt immer nach meinem Tag."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 3, 'Friend', 'And your room?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Y tu habitación?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Und dein Zimmer?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 4, 'Alex', 'My room is bright, and I can study by the window.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "Mi habitación es luminosa y puedo estudiar junto a la ventana."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Mein Zimmer ist hell, und ich kann am Fenster lernen."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 5, 'Friend', 'What do you do at the weekend?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Qué haces el fin de semana?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Was machst du am Wochenende?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 6, 'Alex', 'We often walk the dog in the park, and I really like that.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "A menudo paseamos al perro por el parque y eso me gusta mucho."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Wir gehen oft mit dem Hund im Park spazieren, und das gefällt mir sehr."}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 7, 'Friend', 'Is there anything you do not like?') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Hay algo que no te guste?"}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Gibt es etwas, das dir nicht gefällt?"}]}]'::jsonb);
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, 8, 'Alex', 'I do not like the bathroom queue in the morning, and the Wi-Fi in my room is sometimes slow.') RETURNING uuid INTO v_line_uuid;
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'es', '[{"translations": [{"languageCode": "es", "translation": "No me gusta la cola del baño por la mañana y el wifi de mi habitación a veces es lento."}]}]'::jsonb);
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_uuid, 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich mag die Warteschlange am Morgen im Bad nicht, und das WLAN in meinem Zimmer ist manchmal langsam."}]}]'::jsonb);

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;

