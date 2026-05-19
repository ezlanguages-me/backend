-- ============================================================
-- Seed: A0 English Path – STEP 2440 – Reading – understand most descriptions of common dishes in self-service/fast food establishments (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El combo de cheeseburger lleva hamburguesa, patatas fritas y refresco.", "p_de": "Das Cheeseburger-Menü enthält Burger, Pommes und ein Softgetränk.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La caja de nuggets trae ocho nuggets.", "p_de": "Die Nuggets-Box hat acht Nuggets.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La comida de wrap vegetal incluye ensalada y agua.", "p_de": "Das Veggie-Wrap-Menü enthält Salat und Wasser.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las patatas grandes cuestan £1.", "p_de": "Große Pommes kosten £1.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tarta de manzana cuesta £1.90.", "p_de": "Der Apfelkuchen kostet £1.90.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El refill de refresco cuesta £1.", "p_de": "Das Nachfüllen von Softdrinks kostet £1.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se pide y se paga en la mesa.", "p_de": "Man bestellt und bezahlt am Tisch.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El texto es un menú de autoservicio o comida rápida.", "p_de": "Der Text ist eine Selbstbedienungs- oder Fast-Food-Karte.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuánto cuesta el combo de cheeseburger?", "p_de": "Wie viel kostet das Cheeseburger-Menü?", "s": {"type": "multiple_choice", "options": ["£7.50", "£4.20", "£6.80"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos nuggets trae la caja?", "p_de": "Wie viele Nuggets sind in der Box?", "s": {"type": "multiple_choice", "options": ["6 nuggets", "8 nuggets", "10 nuggets"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué bebida trae la comida vegetal?", "p_de": "Welches Getränk hat das Veggie-Menü?", "s": {"type": "multiple_choice", "options": ["Water", "Soft drink", "Tea"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan las patatas grandes?", "p_de": "Wie viel kosten große Pommes?", "s": {"type": "multiple_choice", "options": ["£2.50", "£1", "£1.90"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre aparece?", "p_de": "Welches Dessert erscheint?", "s": {"type": "multiple_choice", "options": ["Apple pie", "Cheesecake", "Fruit salad"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué extra cuesta £1?", "p_de": "Welches Extra kostet £1?", "s": {"type": "multiple_choice", "options": ["Refill for soft drinks", "Large fries", "The apple pie"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se pide y se paga?", "p_de": "Wo bestellt und bezahlt man?", "s": {"type": "multiple_choice", "options": ["At the counter", "At the table", "Outside"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de establecimiento describe el menú?", "p_de": "Welche Art Betrieb beschreibt die Karte?", "s": {"type": "multiple_choice", "options": ["Fast food or self-service", "Fine dining only", "A hotel breakfast"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2440 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2440 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2440, 'en', 'reading', 'Restauración', $reading$
QUICK BITE MENU
Cheeseburger combo: burger, fries, and a soft drink £7.50.
Chicken nuggets box: 6 nuggets with one sauce £4.20.
Veggie wrap meal: wrap, salad, and water £6.80.

Extras: large fries £2.50, apple pie £1.90, refill for soft drinks £1.
Order and pay at the counter.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer un menú de comida rápida');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine Fast-Food-Speisekarte lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
