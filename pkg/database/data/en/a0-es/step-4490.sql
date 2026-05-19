-- ============================================================
-- Seed: A0 English Path – STEP 4490 – Reading – deal with routine letters (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La carta es de Green Valley Suppliers.", "p_de": "Der Brief ist von Green Valley Suppliers.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El pedido es de 20 sillas de oficina.", "p_de": "Die Bestellung gilt für 20 Bürostühle.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "La entrega es el martes 14 de noviembre.", "p_de": "Die Lieferung ist am Dienstag, dem 14. November.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La entrega es por la tarde.", "p_de": "Die Lieferung ist am Nachmittag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El correo de contacto es orders@greenvalley.co.uk.", "p_de": "Die Kontakt-E-Mail ist orders@greenvalley.co.uk.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "El pago vence en 14 días.", "p_de": "Die Zahlung ist innerhalb von 14 Tagen fällig.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "El número de pedido es 4490.", "p_de": "Die Bestellnummer ist 4490.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "La carta pide confirmar por teléfono.", "p_de": "Der Brief bittet um eine telefonische Bestätigung.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "¿Cuál es el número de pedido?", "p_de": "Wie lautet die Bestellnummer?", "s_es": {"type": "multiple_choice", "options": ["#4490", "#4940", "#4049"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["#4490", "#4940", "#4049"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos escritorios hay en el pedido?", "p_de": "Wie viele Schreibtische sind in der Bestellung?", "s_es": {"type": "multiple_choice", "options": ["20", "10", "30"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20", "10", "30"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué día es la entrega?", "p_de": "An welchem Tag ist die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["Martes", "Miércoles", "Lunes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstag", "Mittwoch", "Montag"], "answer": 0}}'::jsonb,
            '{"p": "¿Entre qué horas es la entrega?", "p_de": "Zwischen welchen Uhrzeiten erfolgt die Lieferung?", "s_es": {"type": "multiple_choice", "options": ["Entre las 9:00 y las 12:00", "Entre la 1:00 y las 5:00", "Entre las 8:00 y las 10:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwischen 9 Uhr und 12 Uhr", "Zwischen 13 Uhr und 17 Uhr", "Zwischen 8 Uhr und 10 Uhr"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuál es el correo de contacto?", "p_de": "Wie lautet die Kontakt-E-Mail?", "s_es": {"type": "multiple_choice", "options": ["orders@greenvalley.co.uk", "sales@greenvalley.co.uk", "info@greenvalley.co.uk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["orders@greenvalley.co.uk", "sales@greenvalley.co.uk", "info@greenvalley.co.uk"], "answer": 0}}'::jsonb,
            '{"p": "¿Cuántos días hay para pagar?", "p_de": "Wie viele Tage hat man für die Zahlung?", "s_es": {"type": "multiple_choice", "options": ["30", "14", "7"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["30", "14", "7"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué se entrega?", "p_de": "Was wird geliefert?", "s_es": {"type": "multiple_choice", "options": ["Escritorios de oficina", "Sillas de oficina", "Pantallas de ordenador"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Büroschreibtische", "Bürostühle", "Computerbildschirme"], "answer": 0}}'::jsonb,
            '{"p": "¿Qué tipo de carta es esta?", "p_de": "Was für ein Brief ist das?", "s_es": {"type": "multiple_choice", "options": ["Una confirmación de entrega", "Una reclamación", "Una lista de precios"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Lieferbestätigung", "Eine Beschwerde", "Eine Preisliste"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid
            FROM reading
            WHERE step_order = 4490
              AND path_uuid = v_path_id
              AND source_language = 'en'
              AND type = 'reading'
        );
        DELETE FROM reading
        WHERE step_order = 4490
          AND path_uuid = v_path_id
          AND source_language = 'en'
          AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4490, 'en', 'reading', 'professional', $content$Dear Ms Alvarez,

Thank you for your order #4490. We are pleased to confirm your purchase of 20 office desks from Green Valley Suppliers. The desks are packed and ready for dispatch from our warehouse. Delivery has been booked for Tuesday 14 November, and our driver is expected to arrive between 9am and 12 noon.

Please make sure that someone is available to receive the goods and sign the delivery note. If there are any access instructions for the building, please send them in advance. If you need to contact our team before delivery, you can write to orders@greenvalley.co.uk and we will reply as soon as possible.

As agreed, payment is due within 30 days from the invoice date. We appreciate your business and look forward to serving you again.

Kind regards,
Sales Administration
Green Valley Suppliers$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una carta de negocios rutinaria', 'Lee una carta comercial sobre un pedido, la entrega y las condiciones de pago.'),
            (v_reading_id, 'de', 'Lies einen routinemäßigen Geschäftsbrief', 'Lies einen Geschäftsbrief über eine Bestellung, die Lieferung und die Zahlungsbedingungen.');

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
