-- ============================================================
-- Seed: A0 English Path – STEP 3840 – Reading – understand a purchase order (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El número de la orden es PO-7784.", "p_de": "Die Bestellnummer ist PO-7784.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El comprador es River Office Supplies.", "p_de": "Der Käufer ist River Office Supplies.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El pedido es de 15 toner cartridges.", "p_de": "Die Bestellung umfasst 15 Tonerkartuschen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El precio por unidad es £18.", "p_de": "Der Stückpreis beträgt £18.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El total es £900.", "p_de": "Der Gesamtpreis beträgt £900.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La entrega es el 22 de octubre.", "p_de": "Die Lieferung ist am 22. Oktober.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La entrega va a Warehouse door 2.", "p_de": "Die Lieferung geht zu Warehouse door 2.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El contacto de referencia es Maria Soto.", "p_de": "Die Ansprechpartnerin ist Maria Soto.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué se compra en la orden?", "p_de": "Was wird bestellt?", "s_es": {"type": "multiple_choice", "options": ["50 toner cartridges", "50 chairs", "18 printers"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["50 Tonerkartuschen", "50 Stühle", "18 Drucker"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el precio por unidad?", "p_de": "Wie hoch ist der Stückpreis?", "s_es": {"type": "multiple_choice", "options": ["£18", "£9", "£50"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£18", "£9", "£50"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el total del pedido?", "p_de": "Wie hoch ist der Gesamtbetrag?", "s_es": {"type": "multiple_choice", "options": ["£900", "£18", "£500"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£900", "£18", "£500"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es la entrega?", "p_de": "Wann ist die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["22 September", "22 October", "2 September"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["22. September", "22. Oktober", "2. September"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se entrega?", "p_de": "Wo wird geliefert?", "s_es": {"type": "multiple_choice", "options": ["Warehouse door 2", "Reception desk", "Meeting room 4"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Warehouse door 2", "Am Empfang", "Meeting Room 4"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién se envía la factura?", "p_de": "An wen geht die Rechnung?", "s_es": {"type": "multiple_choice", "options": ["To the finance team", "To the driver", "To the kitchen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["An das Finanzteam", "An den Fahrer", "An die Küche"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién es el contacto?", "p_de": "Wer ist die Kontaktperson?", "s_es": {"type": "multiple_choice", "options": ["Maria Soto", "Alex Neri", "Sara Klein"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Maria Soto", "Alex Neri", "Sara Klein"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué departamento aparece con Maria?", "p_de": "Welche Abteilung steht bei Maria?", "s_es": {"type": "multiple_choice", "options": ["Purchasing department", "Cleaning department", "Travel office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einkaufsabteilung", "Reinigungsabteilung", "Reisebüro"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3840 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3840 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3840, 'en', 'reading', 'professional', $content$Purchase Order PO-7784. Buyer: River Office Supplies. Item: 50 toner cartridges. Unit price: £18. Total: £900.

Delivery date: 22 September. Delivery point: Warehouse door 2. Please send the invoice to the finance team.

Reference contact: Maria Soto, purchasing department.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una orden de compra', 'Lee una orden de compra con cantidad, precio, entrega y referencia.'),
            (v_reading_id, 'de', 'Lies eine Bestellung', 'Lies eine Bestellung mit Menge, Preis, Lieferung und Referenz.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
