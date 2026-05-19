-- ============================================================
-- Seed: A0 English Path – STEP 2000 – Reading – ask simple questions about the menu and understand simple answers (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sopa es vegetariana.", "p_de": "Die Suppe ist vegetarisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pescado viene con arroz.", "p_de": "Der Fisch kommt mit Reis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pescado también viene con ensalada.", "p_de": "Der Fisch kommt auch mit Salat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarta de chocolate no tiene leche.", "p_de": "Der Schokoladenkuchen hat keine Milch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cliente puede pedir agua sin gas.", "p_de": "Der Gast kann stilles Wasser bestellen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El helado es el postre frío.", "p_de": "Das Eis ist das kalte Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El camarero responde con Of course al agua sin gas.", "p_de": "Der Kellner antwortet mit Of course auf das stille Wasser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cliente pregunta por una hamburguesa.", "p_de": "Der Gast fragt nach einem Burger.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿La sopa es vegetariana?", "p_de": "Ist die Suppe vegetarisch?", "s": {"type": "multiple_choice", "options": ["Yes, it is", "No, it is not", "Only on Friday"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué viene el pescado?", "p_de": "Womit kommt der Fisch?", "s": {"type": "multiple_choice", "options": ["Potatoes and salad", "Rice and bread", "Only chips"], "answer": 0}}'::jsonb,
        '{"p": "¿Hay leche en la tarta de chocolate?", "p_de": "Ist Milch im Schokoladenkuchen?", "s": {"type": "multiple_choice", "options": ["Yes, there is", "No, there is not", "Only water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué agua puede pedir el cliente?", "p_de": "Welches Wasser kann der Gast bestellen?", "s": {"type": "multiple_choice", "options": ["Still water", "Hot water only", "No water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre es frío?", "p_de": "Welches Dessert ist kalt?", "s": {"type": "multiple_choice", "options": ["Ice cream", "Chocolate cake", "Soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice el cliente al final?", "p_de": "Was sagt der Gast am Ende?", "s": {"type": "multiple_choice", "options": ["Thank you", "Bring the bill", "No dessert"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué responde el camarero al final?", "p_de": "Was antwortet der Kellner am Ende?", "s": {"type": "multiple_choice", "options": ["You are welcome", "Come tomorrow", "Order at the counter"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de texto se trata?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["Simple menu questions and answers", "A train schedule", "A market price list"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2000 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2000 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2000, 'en', 'reading', 'Restauración', $reading$
MENU QUESTIONS
Guest: Is the soup vegetarian? Waiter: Yes, it is.
Guest: Does the fish come with potatoes? Waiter: Yes, it does. It also comes with salad.

Guest: Is there milk in the chocolate cake? Waiter: Yes, there is.
Guest: Can I have still water? Waiter: Of course.

Guest: What dessert is cold? Waiter: The ice cream is cold.
Guest: Thank you. Waiter: You are welcome.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Preguntas simples sobre el menú');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Einfache Fragen zur Speisekarte');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
