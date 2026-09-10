-- ============================================================
-- Seed: A0 English Path – STEP 1280 – Reading – understand where the shopkeeper explains the difference between two or more products (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La mochila A es pequeña y ligera.", "de": "Rucksack A ist klein und leicht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mochila A tiene tres bolsillos.", "de": "Rucksack A hat drei Taschen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La mochila B es más grande y más resistente.", "de": "Rucksack B ist größer und stabiler.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mochila B cuesta dieciocho libras.", "de": "Rucksack B kostet achtzehn Pfund.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La mochila A es buena para un día corto de escuela.", "de": "Rucksack A ist gut für einen kurzen Schultag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La mochila B es mejor para llevar un portátil.", "de": "Rucksack B ist besser geeignet, um einen Laptop zu tragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente puede preguntar por colores o por el espacio interior.", "de": "Der Kunde kann nach Farben oder Innenraum fragen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tarjeta dice que las dos mochilas cuestan lo mismo.", "de": "Die Karte sagt, dass beide Rucksäcke gleich viel kosten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Cuánto cuesta la mochila A?", "de": "Wie viel kostet Rucksack A?", "s_es": {"type": "multiple_choice", "options": ["£18", "£26", "£20"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 £", "26 £", "20 £"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos bolsillos tiene la mochila B?", "de": "Wie viele Taschen hat Rucksack B?", "s_es": {"type": "multiple_choice", "options": ["Three", "One", "Two"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Eins", "Zwei"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué es buena la mochila A?", "de": "Wofür ist Rucksack A gut?", "s_es": {"type": "multiple_choice", "options": ["For a notebook, lunch, and a water bottle", "For a laptop and sports shoes", "For winter coats only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für ein Heft, Mittagessen und eine Wasserflasche", "Für einen Laptop und Sportschuhe", "Nur für Wintermäntel"], "answer": 0}}'::jsonb,
        '{"es": "¿Para qué es mejor la mochila B?", "de": "Wofür ist Rucksack B besser?", "s_es": {"type": "multiple_choice", "options": ["For one pen only", "For a long day and more items", "For beach toys"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Nur für einen Stift", "Für einen langen Tag und mehr Dinge", "Für Strandspielzeug"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué mochila es mejor con mal tiempo?", "de": "Welcher Rucksack ist bei schlechtem Wetter besser?", "s_es": {"type": "multiple_choice", "options": ["Backpack A", "Backpack B", "Both are the same"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Rucksack A", "Rucksack B", "Beide sind gleich"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué puede comparar el cliente con el dependiente?", "de": "Was kann der Kunde mit dem Verkäufer vergleichen?", "s_es": {"type": "multiple_choice", "options": ["Train times and tickets", "Classroom numbers", "Colours, straps, or inside space"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Zugzeiten und Tickets", "Raumnummern", "Farben, Gurte oder Innenraum"], "answer": 2}}'::jsonb,
        '{"es": "¿Qué mochila es más ligera?", "de": "Welcher Rucksack ist leichter?", "s_es": {"type": "multiple_choice", "options": ["Backpack B", "Both are heavy", "Backpack A"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Rucksack B", "Beide sind schwer", "Rucksack A"], "answer": 2}}'::jsonb,
        '{"es": "¿Qué mochila es mejor para libros y ropa deportiva?", "de": "Welcher Rucksack ist besser für Bücher und Sportsachen?", "s_es": {"type": "multiple_choice", "options": ["Backpack A", "Backpack B", "Neither one"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Rucksack A", "Rucksack B", "Keiner"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1280 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1280 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1280, 'en', 'reading', 'shopping', 'School Shop — Backpack Guide\n\nWe have two backpacks this week. Here is the information about each one.\n\nBackpack A is small and light. It has one big pocket. It costs £18. Backpack A is good for one notebook, your lunch, and a water bottle. It is a good choice for a short school day or a walk in the city.\n\nBackpack B is bigger and stronger. It has three pockets. It costs £26. Backpack B is good for books, sports clothes, and a laptop. It is better for a long day with more items or for bad weather. It is heavier than Backpack A, but it holds more.\n\nThe two backpacks are not the same price. Backpack A is cheaper. Backpack B is more expensive.\n\nYou can ask the shop assistant to compare the two backpacks. You can ask about colours, the straps, or the space inside.\n\nBoth backpacks are in stock today. Come in and have a look.')RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES
        (v_reading_id, 'es', 'Comparación simple entre dos'), (v_reading_id, 'de', 'Einfachen Vergleich zwischen');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
