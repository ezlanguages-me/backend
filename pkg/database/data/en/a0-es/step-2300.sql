-- ============================================================
-- Seed: A0 English Path – STEP 2300 – Dialogue – order a meal and ask for clarification about dishes on the menu (Restauración)
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
        '{"character": "Paula", "text": "What is panna cotta?", "es": "¿Qué es la panna cotta?", "de": "Was ist Panna cotta?"}'::jsonb,
        '{"character": "Waiter", "text": "It is a cold milk dessert.", "es": "Es un postre frío con leche.", "de": "Es ist ein kaltes Milchdessert."}'::jsonb,
        '{"character": "Paula", "text": "And what is sea bass?", "es": "¿Y qué es la lubina?", "de": "Und was ist Seebarsch?"}'::jsonb,
        '{"character": "Waiter", "text": "It is a white fish.", "es": "Es un pescado blanco.", "de": "Es ist ein weißer Fisch."}'::jsonb,
        '{"character": "Paula", "text": "Is the beet salad hot?", "es": "¿La ensalada de remolacha está caliente?", "de": "Ist der Rote-Bete-Salat heiß?"}'::jsonb,
        '{"character": "Waiter", "text": "It is warm, not hot.", "es": "Está templada, no caliente.", "de": "Er ist warm, nicht heiß."}'::jsonb,
        '{"character": "Paula", "text": "Great. I will order the fish and the dessert.", "es": "Genial. Pediré el pescado y el postre.", "de": "Super. Ich bestelle den Fisch und das Dessert."}'::jsonb,
        '{"character": "Waiter", "text": "Very good.", "es": "Muy bien.", "de": "Sehr gut."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Paula pregunta qué es la panna cotta.", "p_de": "Paula fragt, was Panna cotta ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La panna cotta es un postre caliente.", "p_de": "Panna cotta ist ein heißes Dessert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La lubina es un pescado blanco.", "p_de": "Seebarsch ist ein weißer Fisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ensalada de remolacha está caliente, no templada.", "p_de": "Der Rote-Bete-Salat ist heiß, nicht warm.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Paula decide pedir el pescado y el postre.", "p_de": "Paula entscheidet sich für Fisch und Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cómo explica el camarero la panna cotta?", "p_de": "Wie erklärt der Kellner die Panna cotta?", "s": {"type": "multiple_choice", "options": ["A cold milk dessert", "A spicy soup", "A grilled fish"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué es la lubina?", "p_de": "Was ist Seebarsch?", "s": {"type": "multiple_choice", "options": ["A white fish", "A salad dressing", "A cheese"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está la ensalada de remolacha?", "p_de": "Wie ist der Rote-Bete-Salat?", "s": {"type": "multiple_choice", "options": ["Warm, not hot", "Cold and frozen", "Very spicy"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué decide pedir Paula?", "p_de": "Was entscheidet Paula zu bestellen?", "s": {"type": "multiple_choice", "options": ["The fish and the dessert", "Only a drink", "The salad and tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve la conversación?", "p_de": "Wozu dient das Gespräch?", "s": {"type": "multiple_choice", "options": ["To clarify dishes on the menu", "To complain about the bill", "To book a room"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2300 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2300 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2300, 'en', 'dialogue', 'Restauración', '[{"name": "Paula", "gender": "female", "avatarURL": "https://example.com/avatars/paula.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Pedir aclaraciones sobre platos del menú', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Nach Erklärungen zu Gerichten fragen', '');

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
