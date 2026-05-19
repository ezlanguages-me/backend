-- ============================================================
-- Seed: A0 English Path – STEP 2040 – Reading – express an opinion about food (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La pasta de verduras estaba deliciosa.", "p_de": "Die Gemüse-Pasta war lecker.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa de tomate estaba demasiado dulce.", "p_de": "Die Tomatensuppe war zu süß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La salsa de la pasta era ligera.", "p_de": "Die Soße der Pasta war leicht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bebida de limón estaba caliente.", "p_de": "Das Zitronengetränk war warm.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tarta de chocolate era buena.", "p_de": "Der Schokoladenkuchen war gut.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La porción de tarta era grande.", "p_de": "Das Kuchenstück war groß.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El servicio fue amable.", "p_de": "Der Service war freundlich.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona no quiere volver al café.", "p_de": "Die Person möchte nicht ins Café zurückkommen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué plato le gustó mucho a la persona?", "p_de": "Welches Gericht gefiel der Person sehr?", "s": {"type": "multiple_choice", "options": ["The vegetable pasta", "The tomato soup", "The bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo era la salsa?", "p_de": "Wie war die Soße?", "s": {"type": "multiple_choice", "options": ["Light", "Very spicy", "Very heavy"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema tenía la sopa?", "p_de": "Welches Problem hatte die Suppe?", "s": {"type": "multiple_choice", "options": ["It was too salty", "It was too cold", "It was too small"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo estaba la bebida de limón?", "p_de": "Wie war das Zitronengetränk?", "s": {"type": "multiple_choice", "options": ["Fresh and cold", "Warm and bitter", "Hot and sweet"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre comió?", "p_de": "Welches Dessert aß die Person?", "s": {"type": "multiple_choice", "options": ["Chocolate cake", "Apple pie", "Ice cream"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo era la porción de tarta?", "p_de": "Wie war das Kuchenstück?", "s": {"type": "multiple_choice", "options": ["Small", "Huge", "Free"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo fue el servicio?", "p_de": "Wie war der Service?", "s": {"type": "multiple_choice", "options": ["Friendly", "Slow and rude", "Closed"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué quiere hacer la persona la próxima semana?", "p_de": "Was möchte die Person nächste Woche tun?", "s": {"type": "multiple_choice", "options": ["Come back", "Write to the manager", "Order takeaway"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2040 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2040 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2040, 'en', 'reading', 'Restauración', $reading$
LUNCH REVIEW
I had lunch at Sunny Café on Tuesday. The vegetable pasta was delicious and the sauce was light. The tomato soup was too salty for me.

My lemon drink was fresh and cold. The chocolate cake was good, but the slice was small.

The service was friendly, so I want to come back next week.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Una reseña sencilla sobre la comida');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine einfache Essensrezension');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
