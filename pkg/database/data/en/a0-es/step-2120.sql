-- ============================================================
-- Seed: A0 English Path – STEP 2120 – Reading – order a meal in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La mesa 6 pide una sopa de zanahoria.", "p_de": "Tisch 6 bestellt eine Karottensuppe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La mesa 6 pide una tortilla de queso.", "p_de": "Tisch 6 bestellt ein Käseomelett.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El plato principal es pollo a la plancha con arroz.", "p_de": "Das Hauptgericht ist gegrilltes Hähnchen mit Reis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La mesa pide pasta con salsa de tomate.", "p_de": "Der Tisch bestellt Pasta mit Tomatensoße.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La mesa pide agua y zumo de manzana.", "p_de": "Der Tisch bestellt Wasser und Apfelsaft.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bebida es té y café.", "p_de": "Die Getränke sind Tee und Kaffee.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hoy no piden postre.", "p_de": "Heute bestellen sie kein Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto incluye un menú y una nota de pedido.", "p_de": "Der Text enthält eine Speisekarte und eine Bestellnotiz.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué entrante pide la mesa?", "p_de": "Welche Vorspeise bestellt der Tisch?", "s": {"type": "multiple_choice", "options": ["Carrot soup", "Tomato soup", "Green salad"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal pide la mesa?", "p_de": "Welches Hauptgericht bestellt der Tisch?", "s": {"type": "multiple_choice", "options": ["Grilled chicken with rice", "Cheese omelette with salad", "Pasta with tomato sauce"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida no aparece en la nota?", "p_de": "Welches Getränk steht nicht in der Notiz?", "s": {"type": "multiple_choice", "options": ["Tea", "Water", "Apple juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas bebidas hay en la nota?", "p_de": "Wie viele Getränke stehen in der Notiz?", "s": {"type": "multiple_choice", "options": ["Two", "One", "Three"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué zumo pide la mesa?", "p_de": "Welchen Saft bestellt der Tisch?", "s": {"type": "multiple_choice", "options": ["Apple juice", "Orange juice", "Lemon juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Piden postre?", "p_de": "Bestellen sie Dessert?", "s": {"type": "multiple_choice", "options": ["No dessert today", "Yes, chocolate cake", "Only fruit"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número de mesa aparece?", "p_de": "Welche Tischnummer steht dort?", "s": {"type": "multiple_choice", "options": ["Table 6", "Table 3", "Table 10"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es la segunda parte?", "p_de": "Was für ein Text ist der zweite Teil?", "s": {"type": "multiple_choice", "options": ["An order note", "A complaint letter", "A bill"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2120 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2120 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2120, 'en', 'reading', 'Restauración', $reading$
CITY LUNCH MENU
Starter: carrot soup.
Main courses: grilled chicken with rice, cheese omelette with salad, pasta with tomato sauce.
Drinks: water, apple juice, tea.

ORDER NOTE FOR TABLE 6
One carrot soup, one grilled chicken with rice, one water, and one apple juice.
No dessert today.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer un pedido escrito del restaurante');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine schriftliche Restaurantbestellung lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
