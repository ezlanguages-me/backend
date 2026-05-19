-- ============================================================
-- Seed: A0 English Path – STEP 2470 – Reading – understand a fairly wide range of items on a standard restaurant menu (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay halloumi a la parrilla entre los entrantes.", "p_de": "Es gibt gegrillten Halloumi unter den Vorspeisen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa de lentejas es un plato principal.", "p_de": "Die Linsensuppe ist ein Hauptgericht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay chuletas de cordero con romero.", "p_de": "Es gibt Lammkoteletts mit Rosmarin.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El bacalao viene con arroz blanco.", "p_de": "Der Kabeljau kommt mit weißem Reis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El risotto es de espinacas.", "p_de": "Das Risotto ist mit Spinat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las patatas fritas aparecen como guarnición.", "p_de": "Pommes erscheinen als Beilage.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay mousse de chocolate de postre.", "p_de": "Es gibt Schokoladenmousse als Dessert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay vino en las bebidas de la casa.", "p_de": "Es gibt keinen Wein bei den Hausgetränken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué entrante es una sopa?", "p_de": "Welche Vorspeise ist eine Suppe?", "s": {"type": "multiple_choice", "options": ["Lentil soup", "Grilled halloumi", "Prawn cocktail"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal lleva romero?", "p_de": "Welches Hauptgericht hat Rosmarin?", "s": {"type": "multiple_choice", "options": ["Lamb chops", "Chicken salad", "Spinach risotto"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué viene el bacalao?", "p_de": "Womit kommt der Kabeljau?", "s": {"type": "multiple_choice", "options": ["Mashed potatoes", "Rice", "Fries"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué plato principal es vegetariano?", "p_de": "Welches Hauptgericht ist vegetarisch?", "s": {"type": "multiple_choice", "options": ["Spinach risotto", "Lamb chops", "Cod with mashed potatoes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué guarnición es una ensalada simple?", "p_de": "Welche Beilage ist ein einfacher Salat?", "s": {"type": "multiple_choice", "options": ["Mixed leaves", "Fries", "Mashed potatoes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre tiene chocolate?", "p_de": "Welches Dessert hat Schokolade?", "s": {"type": "multiple_choice", "options": ["Chocolate mousse", "Lemon tart", "Fruit plate"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida de la casa tiene burbujas?", "p_de": "Welches Hausgetränk hat Kohlensäure?", "s": {"type": "multiple_choice", "options": ["Sparkling water", "Fresh juice", "Red wine"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de menú es este?", "p_de": "Was für eine Speisekarte ist das?", "s": {"type": "multiple_choice", "options": ["An à la carte restaurant menu", "A breakfast invoice", "A school lunch card"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2470 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2470 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2470, 'en', 'reading', 'Restauración', $reading$
RIVER HOUSE À LA CARTE
Starters: grilled halloumi, prawn cocktail, lentil soup.
Main courses: lamb chops with rosemary, cod with mashed potatoes, spinach risotto, chicken salad.
Sides: green beans, fries, mixed leaves.
Desserts: lemon tart, chocolate mousse, fruit plate.

House drinks: sparkling water, white wine, red wine, fresh juice.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer una carta a la carta variada');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine abwechslungsreiche À-la-carte-Karte lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
