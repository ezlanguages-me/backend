-- ============================================================
-- Seed: A0 English Path – STEP 1860 – Reading – understand store guides and directions (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La entrada y las cajas están en la planta 0.", "p_de": "Eingang und Kassen sind auf Etage 0.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los ascensores están en el centro de la tienda.", "p_de": "Die Aufzüge sind in der Mitte des Geschäfts.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La ropa de hombre está en la planta 1.", "p_de": "Herrenkleidung ist auf Etage 1.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ropa de mujer está en la planta 3.", "p_de": "Damenkleidung ist auf Etage 3.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los juguetes están en la planta 3.", "p_de": "Spielzeug ist auf Etage 3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los productos de hogar y cocina están en la planta 4.", "p_de": "Haushalts- und Küchenprodukte sind auf Etage 4.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los baños están cerca de los ascensores en la planta 2.", "p_de": "Die Toiletten sind in der Nähe der Aufzüge auf Etage 2.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La panadería está en la planta 2.", "p_de": "Die Bäckerei ist auf Etage 2.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué hay en la planta 0?", "p_de": "Was gibt es auf Etage 0?", "s": {"type": "multiple_choice", "options": ["Entrance, tills, bakery, and customer service", "Mens clothing and shoes", "Home and kitchen products"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están los ascensores?", "p_de": "Wo sind die Aufzüge?", "s": {"type": "multiple_choice", "options": ["Next to customer service", "In the toy section", "On Floor 4"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están las escaleras mecánicas?", "p_de": "Wo sind die Rolltreppen?", "s": {"type": "multiple_choice", "options": ["In the middle of the store", "By the entrance only", "Near the toilets"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué planta está la ropa de hombre?", "p_de": "Auf welcher Etage ist Herrenkleidung?", "s": {"type": "multiple_choice", "options": ["Floor 1", "Floor 2", "Floor 3"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué planta está la ropa de mujer?", "p_de": "Auf welcher Etage ist Damenkleidung?", "s": {"type": "multiple_choice", "options": ["Floor 2", "Floor 1", "Floor 4"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están la ropa infantil y los juguetes?", "p_de": "Wo sind Kinderkleidung und Spielzeug?", "s": {"type": "multiple_choice", "options": ["Floor 3", "Floor 0", "Floor 2"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay en la planta 4?", "p_de": "Was gibt es auf Etage 4?", "s": {"type": "multiple_choice", "options": ["Home, kitchen, and bathroom products", "Bakery and tills", "Womens handbags"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde están los baños?", "p_de": "Wo sind die Toiletten?", "s": {"type": "multiple_choice", "options": ["On Floor 2 near the lifts", "On Floor 0 by the entrance", "On Floor 4 by the kitchen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1860 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1860 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1860, 'en', 'reading', 'Compras y Transacciones', $reading$
STORE GUIDE
Floor 0: Entrance, tills, bakery, and customer service. Lifts are next to customer service. Escalators are in the middle of the store.

Floor 1: Men's clothing and shoes. Floor 2: Women's clothing, handbags, and accessories. Floor 3: Children's wear and toys.

Floor 4: Home, kitchen, and bathroom products. Toilets are on Floor 2 near the lifts.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Guía de una tienda por plantas');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Wegweiser in einem Kaufhaus');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
