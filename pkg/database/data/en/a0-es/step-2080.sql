-- ============================================================
-- Seed: A0 English Path – STEP 2080 – Reading – make simple complaints, for example, 'The food is cold' (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sopa está fría.", "p_de": "Die Suppe ist kalt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pollo está muy caliente.", "p_de": "Das Hähnchen ist sehr heiß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pan está duro.", "p_de": "Das Brot ist hart.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona ya tiene el agua en la mesa.", "p_de": "Die Person hat das Wasser schon auf dem Tisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La persona pidió agua hace diez minutos.", "p_de": "Die Person hat vor zehn Minuten Wasser bestellt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona quiere sopa caliente.", "p_de": "Die Person möchte heiße Suppe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona pide pan fresco.", "p_de": "Die Person bittet um frisches Brot.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La nota es para pedir un postre.", "p_de": "Die Notiz ist, um ein Dessert zu bestellen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué problema tiene la sopa?", "p_de": "Welches Problem hat die Suppe?", "s": {"type": "multiple_choice", "options": ["It is cold", "It is sweet", "It is free"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está el pollo?", "p_de": "Wie ist das Hähnchen?", "s": {"type": "multiple_choice", "options": ["It is not hot", "It is excellent", "It is spicy"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo está el pan?", "p_de": "Wie ist das Brot?", "s": {"type": "multiple_choice", "options": ["Hard", "Soft", "Fresh"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida falta?", "p_de": "Welches Getränk fehlt?", "s": {"type": "multiple_choice", "options": ["Water", "Coffee", "Juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto tiempo esperó la persona?", "p_de": "Wie lange wartete die Person?", "s": {"type": "multiple_choice", "options": ["Ten minutes", "Two hours", "One minute"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sopa quiere ahora?", "p_de": "Welche Suppe möchte die Person jetzt?", "s": {"type": "multiple_choice", "options": ["Hot soup", "Cold soup", "No soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de pan pide?", "p_de": "Welche Art Brot bittet die Person?", "s": {"type": "multiple_choice", "options": ["Fresh bread", "Sweet bread", "Burnt bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo termina la nota?", "p_de": "Wie endet die Notiz?", "s": {"type": "multiple_choice", "options": ["Thank you", "See you tomorrow", "Bring the bill"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2080 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2080 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2080, 'en', 'reading', 'Restauración', $reading$
NOTE FOR THE WAITER
Excuse me. My soup is cold and the chicken is not hot. The bread is hard.

I asked for water ten minutes ago, and it is not here.

Please bring hot soup, fresh bread, and my water. Thank you.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Una nota de queja sencilla');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine einfache Beschwerdenotiz');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
