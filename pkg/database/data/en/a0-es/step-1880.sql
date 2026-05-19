-- ============================================================
-- Seed: A0 English Path – STEP 1880 – Reading – understand product labels at the level of Tissues, Toothpaste, etc (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La pasta de dientes Fresh Mint está en el pasillo 3.", "p_de": "Die Zahnpasta Fresh Mint ist in Gang 3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los pañuelos tienen 200 hojas.", "p_de": "Die Taschentücher haben 200 Blätter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El champú Daily Care tiene 250 ml.", "p_de": "Das Shampoo Daily Care hat 250 ml.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El lavavajillas tiene aroma de limón.", "p_de": "Das Spülmittel hat Zitronenduft.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El jabón de manos es para piel sensible.", "p_de": "Die Handseife ist für empfindliche Haut.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El detergente de ropa está en el pasillo 5.", "p_de": "Das Waschmittel ist in Gang 5.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Las toallitas de bebé están en el pasillo 5.", "p_de": "Baby-Feuchttücher sind in Gang 5.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las pilas AA están en el pasillo 4.", "p_de": "AA-Batterien sind in Gang 4.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde está la pasta de dientes?", "p_de": "Wo ist die Zahnpasta?", "s": {"type": "multiple_choice", "options": ["Aisle 3", "Aisle 4", "Aisle 5"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas hojas tienen los pañuelos?", "p_de": "Wie viele Blätter haben die Taschentücher?", "s": {"type": "multiple_choice", "options": ["100 sheets", "200 sheets", "50 sheets"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos mililitros tiene el champú?", "p_de": "Wie viele Milliliter hat das Shampoo?", "s": {"type": "multiple_choice", "options": ["250 ml", "100 ml", "500 ml"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué aroma tiene el lavavajillas?", "p_de": "Welchen Duft hat das Spülmittel?", "s": {"type": "multiple_choice", "options": ["Lemon", "Mint", "Apple"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué piel es el jabón de manos?", "p_de": "Für welche Haut ist die Handseife?", "s": {"type": "multiple_choice", "options": ["Sensitive skin", "Dry hair", "Dark clothes"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué producto cuida la ropa de color?", "p_de": "Welches Produkt ist für bunte Kleidung?", "s": {"type": "multiple_choice", "options": ["Laundry detergent - Colour Care", "Toothpaste - Fresh Mint", "Dish sponges"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué pasillo están las toallitas de bebé?", "p_de": "In welchem Gang sind die Baby-Feuchttücher?", "s": {"type": "multiple_choice", "options": ["Aisle 5", "Aisle 3", "Aisle 4"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otros productos hay en el pasillo 5?", "p_de": "Welche anderen Produkte gibt es in Gang 5?", "s": {"type": "multiple_choice", "options": ["Batteries AA, toilet paper, and dish sponges", "Shampoo and soap", "Toothpaste and tissues"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1880 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1880 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1880, 'en', 'reading', 'Compras y Transacciones', $reading$
AISLE 3
Toothpaste - Fresh Mint 100 ml. Tissues - Soft White, 100 sheets. Shampoo - Daily Care 250 ml.

AISLE 4
Washing-up liquid - Lemon 500 ml. Hand soap - Sensitive Skin. Laundry detergent - Colour Care 1 litre.

AISLE 5
Baby wipes, batteries AA, toilet paper, and dish sponges.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Etiquetas de productos cotidianos');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Alltägliche Produktetiketten');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
