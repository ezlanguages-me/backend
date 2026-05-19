-- ============================================================
-- Seed: A0 English Path – STEP 2380 – Dialogue – understand most explanations of what is on the menu, but will require a dictionary for culinary terms (Restauración)
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
        '{"character": "Eva", "text": "What does roasted mean?", "es": "¿Qué significa roasted?", "de": "Was bedeutet roasted?"}'::jsonb,
        '{"character": "Waiter", "text": "It means cooked in the oven.", "es": "Significa cocinado en el horno.", "de": "Es bedeutet im Ofen gekocht."}'::jsonb,
        '{"character": "Eva", "text": "And marinated chicken?", "es": "¿Y marinated chicken?", "de": "Und marinated chicken?"}'::jsonb,
        '{"character": "Waiter", "text": "The chicken sits in oil, lemon, and herbs before cooking.", "es": "El pollo está en aceite, limón y hierbas antes de cocinarse.", "de": "Das Hähnchen liegt vor dem Garen in Öl, Zitrone und Kräutern."}'::jsonb,
        '{"character": "Eva", "text": "Is the mushroom soup creamy?", "es": "¿La sopa de champiñones es cremosa?", "de": "Ist die Pilzsuppe cremig?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, it has cream.", "es": "Sí, tiene nata.", "de": "Ja, sie hat Sahne."}'::jsonb,
        '{"character": "Eva", "text": "Are the onions crispy?", "es": "¿Las cebollas están crujientes?", "de": "Sind die Zwiebeln knusprig?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, they are fried and crisp.", "es": "Sí, están fritas y crujientes.", "de": "Ja, sie sind frittiert und knusprig."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Eva pregunta qué significa roasted.", "p_de": "Eva fragt, was roasted bedeutet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Roasted significa cocinado en el horno.", "p_de": "Roasted bedeutet im Ofen gekocht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pollo marinado se cocina con chocolate y leche.", "p_de": "Mariniertes Hähnchen wird mit Schokolade und Milch zubereitet.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sopa de champiñones tiene nata.", "p_de": "Die Pilzsuppe hat Sahne.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cebollas están fritas y crujientes.", "p_de": "Die Zwiebeln sind frittiert und knusprig.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pregunta Eva primero?", "p_de": "Was fragt Eva zuerst?", "s": {"type": "multiple_choice", "options": ["What roasted means", "What the bill costs", "Where the toilet is"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lleva el pollo marinado antes de cocinarse?", "p_de": "Was hat das marinierte Hähnchen vor dem Garen?", "s": {"type": "multiple_choice", "options": ["Oil, lemon, and herbs", "Sugar, milk, and bread", "Only salt"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la sopa de champiñones?", "p_de": "Wie ist die Pilzsuppe?", "s": {"type": "multiple_choice", "options": ["Creamy", "Dry", "Without vegetables"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo son las cebollas?", "p_de": "Wie sind die Zwiebeln?", "s": {"type": "multiple_choice", "options": ["Fried and crisp", "Raw and cold", "Sweet and soft"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué sirve la conversación?", "p_de": "Wozu dient das Gespräch?", "s": {"type": "multiple_choice", "options": ["To explain culinary terms", "To order a taxi", "To pay the bill"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2380 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2380 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2380, 'en', 'dialogue', 'Restauración', '[{"name": "Eva", "gender": "female", "avatarURL": "https://example.com/avatars/eva.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Preguntar por términos culinarios', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Nach kulinarischen Begriffen fragen', '');

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
