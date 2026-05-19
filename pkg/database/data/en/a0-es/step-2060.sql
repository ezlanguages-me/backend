-- ============================================================
-- Seed: A0 English Path – STEP 2060 – Dialogue – express an opinion about food (Restauración)
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
        '{"character": "Sofía", "text": "How is your fish?", "es": "¿Qué tal está tu pescado?", "de": "Wie ist dein Fisch?"}'::jsonb,
        '{"character": "Daniel", "text": "It is very fresh, but it needs a little salt.", "es": "Está muy fresco, pero necesita un poco de sal.", "de": "Er ist sehr frisch, aber er braucht etwas Salz."}'::jsonb,
        '{"character": "Sofía", "text": "My pasta is excellent. The sauce is creamy.", "es": "Mi pasta está excelente. La salsa es cremosa.", "de": "Meine Pasta ist ausgezeichnet. Die Soße ist cremig."}'::jsonb,
        '{"character": "Daniel", "text": "Do you like the bread?", "es": "¿Te gusta el pan?", "de": "Magst du das Brot?"}'::jsonb,
        '{"character": "Sofía", "text": "Yes, it is warm and soft.", "es": "Sí, está caliente y suave.", "de": "Ja, es ist warm und weich."}'::jsonb,
        '{"character": "Daniel", "text": "I do not like the coffee. It is too bitter.", "es": "No me gusta el café. Está demasiado amargo.", "de": "Ich mag den Kaffee nicht. Er ist zu bitter."}'::jsonb,
        '{"character": "Sofía", "text": "Maybe we can share dessert.", "es": "Quizá podemos compartir postre.", "de": "Vielleicht können wir ein Dessert teilen."}'::jsonb,
        '{"character": "Daniel", "text": "Good idea.", "es": "Buena idea.", "de": "Gute Idee."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Daniel dice que el pescado está muy fresco.", "p_de": "Daniel sagt, dass der Fisch sehr frisch ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al pescado no le falta nada.", "p_de": "Dem Fisch fehlt nichts.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Sofía dice que su pasta está excelente.", "p_de": "Sofía sagt, dass ihre Pasta ausgezeichnet ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pan está frío y duro.", "p_de": "Das Brot ist kalt und hart.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Daniel piensa que el café está demasiado amargo.", "p_de": "Daniel findet, dass der Kaffee zu bitter ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué necesita el pescado?", "p_de": "Was braucht der Fisch?", "s": {"type": "multiple_choice", "options": ["A little salt", "More sugar", "Cold water"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la salsa de la pasta?", "p_de": "Wie ist die Soße der Pasta?", "s": {"type": "multiple_choice", "options": ["Creamy", "Dry", "Burnt"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describe Sofía el pan?", "p_de": "Wie beschreibt Sofía das Brot?", "s": {"type": "multiple_choice", "options": ["Warm and soft", "Cold and small", "Sweet and wet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida no le gusta a Daniel?", "p_de": "Welches Getränk mag Daniel nicht?", "s": {"type": "multiple_choice", "options": ["Coffee", "Tea", "Water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hacen quizá al final?", "p_de": "Was machen sie vielleicht am Ende?", "s": {"type": "multiple_choice", "options": ["Share dessert", "Leave immediately", "Order more fish"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2060 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2060 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2060, 'en', 'dialogue', 'Restauración', '[{"name": "Sofía", "gender": "female", "avatarURL": "https://example.com/avatars/sofia.png"}, {"name": "Daniel", "gender": "male", "avatarURL": "https://example.com/avatars/daniel.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Comentar la comida en la mesa', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Über das Essen am Tisch sprechen', '');

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
