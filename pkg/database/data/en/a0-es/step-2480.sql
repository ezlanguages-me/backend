-- ============================================================
-- Seed: A0 English Path – STEP 2480 – Reading – understand a restaurant menu including a wide range of culinary terms (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El carpaccio son lonchas muy finas.", "p_de": "Carpaccio sind sehr dünne Scheiben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La bisque es una sopa rica y cremosa.", "p_de": "Bisque ist eine reichhaltige cremige Suppe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El confit se cocina rápido a fuego fuerte.", "p_de": "Confit wird schnell bei hoher Hitze gekocht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La purée es una comida blanda y triturada.", "p_de": "Püree ist weiches zerdrücktes Essen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reduction es una salsa espesa.", "p_de": "Reduction ist eine dicke Soße.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El coulis es una salsa suave de fruta.", "p_de": "Coulis ist eine glatte Fruchtsoße.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay risotto de setas silvestres como plato principal.", "p_de": "Es gibt Wildpilz-Risotto als Hauptgericht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El menú no tiene ningún postre frío.", "p_de": "Die Speisekarte hat kein kaltes Dessert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué significa carpaccio?", "p_de": "Was bedeutet Carpaccio?", "s": {"type": "multiple_choice", "options": ["Very thin slices", "A thick soup", "A fried onion dish"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sopa aparece en el menú?", "p_de": "Welche Suppe steht auf der Karte?", "s": {"type": "multiple_choice", "options": ["Lobster bisque with cream", "Tomato soup", "Pumpkin broth"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa confit?", "p_de": "Was bedeutet confit?", "s": {"type": "multiple_choice", "options": ["Meat cooked slowly in fat", "Fish served raw", "Vegetables grilled quickly"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué acompaña al duck confit?", "p_de": "Was begleitet das Duck confit?", "s": {"type": "multiple_choice", "options": ["Potato purée", "Fries", "Green beans"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa reduction?", "p_de": "Was bedeutet reduction?", "s": {"type": "multiple_choice", "options": ["A strong sauce cooked until thick", "A cold fruit dessert", "A type of salad"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué postre lleva mint?", "p_de": "Welches Dessert hat Minze?", "s": {"type": "multiple_choice", "options": ["Lemon sorbet", "Vanilla parfait", "Tuna carpaccio"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué es un coulis?", "p_de": "Was ist ein coulis?", "s": {"type": "multiple_choice", "options": ["A smooth fruit sauce", "A creamy soup", "A meat dish"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de menú es este?", "p_de": "Was für eine Speisekarte ist das?", "s": {"type": "multiple_choice", "options": ["A fine-dining menu with culinary terms", "A fast-food menu", "A drinks-only list"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2480 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2480 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2480, 'en', 'reading', 'Restauración', $reading$
CHEF'S SIGNATURE MENU
Starter: tuna carpaccio with citrus dressing.
Soup: lobster bisque with cream.
Main courses: duck confit with potato purée, wild mushroom risotto, beef medallions with red wine reduction.
Dessert: lemon sorbet with mint, vanilla parfait with berry coulis.

MENU NOTES
Carpaccio means very thin slices.
Bisque is a rich creamy soup.
Confit is meat cooked slowly in fat.
Purée is soft mashed food.
Reduction is a strong sauce cooked until thick.
Coulis is a smooth fruit sauce.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer un menú de alta cocina con términos culinarios');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Eine Fine-Dining-Karte mit Küchenbegriffen lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
