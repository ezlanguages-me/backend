-- ============================================================
-- Seed: A0 English Path – STEP 3550 – Reading – write a business email request (Correspondencia e Informes Profesionales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El email pide una lista de precios actualizada.", "p_de": "Die E-Mail bittet um eine aktuelle Preisliste.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La oficina necesita treinta cartuchos.", "p_de": "Das Büro braucht dreißig Kartuschen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La persona pregunta por el tiempo de entrega del pedido 458.", "p_de": "Die Person fragt nach der Lieferzeit für Bestellung 458.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También pregunta si hay cartuchos negros y azules.", "p_de": "Sie fragt auch, ob es schwarze und blaue Kartuschen gibt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La oficina abre los fines de semana para entregas.", "p_de": "Das Büro ist am Wochenende für Lieferungen geöffnet.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Quieren la información para el miércoles por la tarde.", "p_de": "Sie möchten die Information bis Mittwoch Nachmittag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La persona que escribe se llama Rosa Vega.", "p_de": "Die schreibende Person heißt Rosa Vega.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Rosa trabaja en Blue Hotel.", "p_de": "Rosa arbeitet im Blue Hotel.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Cuántos cartuchos necesitan?", "p_de": "Wie viele Kartuschen brauchen sie?", "s_es": {"type": "multiple_choice", "options": ["Twenty", "Ten", "Thirty"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwanzig", "Zehn", "Dreißig"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número de pedido aparece en el email?", "p_de": "Welche Bestellnummer steht in der E-Mail?", "s_es": {"type": "multiple_choice", "options": ["458", "845", "548"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["458", "845", "548"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué colores pregunta Rosa?", "p_de": "Nach welchen Farben fragt Rosa?", "s_es": {"type": "multiple_choice", "options": ["Black and blue", "Red and green", "Only black"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Schwarz und blau", "Rot und grün", "Nur schwarz"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo está abierta la oficina?", "p_de": "Wann ist das Büro geöffnet?", "s_es": {"type": "multiple_choice", "options": ["Monday to Friday, 8 AM to 5 PM", "Every day, 6 AM to 10 PM", "Only on Tuesday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Montag bis Freitag, 8 Uhr bis 17 Uhr", "Jeden Tag, 6 Uhr bis 22 Uhr", "Nur am Dienstag"], "answer": 0}}'::jsonb,
        '{"p": "¿Para cuándo quiere la información?", "p_de": "Bis wann möchte sie die Information?", "s_es": {"type": "multiple_choice", "options": ["By Wednesday afternoon", "By Friday morning", "By tonight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis Mittwoch Nachmittag", "Bis Freitag Morgen", "Bis heute Abend"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el trabajo de Rosa?", "p_de": "Was ist Rosas Beruf?", "s_es": {"type": "multiple_choice", "options": ["Office Assistant", "Sales Manager", "Hotel Receptionist"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Office Assistant", "Verkaufsleiterin", "Hotelrezeptionistin"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué empresa trabaja Rosa?", "p_de": "In welcher Firma arbeitet Rosa?", "s_es": {"type": "multiple_choice", "options": ["Green Line Travel", "Sunrise Services", "City Office Print"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Green Line Travel", "Sunrise Services", "City Office Print"], "answer": 0}}'::jsonb,
        '{"p": "¿A quién escribe Rosa?", "p_de": "An wen schreibt Rosa?", "s_es": {"type": "multiple_choice", "options": ["Ms Lane", "Mr Patel", "Anna Reed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ms Lane", "Mr Patel", "Anna Reed"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM reading
            WHERE step_order = 3550 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading'
        );
        DELETE FROM reading WHERE step_order = 3550 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3550, 'en', 'reading', 'professional', $content$Subject: Request for updated price list

Dear Ms Lane,

We need twenty printer cartridges for our office next month. Please send your current price list and tell us the delivery time for order 458.

Could you also confirm if the cartridges are available in black and blue? Our office is open Monday to Friday, from 8 AM to 5 PM, for deliveries.

If possible, please send the information by Wednesday afternoon.

Thank you for your help.
Best regards,
Rosa Vega
Office Assistant
Green Line Travel$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee una solicitud por email profesional', 'Lee un email corto de oficina para pedir precios, disponibilidad y tiempo de entrega.'),
            (v_reading_id, 'de', 'Lies eine professionelle E-Mail-Anfrage', 'Lies eine kurze Büro-E-Mail mit Bitte um Preise, Verfügbarkeit und Lieferzeit.');

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
