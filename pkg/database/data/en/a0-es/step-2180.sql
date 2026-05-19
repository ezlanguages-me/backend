-- ============================================================
-- Seed: A0 English Path – STEP 2180 – Dialogue – ask basic questions about the food in relation to the menu, and about the services available (Restauración)
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
        '{"character": "Nico", "text": "Is the soup vegetarian?", "es": "¿La sopa es vegetariana?", "de": "Ist die Suppe vegetarisch?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, it is.", "es": "Sí, lo es.", "de": "Ja, ist sie."}'::jsonb,
        '{"character": "Nico", "text": "Does the salmon come with rice?", "es": "¿El salmón viene con arroz?", "de": "Kommt der Lachs mit Reis?"}'::jsonb,
        '{"character": "Waiter", "text": "No, it comes with potatoes.", "es": "No, viene con patatas.", "de": "Nein, er kommt mit Kartoffeln."}'::jsonb,
        '{"character": "Nico", "text": "Do you have takeaway?", "es": "¿Tienen comida para llevar?", "de": "Haben Sie Essen zum Mitnehmen?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, we do.", "es": "Sí, tenemos.", "de": "Ja, haben wir."}'::jsonb,
        '{"character": "Nico", "text": "Is there a table on the terrace?", "es": "¿Hay una mesa en la terraza?", "de": "Gibt es einen Tisch auf der Terrasse?"}'::jsonb,
        '{"character": "Waiter", "text": "Yes, one is free now.", "es": "Sí, una está libre ahora.", "de": "Ja, einer ist jetzt frei."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Nico pregunta si la sopa es vegetariana.", "p_de": "Nico fragt, ob die Suppe vegetarisch ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El salmón viene con arroz.", "p_de": "Der Lachs kommt mit Reis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El restaurante tiene comida para llevar.", "p_de": "Das Restaurant hat Essen zum Mitnehmen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay mesas libres en la terraza.", "p_de": "Es gibt keine freien Tische auf der Terrasse.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La camarera responde con frases muy cortas.", "p_de": "Die Kellnerin antwortet mit sehr kurzen Sätzen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Con qué viene el salmón?", "p_de": "Womit kommt der Lachs?", "s": {"type": "multiple_choice", "options": ["Potatoes", "Rice", "Beans"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio pregunta Nico?", "p_de": "Nach welchem Service fragt Nico?", "s": {"type": "multiple_choice", "options": ["Takeaway", "Delivery to home", "Breakfast in bed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lugar pregunta Nico al final?", "p_de": "Nach welchem Ort fragt Nico am Ende?", "s": {"type": "multiple_choice", "options": ["A table on the terrace", "The kitchen", "The hotel room"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la camarera sobre la terraza?", "p_de": "Was sagt die Kellnerin über die Terrasse?", "s": {"type": "multiple_choice", "options": ["One table is free now", "It is closed all day", "It is only for staff"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de preguntas hace Nico?", "p_de": "Welche Art Fragen stellt Nico?", "s": {"type": "multiple_choice", "options": ["Questions about food and services", "Questions about football", "Questions about trains"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2180 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2180 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2180, 'en', 'dialogue', 'Restauración', '[{"name": "Nico", "gender": "male", "avatarURL": "https://example.com/avatars/nico.png"}, {"name": "Waiter", "gender": "female", "avatarURL": "https://example.com/avatars/waiter-f.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Preguntar por platos y servicios', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Nach Gerichten und Service fragen', '');

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
