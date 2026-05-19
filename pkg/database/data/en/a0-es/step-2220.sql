-- ============================================================
-- Seed: A0 English Path – STEP 2220 – Dialogue – ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)
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
        '{"character": "Lena", "text": "I am vegetarian. Do you have a main dish without meat?", "es": "Soy vegetariana. ¿Tienen un plato principal sin carne?", "de": "Ich bin Vegetarierin. Haben Sie ein Hauptgericht ohne Fleisch?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, the bean stew is vegetarian.", "es": "Sí, el guiso de judías es vegetariano.", "de": "Ja, der Bohneneintopf ist vegetarisch."}'::jsonb,
        '{"character": "Lena", "text": "Does it have cheese?", "es": "¿Tiene queso?", "de": "Hat es Käse?"}'::jsonb,
        '{"character": "Waiter", "text": "No, it does not.", "es": "No, no tiene.", "de": "Nein, hat es nicht."}'::jsonb,
        '{"character": "Lena", "text": "And is the soup vegetarian?", "es": "¿Y la sopa es vegetariana?", "de": "Und ist die Suppe vegetarisch?"}'::jsonb,
        '{"character": "Waiter", "text": "No, it has chicken stock.", "es": "No, tiene caldo de pollo.", "de": "Nein, sie hat Hühnerbrühe."}'::jsonb,
        '{"character": "Lena", "text": "Then I will have the bean stew and a green salad.", "es": "Entonces tomaré el guiso de judías y una ensalada verde.", "de": "Dann nehme ich den Bohneneintopf und einen grünen Salat."}'::jsonb,
        '{"character": "Waiter", "text": "Excellent choice.", "es": "Excelente elección.", "de": "Ausgezeichnete Wahl."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Lena es vegetariana.", "p_de": "Lena ist Vegetarierin.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El guiso de judías tiene carne.", "p_de": "Der Bohneneintopf hat Fleisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El guiso no tiene queso.", "p_de": "Der Eintopf hat keinen Käse.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa es vegetariana.", "p_de": "Die Suppe ist vegetarisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Lena pide el guiso de judías y una ensalada verde.", "p_de": "Lena bestellt den Bohneneintopf und einen grünen Salat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué plato recomienda el camarero?", "p_de": "Welches Gericht empfiehlt der Kellner?", "s": {"type": "multiple_choice", "options": ["The bean stew", "The chicken soup", "The fish pie"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta Lena sobre el guiso?", "p_de": "Was fragt Lena über den Eintopf?", "s": {"type": "multiple_choice", "options": ["If it has cheese", "If it is spicy", "If it comes with rice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué ingrediente tiene la sopa?", "p_de": "Welche Zutat hat die Suppe?", "s": {"type": "multiple_choice", "options": ["Chicken stock", "Only vegetables", "Peanut sauce"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pide Lena al final?", "p_de": "Was bestellt Lena am Ende?", "s": {"type": "multiple_choice", "options": ["The bean stew and a green salad", "The soup and bread", "Only a drink"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describe el camarero la decisión de Lena?", "p_de": "Wie beschreibt der Kellner Lenas Entscheidung?", "s": {"type": "multiple_choice", "options": ["Excellent choice", "Very expensive", "Too late"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2220 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2220 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2220, 'en', 'dialogue', 'Restauración', '[{"name": "Lena", "gender": "female", "avatarURL": "https://example.com/avatars/lena.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Pedir opciones para una dieta especial', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Optionen für eine besondere Ernährung bestellen', '');

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
