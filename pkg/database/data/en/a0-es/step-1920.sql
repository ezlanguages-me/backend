-- ============================================================
-- Seed: A0 English Path – STEP 1920 – Reading – go to a self-service or fast food establishment and order a meal (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El menú de cheeseburger cuesta £6.50.", "p_de": "Das Cheeseburger-Menü kostet £6.50.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El menú de chicken wrap cuesta £6.50.", "p_de": "Das Chicken-Wrap-Menü kostet £6.50.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Añadir queso cuesta 50 peniques.", "p_de": "Käse extra kostet 50 Pence.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Añadir bacon cuesta 50 peniques.", "p_de": "Speck extra kostet 50 Pence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La caja infantil incluye nuggets, rodajas de manzana y agua.", "p_de": "Die Kinderbox enthält Nuggets, Apfelscheiben und Wasser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se pide en la mesa.", "p_de": "Man bestellt am Tisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que decir el tamaño de la bebida o comida.", "p_de": "Man muss die Größe angeben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los tamaños posibles son pequeño, mediano o grande.", "p_de": "Die möglichen Größen sind klein, mittel oder groß.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto cuesta el menú de cheeseburger?", "p_de": "Wie viel kostet das Cheeseburger-Menü?", "s": {"type": "multiple_choice", "options": ["£6.50", "£6.00", "£4.20"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluye el menú de cheeseburger?", "p_de": "Was ist im Cheeseburger-Menü enthalten?", "s": {"type": "multiple_choice", "options": ["Burger, fries, and a small drink", "Burger and salad", "Wrap and water"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el menú de chicken wrap?", "p_de": "Wie viel kostet das Chicken-Wrap-Menü?", "s": {"type": "multiple_choice", "options": ["£6.00", "£6.50", "£5.00"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta añadir queso?", "p_de": "Wie viel kostet Käse extra?", "s": {"type": "multiple_choice", "options": ["50p", "£1", "£1.50"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta añadir bacon?", "p_de": "Wie viel kostet Speck extra?", "s": {"type": "multiple_choice", "options": ["£1", "50p", "£2"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluye la caja infantil?", "p_de": "Was ist in der Kinderbox?", "s": {"type": "multiple_choice", "options": ["Nuggets, apple slices, and water", "Burger, fries, and cola", "Wrap and juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde haces el pedido?", "p_de": "Wo gibst du die Bestellung auf?", "s": {"type": "multiple_choice", "options": ["At the counter", "At the table", "At the kitchen door"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tienes que decir al pedir?", "p_de": "Was musst du beim Bestellen sagen?", "s": {"type": "multiple_choice", "options": ["The size", "The train platform", "Your age"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1920 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1920 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1920, 'en', 'reading', 'Restauración', $reading$
CITY BURGER MENU
Cheeseburger meal £6.50: burger, fries, small drink. Chicken wrap meal £6.00: wrap, fries, small drink.

Add cheese 50p. Add bacon £1. Kids box £4.20 with nuggets, apple slices, and water.

Order at the counter. Please say size: small, medium, or large.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Menú de comida rápida');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Fast-Food-Menü');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
