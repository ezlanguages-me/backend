-- ============================================================
-- Seed: A0 English Path – STEP 2280 – Reading – order a meal and ask for clarification about dishes on the menu (Restauración)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La ensalada de remolacha está asada.", "p_de": "Der Rote-Bete-Salat ist geröstet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El plato principal es pollo con salsa de limón.", "p_de": "Das Hauptgericht ist Hähnchen mit Zitronensoße.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La lubina es un pescado blanco.", "p_de": "Seebarsch ist ein weißer Fisch.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La panna cotta es un postre caliente.", "p_de": "Panna cotta ist ein heißes Dessert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La salsa del pescado es de mantequilla y limón.", "p_de": "Die Soße zum Fisch ist Butter und Zitrone.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las verduras de acompañamiento son de temporada.", "p_de": "Das Gemüse als Beilage ist saisonal.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Roasted significa cocinado en agua.", "p_de": "Roasted bedeutet in Wasser gekocht.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las notas ayudan a aclarar palabras del menú.", "p_de": "Die Notizen helfen, Wörter der Speisekarte zu erklären.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué queso lleva la ensalada de remolacha?", "p_de": "Welchen Käse hat der Rote-Bete-Salat?", "s": {"type": "multiple_choice", "options": ["Goat cheese", "Blue cheese", "Cheddar"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el plato principal?", "p_de": "Was ist das Hauptgericht?", "s": {"type": "multiple_choice", "options": ["Sea bass with a lemon butter sauce", "Roasted chicken with rice", "Pumpkin soup"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué significa roasted?", "p_de": "Was bedeutet roasted?", "s": {"type": "multiple_choice", "options": ["Cooked in the oven", "Cooked in water", "Served cold"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de pescado es la lubina?", "p_de": "Welche Art Fisch ist Seebarsch?", "s": {"type": "multiple_choice", "options": ["A white fish", "A red fish", "A smoked fish"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es la panna cotta?", "p_de": "Wie ist die Panna cotta?", "s": {"type": "multiple_choice", "options": ["A cold milk dessert", "A hot soup", "A bread roll"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué salsa lleva el postre?", "p_de": "Welche Soße hat das Dessert?", "s": {"type": "multiple_choice", "options": ["Berry sauce", "Cheese sauce", "Peanut sauce"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué acompaña al plato principal?", "p_de": "Was begleitet das Hauptgericht?", "s": {"type": "multiple_choice", "options": ["Seasonal greens", "French fries", "Garlic bread"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de texto es este?", "p_de": "Was für ein Text ist das?", "s": {"type": "multiple_choice", "options": ["A tasting menu with notes", "A train schedule", "A hotel receipt"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2280 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2280 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2280, 'en', 'reading', 'Restauración', $reading$
TONIGHT'S TASTING MENU
Starter: roasted beet salad with goat cheese.
Main: sea bass with a lemon butter sauce.
Side: seasonal greens.
Dessert: vanilla panna cotta with berry sauce.

NOTES
Roasted means cooked in the oven.
Sea bass is a white fish.
Panna cotta is a cold milk dessert.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Leer descripciones de platos y aclaraciones');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Gerichte und Erklärungen lesen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
