-- ============================================================
-- Seed: A0 English Path – STEP 1960 – Reading – get the attention of staff in an appropriate way and order a meal in a restaurant (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que esperar a que te sienten.", "p_de": "Man soll warten, bis man gesetzt wird.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para pedir, puedes decir Excuse me.", "p_de": "Zum Bestellen kann man Excuse me sagen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa del día cuesta £4.", "p_de": "Die Tagessuppe kostet £4.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pollo a la plancha con arroz cuesta £11.", "p_de": "Gegrilltes Hähnchen mit Reis kostet £11.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pasta vegetal cuesta £10.", "p_de": "Die Gemüse-Pasta kostet £10.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La limonada fresca cuesta £3.", "p_de": "Frische Limonade kostet £3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarta de manzana cuesta £4.", "p_de": "Apfelkuchen kostet £4.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La cuenta se pide en la mesa al camarero.", "p_de": "Die Rechnung verlangt man am Tisch beim Kellner.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué haces primero al llegar?", "p_de": "Was machst du zuerst, wenn du ankommst?", "s": {"type": "multiple_choice", "options": ["Wait to be seated", "Go to the kitchen", "Pay at the door"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puedes decir para pedir?", "p_de": "Was kannst du zum Bestellen sagen?", "s": {"type": "multiple_choice", "options": ["Excuse me", "Run fast", "No ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la sopa del día?", "p_de": "Wie viel kostet die Tagessuppe?", "s": {"type": "multiple_choice", "options": ["£5", "£4", "£6"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta el pollo con arroz?", "p_de": "Wie viel kostet das Hähnchen mit Reis?", "s": {"type": "multiple_choice", "options": ["£11", "£10", "£3"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la pasta vegetal?", "p_de": "Wie viel kostet die Gemüse-Pasta?", "s": {"type": "multiple_choice", "options": ["£10", "£11", "£4.50"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta la limonada fresca?", "p_de": "Wie viel kostet die frische Limonade?", "s": {"type": "multiple_choice", "options": ["£3", "£5", "£4"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre cuesta £4?", "p_de": "Welches Dessert kostet £4?", "s": {"type": "multiple_choice", "options": ["Ice cream", "Apple cake", "Soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo pides la cuenta?", "p_de": "Wie verlangst du die Rechnung?", "s": {"type": "multiple_choice", "options": ["Ask the waiter at the table", "Go to the counter", "Call the kitchen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1960 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1960 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1960, 'en', 'reading', 'Restauración', $reading$
RIVER TABLE RESTAURANT
Please wait to be seated. To order, say "Excuse me" or "Could we order, please?"

Starters: soup of the day £5. Main courses: grilled chicken with rice £11, vegetable pasta £10. Drinks: fresh lemonade £3.

Desserts: ice cream £4, apple cake £4.50. Ask the waiter for the bill at the table.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Menú y forma de pedir en un restaurante');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Speisekarte und Bestellen im Restaurant');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
