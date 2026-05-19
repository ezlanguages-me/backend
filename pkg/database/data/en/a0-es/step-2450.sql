-- ============================================================
-- Seed: A0 English Path – STEP 2450 – Reading – understand most of what is on a standard menu in predictable restaurants (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sopa de tomate cuesta £4.50.", "p_de": "Die Tomatensuppe kostet £4.50.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pan de ajo cuesta £5.", "p_de": "Das Knoblauchbrot kostet £5.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El steak viene con patatas fritas.", "p_de": "Das Steak kommt mit Pommes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pollo asado cuesta £12.50.", "p_de": "Das Brathähnchen kostet £12.50.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pasta cuesta £13.", "p_de": "Die Pasta kostet £13.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay helado y apple crumble de postre.", "p_de": "Es gibt Eis und Apple Crumble als Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La limonada cuesta menos que el té.", "p_de": "Die Limonade kostet weniger als der Tee.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El plato especial del día es fish pie con guisantes.", "p_de": "Das Tagesgericht ist Fish Pie mit Erbsen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto cuesta el steak con patatas?", "p_de": "Wie viel kostet das Steak mit Pommes?", "s": {"type": "multiple_choice", "options": ["£14", "£12.50", "£10.50"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal cuesta £10.50?", "p_de": "Welches Hauptgericht kostet £10.50?", "s": {"type": "multiple_choice", "options": ["Pasta with tomato sauce", "Roast chicken with vegetables", "Fish pie with peas"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre cuesta £3.50?", "p_de": "Welches Dessert kostet £3.50?", "s": {"type": "multiple_choice", "options": ["Ice cream", "Apple crumble", "Tomato soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el agua sin gas?", "p_de": "Wie viel kostet stilles Wasser?", "s": {"type": "multiple_choice", "options": ["£2", "£2.80", "£2.20"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida cuesta £2.80?", "p_de": "Welches Getränk kostet £2.80?", "s": {"type": "multiple_choice", "options": ["Lemonade", "Tea", "Still water"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el plato especial de hoy?", "p_de": "Was ist das Tagesgericht?", "s": {"type": "multiple_choice", "options": ["Fish pie with peas", "Steak with chips", "Garlic bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué entrante cuesta £4?", "p_de": "Welche Vorspeise kostet £4?", "s": {"type": "multiple_choice", "options": ["Garlic bread", "Tomato soup", "Ice cream"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de menú es este?", "p_de": "Was für eine Speisekarte ist das?", "s": {"type": "multiple_choice", "options": ["A standard diner menu", "A cinema list", "A train menu"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2450 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2450 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2450, 'en', 'reading', 'Restauración', $reading$
OAK STREET DINER
Starters: tomato soup £4.50, garlic bread £4.
Main courses: steak with chips £14, roast chicken with vegetables £12.50, pasta with tomato sauce £10.50.
Desserts: ice cream £3.50, apple crumble £4.80.

Drinks: still water £2, lemonade £2.80, tea £2.20.
Today's special: fish pie with peas £13.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer un menú estándar de restaurante');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine Standardspeisekarte lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
