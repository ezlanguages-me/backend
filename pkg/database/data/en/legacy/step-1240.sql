-- ============================================================
-- Seed: A0 English Path – STEP 1240 – Reading – understand a counter-service shop where items are requested and served by a shopkeeper (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "En la carnicería el cliente coge un número de papel.", "de": "In der Metzgerei nimmt der Kunde eine Papiernummer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El cliente pide el producto y la cantidad.", "de": "Der Kunde nennt Produkt und Menge.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El pollo, la ternera y las salchichas están en una estantería abierta.", "de": "Huhn, Rindfleisch und Würste liegen in einem offenen Regal.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El carnicero mete la comida en una bolsa y dice el precio.", "de": "Der Metzger legt das Essen in eine Tüte und nennt den Preis.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La caja pequeña está al lado del mostrador.", "de": "Die kleine Kasse ist neben dem Tresen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede pagar con tarjeta desde una libra.", "de": "Kartenzahlung ist ab einem Pfund möglich.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Si el cliente quiere dos bolsas, debe pedirlo antes de pagar.", "de": "Wenn der Kunde zwei Tüten möchte, muss er das vor dem Bezahlen sagen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tienda cierra a las 6 PM en punto.", "de": "Das Geschäft schließt genau um 18 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué toma el cliente primero?", "de": "Was nimmt der Kunde zuerst?", "s_es": {"type": "multiple_choice", "options": ["A paper ticket", "A basket", "A receipt"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Papiernummer", "Einen Korb", "Einen Bon"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué información pide el cliente?", "de": "Welche Information sagt der Kunde bei der Bestellung?", "s_es": {"type": "multiple_choice", "options": ["The item and the quantity", "The bus stop and the time", "The colour and the floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Das Produkt und die Menge", "Die Haltestelle und die Zeit", "Die Farbe und die Etage"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están los productos frescos?", "de": "Wo sind die frischen Produkte?", "s_es": {"type": "multiple_choice", "options": ["Behind the glass counter", "Outside the shop", "On the floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter der Glastheke", "Vor dem Geschäft", "Auf dem Boden"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde paga el cliente?", "de": "Wo bezahlt der Kunde?", "s_es": {"type": "multiple_choice", "options": ["At the bakery next door", "At the small till next to the counter", "At the entrance"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["In der Bäckerei nebenan", "An der kleinen Kasse neben dem Tresen", "Am Eingang"], "answer": 1}}'::jsonb,
        '{"es": "¿Desde cuánto acepta la tienda tarjeta?", "de": "Ab welchem Betrag akzeptiert der Laden Karte?", "s_es": {"type": "multiple_choice", "options": ["£1", "£5", "£10"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["1 £", "5 £", "10 £"], "answer": 1}}'::jsonb,
        '{"es": "¿Cuándo pide el cliente que corten o separen el pedido?", "de": "Wann bittet der Kunde darum, die Bestellung zu schneiden oder zu trennen?", "s_es": {"type": "multiple_choice", "options": ["After leaving the shop", "Before paying", "The next day"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Nach dem Verlassen des Ladens", "Vor dem Bezahlen", "Am nächsten Tag"], "answer": 1}}'::jsonb,
        '{"es": "¿Qué ejemplo de pedido da el cartel?", "de": "Welches Bestellbeispiel gibt das Schild?", "s_es": {"type": "multiple_choice", "options": ["Two bottles of milk", "A blue notebook", "One kilo of chicken"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Zwei Flaschen Milch", "Ein blaues Heft", "Ein Kilo Huhn"], "answer": 2}}'::jsonb,
        '{"es": "¿Hasta qué hora abre la tienda?", "de": "Bis wann ist das Geschäft geöffnet?", "s_es": {"type": "multiple_choice", "options": ["5 PM", "7 PM", "6:30 PM"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["17 Uhr", "19 Uhr", "18:30 Uhr"], "answer": 2}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1240 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1240 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1240, 'en', 'reading', 'shopping', 'Green Street Butcher — Counter Service\n\nWelcome to our shop. The shopkeeper serves you at the counter. Here is how it works.\n\nWhen you arrive, take a paper ticket from the machine near the door. Wait for your number to be called. Then go to the counter.\n\nTell the shopkeeper what you want and how much. For example: one kilo of chicken, please. Or: four sausages, please. The shopkeeper puts the food in a bag and tells you the price.\n\nAll fresh products — chicken, beef, and sausages — are behind the glass counter. You cannot take them yourself from an open shelf.\n\nWhen your order is ready, pay at the small till next to the counter. We accept cash. Card payments start at £5.\n\nIf you want your order cut in pieces or packed in two bags, ask before you pay.\n\nThe shop closes at 6:30 PM. We look forward to serving you.')RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES
        (v_reading_id, 'es', 'Tienda con mostrador'), (v_reading_id, 'de', 'Geschäft mit Bedienungstheke');

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
