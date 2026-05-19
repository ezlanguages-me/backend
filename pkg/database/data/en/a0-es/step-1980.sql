-- ============================================================
-- Seed: A0 English Path – STEP 1980 – Dialogue – get the attention of staff and order a meal in a restaurant (Restauración)
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
        '{"character": "Guest", "text": "Excuse me. Could we order, please?", "es": "Perdone. ¿Podemos pedir, por favor?", "de": "Entschuldigung. Können wir bitte bestellen?"}'::jsonb,
        '{"character": "Waiter", "text": "Of course. What would you like to start?", "es": "Claro. ¿Qué le gustaría para empezar?", "de": "Natürlich. Was möchten Sie als Vorspeise?"}'::jsonb,
        '{"character": "Guest", "text": "The soup of the day, please.", "es": "La sopa del día, por favor.", "de": "Die Tagessuppe, bitte."}'::jsonb,
        '{"character": "Waiter", "text": "And for the main course?", "es": "¿Y de plato principal?", "de": "Und als Hauptgericht?"}'::jsonb,
        '{"character": "Guest", "text": "Grilled chicken with rice, please, and a fresh lemonade.", "es": "Pollo a la plancha con arroz, por favor, y una limonada fresca.", "de": "Gegrilltes Hähnchen mit Reis, bitte, und eine frische Limonade."}'::jsonb,
        '{"character": "Waiter", "text": "Certainly. Would you like dessert later?", "es": "Claro. ¿Quiere postre después?", "de": "Gern. Möchten Sie später ein Dessert?"}'::jsonb,
        '{"character": "Guest", "text": "Maybe later. Thank you.", "es": "Quizá después. Gracias.", "de": "Vielleicht später. Danke."}'::jsonb,
        '{"character": "Waiter", "text": "Very good. I will bring your order soon.", "es": "Muy bien. Le traigo su pedido enseguida.", "de": "Sehr gut. Ich bringe Ihre Bestellung gleich."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta pide primero la sopa del día.", "p_de": "Die Gästin bestellt zuerst die Tagessuppe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "De plato principal pide pasta vegetal.", "p_de": "Als Hauptgericht bestellt sie Gemüse-Pasta.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La bebida es una limonada fresca.", "p_de": "Das Getränk ist eine frische Limonade.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero pregunta por el postre para más tarde.", "p_de": "Der Kellner fragt nach einem Dessert für später.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La clienta pide helado en ese momento.", "p_de": "Die Gästin bestellt sofort Eis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué pide la clienta para empezar?", "p_de": "Was bestellt die Gästin als Vorspeise?", "s": {"type": "multiple_choice", "options": ["The soup of the day", "Ice cream", "A burger"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal pide?", "p_de": "Welches Hauptgericht bestellt sie?", "s": {"type": "multiple_choice", "options": ["Grilled chicken with rice", "Vegetable pasta", "Apple cake"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida pide?", "p_de": "Welches Getränk bestellt sie?", "s": {"type": "multiple_choice", "options": ["A fresh lemonade", "Tea", "Still water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el camarero después?", "p_de": "Was fragt der Kellner danach?", "s": {"type": "multiple_choice", "options": ["Would you like dessert later?", "Would you like to cook?", "Would you like the bill now?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué promete el camarero al final?", "p_de": "Was verspricht der Kellner am Ende?", "s": {"type": "multiple_choice", "options": ["I will bring your order soon", "I will close the restaurant", "I will call a taxi"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1980 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1980 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1980, 'en', 'dialogue', 'Restauración', '[{"name": "Guest", "gender": "female", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb) RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Pedir en un restaurante', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Im Restaurant bestellen', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text) VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_id;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning) VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));
        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
