-- ============================================================
-- Seed: A0 English Path – STEP 4580 – Reading – understand most short reports of a predictable nature (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El informe corresponde al tercer trimestre.", "p_de": "Der Bericht bezieht sich auf das dritte Quartal.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los ingresos fueron 130.000 £.", "p_de": "Der Umsatz betrug 130.000 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los ingresos aumentaron un 8 % respecto al segundo trimestre.", "p_de": "Der Umsatz stieg gegenüber Q2 um 8 %.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Los gastos fueron 100.000 £.", "p_de": "Die Ausgaben betrugen 100.000 £.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El beneficio neto fue 35.000 £.", "p_de": "Der Nettogewinn betrug 35.000 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Hay 3 empleados a tiempo completo y 24 a tiempo parcial.", "p_de": "Es gibt 3 Vollzeitkräfte und 24 Teilzeitkräfte.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La satisfacción del cliente fue del 87 %.", "p_de": "Die Kundenzufriedenheit lag bei 87 %.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se lanzaron tres productos nuevos.", "p_de": "Es wurden drei neue Produkte eingeführt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuáles fueron los ingresos del tercer trimestre?", "p_de": "Wie hoch war der Umsatz im dritten Quartal?", "s_es": {"type": "multiple_choice", "options": ["130.000 £", "120.000 £", "140.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["130.000 £", "120.000 £", "140.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuánto aumentaron los ingresos?", "p_de": "Um wie viel stieg der Umsatz?", "s_es": {"type": "multiple_choice", "options": ["8 %", "5 %", "12 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 %", "5 %", "12 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuáles fueron los gastos totales?", "p_de": "Wie hoch waren die Gesamtausgaben?", "s_es": {"type": "multiple_choice", "options": ["95.000 £", "100.000 £", "85.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["95.000 £", "100.000 £", "85.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue el beneficio neto?", "p_de": "Wie hoch war der Nettogewinn?", "s_es": {"type": "multiple_choice", "options": ["35.000 £", "25.000 £", "45.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["35.000 £", "25.000 £", "45.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos empleados a tiempo completo hay?", "p_de": "Wie viele Vollzeitkräfte gibt es?", "s_es": {"type": "multiple_choice", "options": ["24", "3", "27"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["24", "3", "27"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue la satisfacción del cliente?", "p_de": "Wie hoch war die Kundenzufriedenheit?", "s_es": {"type": "multiple_choice", "options": ["87 %", "75 %", "90 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["87 %", "75 %", "90 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos productos nuevos se lanzaron?", "p_de": "Wie viele neue Produkte wurden eingeführt?", "s_es": {"type": "multiple_choice", "options": ["Dos", "Tres", "Uno"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Drei", "Eins"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue el principal desafío?", "p_de": "Was war die größte Herausforderung?", "s_es": {"type": "multiple_choice", "options": ["Retrasos en la cadena de suministro", "Falta de personal", "Problemas informáticos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lieferkettenverzögerungen", "Personalmangel", "IT-Probleme"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4580
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4580
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4580, 'en', 'reading', 'professional', $content$Quarterly Performance Report – Q3

The company delivered stable growth during Q3. Revenue reached £130,000, which is 8% higher than in Q2. Expenses for the quarter totalled £95,000, leaving a net profit of £35,000. These figures show improved control over operating costs despite pressure from suppliers.

At the end of the quarter, the business employed 24 full-time staff and 3 part-time staff. Customer satisfaction remained strong at 87%, reflecting positive feedback on delivery speed and service quality. During Q3, the product team launched two new products and discontinued one older product with weak demand.

The main operational challenge was supply chain delays from one of our main suppliers. Management is now reviewing alternative suppliers to reduce the risk of future disruption.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un informe trimestral de rendimiento', 'Lee un informe trimestral con ingresos, gastos, plantilla y retos.'),
            (v_reading_id, 'de', 'Lies einen vierteljährlichen Leistungsbericht', 'Lies einen Quartalsbericht mit Umsatz, Kosten, Personal und Herausforderungen.');

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid)
            VALUES (v_reading_id, NULL)
            RETURNING uuid INTO v_ex_id;

            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
