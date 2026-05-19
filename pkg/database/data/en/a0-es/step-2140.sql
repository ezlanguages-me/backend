-- ============================================================
-- Seed: A0 English Path – STEP 2140 – Dialogue – order a meal in a restaurant (Restauración)
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
        '{"character": "Laura", "text": "Good evening. I would like to order, please.", "es": "Buenas tardes. Me gustaría pedir, por favor.", "de": "Guten Abend. Ich möchte bitte bestellen."}'::jsonb,
        '{"character": "Waiter", "text": "Of course. Would you like a starter?", "es": "Claro. ¿Quiere un entrante?", "de": "Natürlich. Möchten Sie eine Vorspeise?"}'::jsonb,
        '{"character": "Laura", "text": "Yes, the carrot soup, please.", "es": "Sí, la sopa de zanahoria, por favor.", "de": "Ja, die Karottensuppe, bitte."}'::jsonb,
        '{"character": "Waiter", "text": "And for the main course?", "es": "¿Y de plato principal?", "de": "Und als Hauptgericht?"}'::jsonb,
        '{"character": "Laura", "text": "The grilled chicken with rice and a glass of water.", "es": "El pollo a la plancha con arroz y un vaso de agua.", "de": "Das gegrillte Hähnchen mit Reis und ein Glas Wasser."}'::jsonb,
        '{"character": "Waiter", "text": "Would you like dessert now?", "es": "¿Quiere postre ahora?", "de": "Möchten Sie jetzt ein Dessert?"}'::jsonb,
        '{"character": "Laura", "text": "No, maybe later. Thank you.", "es": "No, quizá después. Gracias.", "de": "Nein, vielleicht später. Danke."}'::jsonb,
        '{"character": "Waiter", "text": "Very good. I will bring your order soon.", "es": "Muy bien. Le traigo su pedido enseguida.", "de": "Sehr gut. Ich bringe Ihre Bestellung gleich."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Laura quiere pedir en el restaurante.", "p_de": "Laura möchte im Restaurant bestellen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Laura no quiere entrante.", "p_de": "Laura möchte keine Vorspeise.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El entrante es sopa de zanahoria.", "p_de": "Die Vorspeise ist Karottensuppe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El plato principal es pasta con tomate.", "p_de": "Das Hauptgericht ist Pasta mit Tomate.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Laura dice que quizá tomará postre después.", "p_de": "Laura sagt, dass sie vielleicht später Dessert nimmt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pide Laura de entrante?", "p_de": "Was bestellt Laura als Vorspeise?", "s": {"type": "multiple_choice", "options": ["The carrot soup", "The salad", "The fish"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal pide?", "p_de": "Welches Hauptgericht bestellt sie?", "s": {"type": "multiple_choice", "options": ["The grilled chicken with rice", "The cheese omelette", "The burger"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida pide?", "p_de": "Welches Getränk bestellt sie?", "s": {"type": "multiple_choice", "options": ["A glass of water", "A tea", "A lemonade"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el camarero después?", "p_de": "Welche Frage stellt der Kellner danach?", "s": {"type": "multiple_choice", "options": ["Would you like dessert now?", "Would you like the bill now?", "Would you like another table?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el camarero al final?", "p_de": "Was sagt der Kellner am Ende?", "s": {"type": "multiple_choice", "options": ["I will bring your order soon", "The kitchen is closed", "Please pay first"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2140 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2140 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2140, 'en', 'dialogue', 'Restauración', '[{"name": "Laura", "gender": "female", "avatarURL": "https://example.com/avatars/laura.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Hacer un pedido completo en el restaurante', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Eine vollständige Bestellung im Restaurant machen', '');

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
