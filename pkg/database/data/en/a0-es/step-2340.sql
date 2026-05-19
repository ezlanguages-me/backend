-- ============================================================
-- Seed: A0 English Path – STEP 2340 – Dialogue – maintain an interaction related to the nature and quality of the food (Restauración)
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
        '{"character": "Guest", "text": "The fish is very fresh.", "es": "El pescado está muy fresco.", "de": "Der Fisch ist sehr frisch."}'::jsonb,
        '{"character": "Waiter", "text": "I am glad to hear that.", "es": "Me alegra oír eso.", "de": "Das freut mich zu hören."}'::jsonb,
        '{"character": "Guest", "text": "The vegetables are also crisp.", "es": "Las verduras también están crujientes.", "de": "Das Gemüse ist auch knackig."}'::jsonb,
        '{"character": "Waiter", "text": "They came from the market this morning.", "es": "Han venido del mercado esta mañana.", "de": "Sie kamen heute Morgen vom Markt."}'::jsonb,
        '{"character": "Guest", "text": "The rice is a little dry.", "es": "El arroz está un poco seco.", "de": "Der Reis ist etwas trocken."}'::jsonb,
        '{"character": "Waiter", "text": "I can bring extra sauce.", "es": "Puedo traer salsa extra.", "de": "Ich kann extra Soße bringen."}'::jsonb,
        '{"character": "Guest", "text": "That would be great.", "es": "Eso sería genial.", "de": "Das wäre großartig."}'::jsonb,
        '{"character": "Waiter", "text": "I will bring it now.", "es": "La traigo ahora.", "de": "Ich bringe sie jetzt."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta dice que el pescado está muy fresco.", "p_de": "Die Gästin sagt, der Fisch sei sehr frisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las verduras no están crujientes.", "p_de": "Das Gemüse ist nicht knackig.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las verduras llegaron del mercado esa mañana.", "p_de": "Das Gemüse kam an diesem Morgen vom Markt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El arroz está un poco seco.", "p_de": "Der Reis ist etwas trocken.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero ofrece salsa extra.", "p_de": "Der Kellner bietet extra Soße an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué dice la clienta sobre el pescado?", "p_de": "Was sagt die Gästin über den Fisch?", "s": {"type": "multiple_choice", "options": ["It is very fresh", "It is too salty", "It is frozen"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describe las verduras?", "p_de": "Wie beschreibt sie das Gemüse?", "s": {"type": "multiple_choice", "options": ["Crisp", "Burnt", "Very oily"], "answer": 0}}'::jsonb,
        '{"p": "¿De dónde vienen las verduras?", "p_de": "Woher kommt das Gemüse?", "s": {"type": "multiple_choice", "options": ["From the market this morning", "From a freezer", "From another city last month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tiene el arroz?", "p_de": "Welches Problem hat der Reis?", "s": {"type": "multiple_choice", "options": ["It is a little dry", "It is too cold", "It is too sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué solución ofrece el camarero?", "p_de": "Welche Lösung bietet der Kellner an?", "s": {"type": "multiple_choice", "options": ["Extra sauce", "A free taxi", "A hotel room"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2340 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2340 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2340, 'en', 'dialogue', 'Restauración', '[{"name": "Guest", "gender": "female", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Waiter", "gender": "male", "avatarURL": "https://example.com/avatars/waiter.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Hablar sobre la calidad de la comida', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Über die Qualität des Essens sprechen', '');

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
