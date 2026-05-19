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
        '{"es": "¿Para qué es mejor la mochila B?", "de": "Wofür ist Rucksack B besser?", "s_es": {"type": "multiple_choice", "options": ["For a long day and more items", "For one pen only", "For beach toys"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Für einen langen Tag und mehr Dinge", "Nur für einen Stift", "Für Strandspielzeug"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué mochila es mejor con mal tiempo?", "de": "Welcher Rucksack ist bei schlechtem Wetter besser?", "s_es": {"type": "multiple_choice", "options": ["Backpack B", "Backpack A", "Both are the same"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rucksack B", "Rucksack A", "Beide sind gleich"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué puede comparar el cliente con el dependiente?", "de": "Was kann der Kunde mit dem Verkäufer vergleichen?", "s_es": {"type": "multiple_choice", "options": ["Colours, straps, or inside space", "Train times and tickets", "Classroom numbers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Farben, Gurte oder Innenraum", "Zugzeiten und Tickets", "Raumnummern"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué mochila es más ligera?", "de": "Welcher Rucksack ist leichter?", "s_es": {"type": "multiple_choice", "options": ["Backpack A", "Backpack B", "Both are heavy"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rucksack A", "Rucksack B", "Beide sind schwer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué mochila es mejor para libros y ropa deportiva?", "de": "Welcher Rucksack ist besser für Bücher und Sportsachen?", "s_es": {"type": "multiple_choice", "options": ["Backpack B", "Backpack A", "Neither one"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rucksack B", "Rucksack A", "Keiner"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1280 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1280 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1280, 'en', 'reading', 'shopping', 'Backpack A is small and light. It has one big pocket and costs £18. It is good for one notebook, lunch, and a water bottle.\n\nBackpack B is bigger and stronger. It has three pockets and costs £26. It is good for books, sports clothes, and a laptop.\n\nBackpack A is better for a short school day or a city walk. Backpack B is better for a long day, more items, or bad weather.\n\nAsk the shop assistant if you want to compare colours, straps, or inside space.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee una comparación simple entre dos productos', 'Lee una tarjeta de tienda que compara dos mochilas para ayudar al cliente a elegir.'),
        (v_reading_id, 'de', 'Lies einen einfachen Vergleich zwischen zwei Produkten', 'Lies eine Ladenkarte, die zwei Rucksäcke vergleicht, damit der Kunde wählen kann.');

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
