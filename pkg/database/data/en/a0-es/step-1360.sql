-- ============================================================
-- Seed: A0 English Path – STEP 1360 – Reading – ask to change money at a bank (Servicios Financieros y Postales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El banco cambia euros, dólares y libras.", "p_de": "Die Bank wechselt Euro, Dollar und Pfund.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un euro vale 1.08 dólares según el tablero.", "p_de": "Laut Tafel ist ein Euro 1,08 Dollar wert.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Un dólar vale 1.20 euros.", "p_de": "Ein Dollar ist 1,20 Euro wert.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El cambio mínimo es de 20 euros.", "p_de": "Der Mindestbetrag für den Wechsel beträgt 20 Euro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta documento de identidad.", "p_de": "Man braucht keinen Ausweis.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay una comisión de 3 euros por operación.", "p_de": "Es gibt eine Gebühr von 3 Euro pro Vorgang.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El cajero entrega un recibo después del cambio.", "p_de": "Die Mitarbeiterin gibt nach dem Wechsel einen Beleg.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debes contar el dinero después de salir del banco.", "p_de": "Man soll das Geld erst nach dem Verlassen der Bank zählen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué monedas cambia el banco?", "p_de": "Welche Währungen wechselt die Bank?", "s": {"type": "multiple_choice", "options": ["Euros, dollars, and pounds", "Only yen and francs", "Only pesos"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto vale un euro?", "p_de": "Wie viel ist ein Euro wert?", "s": {"type": "multiple_choice", "options": ["1.08 dollars", "0.80 dollars", "2 dollars"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el cambio mínimo?", "p_de": "Wie hoch ist der Mindestwechsel?", "s": {"type": "multiple_choice", "options": ["20 euros", "5 euros", "100 euros"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar?", "p_de": "Was muss man mitbringen?", "s": {"type": "multiple_choice", "options": ["A passport or national ID", "A school bag", "A train ticket"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto es la comisión?", "p_de": "Wie hoch ist die Gebühr?", "s": {"type": "multiple_choice", "options": ["3 euros", "10 euros", "No fee"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué te da el cajero?", "p_de": "Was gibt die Mitarbeiterin?", "s": {"type": "multiple_choice", "options": ["Notes, coins, and a receipt", "A newspaper", "A map"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde debes contar el dinero?", "p_de": "Wo soll man das Geld zählen?", "s": {"type": "multiple_choice", "options": ["Before leaving the counter", "At home only", "On the bus"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué muestra el tablero?", "p_de": "Was zeigt die Tafel?", "s": {"type": "multiple_choice", "options": ["Exchange rates", "Bus times", "Weather alerts"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1360 AND path_uuid = v_path_id);
        DELETE FROM reading WHERE step_order = 1360 AND path_uuid = v_path_id;

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 1360, 'en', 'reading', 'financial', 'City Bank Foreign Exchange changes euros, dollars, and pounds.

Today the board shows: 1 euro = 1.08 dollars, 1 dollar = 0.92 euros, and 1 pound = 1.17 euros.

The minimum exchange is 20 euros. Please bring your passport or national ID. There is a service fee of 3 euros for each exchange.

Count your money before you leave the counter. The teller gives you notes, coins, and a receipt after every transaction.')
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'es', 'Cambiar dinero en el banco', 'Lee un panel simple de cambio de divisas con tasas, documentos y comisión.');

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES (v_reading_id, 'de', 'Geld bei der Bank wechseln', 'Lies eine einfache Wechseltafel mit Kursen, Dokumenten und Gebühr.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
        END LOOP;
    END;
    $seed$;
