-- ============================================================
-- Seed: A0 English Path – STEP 2200 – Reading – ask basic questions about the food and understand most explanations (e.g. dietary restrictions) (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que avisar al personal sobre las alergias antes de pedir.", "p_de": "Man soll das Personal vor der Bestellung über Allergien informieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El bol de fideos tiene salsa de cacahuete.", "p_de": "Die Nudelschale hat Erdnusssauce.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa de champiñones no tiene lácteos.", "p_de": "Die Pilzsuppe hat keine Milchprodukte.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ensalada verde no tiene lácteos.", "p_de": "Der grüne Salat hat keine Milchprodukte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay pan sin gluten disponible.", "p_de": "Es gibt glutenfreies Brot.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La copa de fruta no es apta para veganos.", "p_de": "Der Obstbecher ist nicht vegan geeignet.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las tartas son seguras sin preguntar.", "p_de": "Die Kuchen sind sicher, ohne zu fragen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El texto es un aviso informativo del restaurante.", "p_de": "Der Text ist ein Informationshinweis des Restaurants.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué salsa tiene el bol de fideos?", "p_de": "Welche Soße hat die Nudelschale?", "s": {"type": "multiple_choice", "options": ["Peanut sauce", "Tomato sauce", "Cheese sauce"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lleva la sopa de champiñones?", "p_de": "Was enthält die Pilzsuppe?", "s": {"type": "multiple_choice", "options": ["Cream", "No dairy", "Only water"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato no tiene lácteos?", "p_de": "Welches Gericht hat keine Milchprodukte?", "s": {"type": "multiple_choice", "options": ["The green salad", "The mushroom soup", "The cake"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pan está disponible?", "p_de": "Welches Brot ist verfügbar?", "s": {"type": "multiple_choice", "options": ["Gluten-free bread", "Chocolate bread", "Rice bread only on Sunday"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre es seguro para veganos?", "p_de": "Welches Dessert ist für Veganer sicher?", "s": {"type": "multiple_choice", "options": ["The fruit cup", "The cakes", "The cream pie"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes hacer antes de pedir tartas?", "p_de": "Was sollst du tun, bevor du Kuchen bestellst?", "s": {"type": "multiple_choice", "options": ["Ask first", "Pay first", "Sit outside"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debes hablar de tus alergias?", "p_de": "Wann sollst du über deine Allergien sprechen?", "s": {"type": "multiple_choice", "options": ["Before you order", "After dessert", "Only on weekends"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["Allergy information notice", "A sports poster", "A hotel bill"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2200 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2200 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2200, 'en', 'reading', 'Restauración', $reading$
FOOD ALLERGY INFORMATION
Please tell staff about allergies before you order.
The noodle bowl has peanut sauce. The mushroom soup has cream.

The green salad has no dairy. Gluten-free bread is available.
The fruit cup is safe for vegans. Ask before ordering cakes.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Aviso de alergias y restricciones');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Hinweis zu Allergien und Einschränkungen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
