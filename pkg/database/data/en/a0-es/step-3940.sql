-- ============================================================
-- Seed: A0 English Path – STEP 3940 – Reading – understand an invoice (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "La factura es la número 5512.", "p_de": "Die Rechnung hat die Nummer 5512.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La fecha de emisión es 8 de julio.", "p_de": "Das Ausstellungsdatum ist der 8. Juli.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay 10 office chairs y 4 desk lamps.", "p_de": "Es gibt 10 Bürostühle und 4 Schreibtischlampen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El subtotal es £300.", "p_de": "Die Zwischensumme beträgt £300.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El IVA es del 20% y son £60.", "p_de": "Die Mehrwertsteuer beträgt 20% und sind £60.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El total es £260.", "p_de": "Der Gesamtbetrag ist £260.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El pago es dentro de 14 días por transferencia bancaria.", "p_de": "Die Zahlung erfolgt innerhalb von 14 Tagen per Banküberweisung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La referencia de pago es INV-5512.", "p_de": "Die Zahlungsreferenz ist INV-5512.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuántas desk lamps hay?", "p_de": "Wie viele Schreibtischlampen gibt es?", "s_es": {"type": "multiple_choice", "options": ["10", "4", "12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10", "4", "12"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuesta cada office chair?", "p_de": "Wie viel kostet jeder Bürostuhl?", "s_es": {"type": "multiple_choice", "options": ["£45", "£12", "£60"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£45", "£12", "£60"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el subtotal?", "p_de": "Wie hoch ist die Zwischensumme?", "s_es": {"type": "multiple_choice", "options": ["£300", "£360", "£60"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£300", "£360", "£60"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto es el VAT?", "p_de": "Wie hoch ist die MwSt.?", "s_es": {"type": "multiple_choice", "options": ["£60", "£20", "£14"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£60", "£20", "£14"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el total?", "p_de": "Wie hoch ist der Gesamtbetrag?", "s_es": {"type": "multiple_choice", "options": ["£360", "£300", "£420"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£360", "£300", "£420"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se paga?", "p_de": "Wie bezahlt man?", "s_es": {"type": "multiple_choice", "options": ["By bank transfer", "By cash at reception", "By phone call"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per Banküberweisung", "Bar am Empfang", "Per Telefonanruf"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos días hay para pagar?", "p_de": "Wie viele Tage hat man zum Bezahlen?", "s_es": {"type": "multiple_choice", "options": ["14 days", "7 days", "30 days"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14 Tage", "7 Tage", "30 Tage"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué correo se escribe por dudas?", "p_de": "An welche E-Mail schreibt man bei Fragen?", "s_es": {"type": "multiple_choice", "options": ["finance@riveroffice.co.uk", "support@hotel.com", "sales@busline.com"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["finance@riveroffice.co.uk", "support@hotel.com", "sales@busline.com"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3940 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3940 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3940, 'en', 'reading', 'professional', $content$Invoice 5512. Issue date: 8 July. Client: Green Tower Offices. Items: 10 desk lamps at £12 each; 4 office chairs at £45 each. Subtotal: £300. VAT 20%: £60. Total: £360.

Payment is due within 14 days by bank transfer. Please use reference INV-5512 in the payment note. For questions, contact finance@riveroffice.co.uk.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una factura', 'Lee una factura con artículos, subtotal, IVA, total y condiciones de pago.'),
            (v_reading_id, 'de', 'Lies eine Rechnung', 'Lies eine Rechnung mit Artikeln, Zwischensumme, MwSt., Gesamtbetrag und Zahlungsbedingungen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
