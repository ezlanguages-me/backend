-- ============================================================
-- Seed: A0 English Path – STEP 4570 – Reading – understand a short report on a familiar matter (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Las ventas totales de octubre fueron 45.000 £.", "p_de": "Der Gesamtumsatz im Oktober betrug 45.000 £.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El producto más vendido fue el escritorio ergonómico.", "p_de": "Das meistverkaufte Produkt war der ergonomische Schreibtisch.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Se vendieron 120 sillas ergonómicas.", "p_de": "Es wurden 120 ergonomische Stühle verkauft.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La región norte vendió más que la región sur.", "p_de": "Die Nordregion verkaufte mehr als die Südregion.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Los pedidos online aumentaron un 15 %.", "p_de": "Die Online-Bestellungen stiegen um 15 %.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Se apuntaron dos nuevos clientes corporativos.", "p_de": "Zwei neue Firmenkunden wurden gewonnen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Un cliente canceló una suscripción.", "p_de": "Ein Kunde kündigte ein Abonnement.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El objetivo de noviembre es 55.000 £.", "p_de": "Das Ziel für November beträgt 55.000 £.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuáles fueron las ventas totales de octubre?", "p_de": "Wie hoch war der Gesamtumsatz im Oktober?", "s_es": {"type": "multiple_choice", "options": ["45.000 £", "50.000 £", "40.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["45.000 £", "50.000 £", "40.000 £"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál fue el producto más vendido?", "p_de": "Was war das meistverkaufte Produkt?", "s_es": {"type": "multiple_choice", "options": ["Sillas ergonómicas", "Escritorios de oficina", "Pantallas de ordenador"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ergonomische Stühle", "Büroschreibtische", "Computerbildschirme"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántas sillas ergonómicas se vendieron?", "p_de": "Wie viele ergonomische Stühle wurden verkauft?", "s_es": {"type": "multiple_choice", "options": ["120", "100", "150"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["120", "100", "150"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué región tuvo más ventas?", "p_de": "Welche Region hatte höhere Umsätze?", "s_es": {"type": "multiple_choice", "options": ["La región sur", "La región norte", "La región este"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Südregion", "Die Nordregion", "Die Ostregion"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuánto aumentaron los pedidos online?", "p_de": "Um wie viel stiegen die Online-Bestellungen?", "s_es": {"type": "multiple_choice", "options": ["15 %", "10 %", "20 %"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["15 %", "10 %", "20 %"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos nuevos clientes corporativos hubo?", "p_de": "Wie viele neue Firmenkunden gab es?", "s_es": {"type": "multiple_choice", "options": ["Tres", "Dos", "Cuatro"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Drei", "Zwei", "Vier"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué pasó con un cliente?", "p_de": "Was geschah mit einem Kunden?", "s_es": {"type": "multiple_choice", "options": ["Canceló una suscripción", "Se mudó a otra dirección", "Envió una reclamación"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er kündigte ein Abonnement", "Er zog an eine neue Adresse", "Er schickte eine Beschwerde"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el objetivo de noviembre?", "p_de": "Wie lautet das Ziel für November?", "s_es": {"type": "multiple_choice", "options": ["50.000 £", "45.000 £", "55.000 £"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["50.000 £", "45.000 £", "55.000 £"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4570
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4570
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4570, 'en', 'reading', 'professional', $content$Monthly Sales Summary – October

October was a positive month for the sales team. Total sales reached £45,000, supported by strong regional performance and steady online demand. Our best-selling product was the ergonomic chair range, with 120 units sold during the month. The North region generated £20,000 in sales, while the South region performed even better with £25,000.

Online orders increased by 15% compared with September, which suggests that the recent website campaign is working well. The team also signed up three new corporate clients, creating promising opportunities for repeat business in the coming quarter. One existing client cancelled a subscription worth £2,000, which slightly reduced the final result.

The sales target for November has been set at £50,000. Managers will review progress weekly to keep the team on track.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un resumen de ventas mensual', 'Lee un resumen mensual de ventas con cifras, clientes y objetivos.'),
            (v_reading_id, 'de', 'Lies einen monatlichen Verkaufsbericht', 'Lies eine monatliche Verkaufsübersicht mit Zahlen, Kunden und Zielen.');

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
