-- ============================================================
-- Seed: A0 English Path – STEP 2020 – Dialogue – ask simple questions about the menu and understand simple answers (Restauración)
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
        '{"character": "Mia", "text": "Hi. Can I ask about the menu?", "es": "Hola. ¿Puedo preguntar por el menú?", "de": "Hallo. Kann ich nach der Speisekarte fragen?"}'::jsonb,
        '{"character": "Waiter", "text": "Of course. What would you like to know?", "es": "Claro. ¿Qué le gustaría saber?", "de": "Natürlich. Was möchten Sie wissen?"}'::jsonb,
        '{"character": "Mia", "text": "Is the cheese sandwich hot or cold?", "es": "¿El sándwich de queso es caliente o frío?", "de": "Ist das Käsesandwich warm oder kalt?"}'::jsonb,
        '{"character": "Waiter", "text": "It is hot, and it comes with salad.", "es": "Es caliente y viene con ensalada.", "de": "Es warm und kommt mit Salat."}'::jsonb,
        '{"character": "Mia", "text": "Do you have iced tea today?", "es": "¿Tienen té helado hoy?", "de": "Haben Sie heute Eistee?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, we do.", "es": "Sí, tenemos.", "de": "Ja, haben wir."}'::jsonb,
        '{"character": "Mia", "text": "Great. I will have the sandwich and an iced tea, please.", "es": "Genial. Tomaré el sándwich y un té helado, por favor.", "de": "Super. Ich nehme bitte das Sandwich und einen Eistee."}'::jsonb,
        '{"character": "Waiter", "text": "Perfect. I will bring it soon.", "es": "Perfecto. Se lo traigo enseguida.", "de": "Perfekt. Ich bringe es gleich."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Mia pregunta si puede hacer una pregunta sobre el menú.", "p_de": "Mia fragt, ob sie eine Frage zur Speisekarte stellen kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El sándwich de queso se sirve frío.", "p_de": "Das Käsesandwich wird kalt serviert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El sándwich viene con ensalada.", "p_de": "Das Sandwich kommt mit Salat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hoy no tienen té helado.", "p_de": "Heute haben sie keinen Eistee.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Mia pide un sándwich y un té helado.", "p_de": "Mia bestellt ein Sandwich und einen Eistee.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué quiere saber Mia primero?", "p_de": "Was möchte Mia zuerst wissen?", "s": {"type": "multiple_choice", "options": ["If the cheese sandwich is hot or cold", "If the restaurant is open tomorrow", "If the bill is ready"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué viene el sándwich?", "p_de": "Womit kommt das Sandwich?", "s": {"type": "multiple_choice", "options": ["With salad", "With soup", "With chips only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida pregunta Mia?", "p_de": "Nach welchem Getränk fragt Mia?", "s": {"type": "multiple_choice", "options": ["Iced tea", "Hot chocolate", "Orange juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide al final?", "p_de": "Was bestellt sie am Ende?", "s": {"type": "multiple_choice", "options": ["The sandwich and an iced tea", "Only salad", "Soup and coffee"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué promete el camarero?", "p_de": "Was verspricht der Kellner?", "s": {"type": "multiple_choice", "options": ["I will bring it soon", "I will close the kitchen", "I will call the manager"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2020 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2020 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2020, 'en', 'dialogue', 'Restauración', '[{"name": "Mia", "gender": "female", "avatarURL": "https://example.com/avatars/mia.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Hacer preguntas simples sobre el menú', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Einfache Fragen zur Speisekarte stellen', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));
        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
