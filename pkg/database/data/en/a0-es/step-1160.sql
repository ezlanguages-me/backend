-- ============================================================
-- Seed: A0 English Path – STEP 1160 – Reading – ask for what is required in a shop and understand the reply (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Las pilas, los sobres, el pegamento y los sellos están detrás del mostrador.", "de": "Batterien, Umschläge, Kleber und Briefmarken sind hinter dem Tresen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los cuadernos y los bolígrafos están en las estanterías de la derecha.", "de": "Hefte und Stifte stehen in den Regalen rechts.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El cliente debe decir el producto y la cantidad.", "de": "Der Kunde soll das Produkt und die Menge nennen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las pilas pequeñas cuestan cinco libras el paquete.", "de": "Kleine Batterien kosten fünf Pfund pro Packung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Un libro de seis sellos cuesta cinco libras.", "de": "Ein Heft mit sechs Briefmarken kostet fünf Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tienda solo acepta efectivo.", "de": "Das Geschäft akzeptiert nur Bargeld.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Se puede devolver un producto sin abrir durante tres días.", "de": "Ein ungeöffnetes Produkt kann innerhalb von drei Tagen zurückgegeben werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si no hay un producto, la dependienta puede ofrecer algo parecido.", "de": "Wenn ein Produkt nicht da ist, kann die Verkäuferin etwas Ähnliches anbieten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué productos están detrás del mostrador?", "de": "Welche Produkte sind hinter dem Tresen?", "s_es": {"type": "multiple_choice", "options": ["Batteries, envelopes, glue, and stamps", "Notebooks, rulers, and bags", "Water, juice, and bread"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Batterien, Umschläge, Kleber und Briefmarken", "Hefte, Lineale und Taschen", "Wasser, Saft und Brot"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están los cuadernos y los bolígrafos?", "de": "Wo sind Hefte und Stifte?", "s_es": {"type": "multiple_choice", "options": ["On the shelves on the left side", "Behind the counter", "At the shop door"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In den Regalen auf der linken Seite", "Hinter dem Tresen", "An der Ladentür"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe decir el cliente además del producto?", "de": "Was soll der Kunde außer dem Produkt nennen?", "s_es": {"type": "multiple_choice", "options": ["The quantity", "The bus number", "The teachers name"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Menge", "Die Busnummer", "Den Namen der Lehrkraft"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuestan las pilas pequeñas?", "de": "Wie viel kosten kleine Batterien?", "s_es": {"type": "multiple_choice", "options": ["£3 a pack", "£5 a pack", "£1 each"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["3 £ pro Packung", "5 £ pro Packung", "1 £ pro Stück"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta un libro de seis sellos?", "de": "Wie viel kostet ein Heft mit sechs Briefmarken?", "s_es": {"type": "multiple_choice", "options": ["£5", "£3", "£6"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["5 £", "3 £", "6 £"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace la dependienta si no hay un producto?", "de": "Was macht die Verkäuferin, wenn ein Produkt nicht da ist?", "s_es": {"type": "multiple_choice", "options": ["She offers a similar product", "She closes the shop", "She sends the customer home"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie bietet ein ähnliches Produkt an", "Sie schließt das Geschäft", "Sie schickt den Kunden nach Hause"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué guarda el cliente para una devolución?", "de": "Was bewahrt der Kunde für eine Rückgabe auf?", "s_es": {"type": "multiple_choice", "options": ["The receipt", "A blue pen", "A shopping list"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den Kassenbon", "Einen blauen Stift", "Eine Einkaufsliste"], "answer": 0}}'::jsonb,
        '{"es": "¿Durante cuánto tiempo puede devolver un producto sin abrir?", "de": "Wie lange kann man ein ungeöffnetes Produkt zurückgeben?", "s_es": {"type": "multiple_choice", "options": ["Three days", "One day", "One week"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei Tage", "Einen Tag", "Eine Woche"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1160 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1160 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1160, 'en', 'reading', 'shopping', 'Bright Pen Stationery. Some items stay behind the counter: batteries, envelopes, glue, and stamps. Please ask the shop assistant if you need them.\n\nSay the item clearly and tell us the quantity. Example: I need two envelopes, please. For notebooks and pens, use the shelves on the left side of the shop.\n\nIf an item is not available, the assistant can offer a similar product. Small batteries cost £3 a pack. A book of six stamps costs £5.\n\nThe shop accepts cash and card. Keep your receipt if you want to return an unopened item within three days.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee cómo pedir un producto concreto en una tienda', 'Lee un pequeño aviso de una papelería sobre cómo pedir productos que no están en la estantería.'),
        (v_reading_id, 'de', 'Lies, wie man in einem Geschäft nach einem bestimmten Produkt fragt', 'Lies einen kurzen Aushang in einem Schreibwarengeschäft darüber, wie man Produkte verlangt, die nicht im Regal stehen.');

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
