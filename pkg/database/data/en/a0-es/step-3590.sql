-- ============================================================
-- Seed: A0 English Path – STEP 3590 – Reading – understand a lease/rental agreement (Alojamiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El alquiler mensual es de £650.", "p_de": "Die monatliche Miete beträgt £650.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El depósito es de £325.", "p_de": "Die Kaution beträgt £325.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La renta se paga el primer día de cada mes.", "p_de": "Die Miete wird am ersten Tag jedes Monats bezahlt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La estancia mínima es de seis meses.", "p_de": "Die Mindestmietdauer beträgt sechs Monate.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La electricidad y el internet están incluidos.", "p_de": "Strom und Internet sind inklusive.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se puede fumar dentro del piso.", "p_de": "Man darf in der Wohnung rauchen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que revisar el inventario el primer día.", "p_de": "Man muss am ersten Tag die Inventarliste prüfen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Para salir del piso hay que avisar con 30 días por escrito.", "p_de": "Zum Auszug muss man 30 Tage schriftlich kündigen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué vivienda aparece en el texto?", "p_de": "Welche Wohnung steht im Text?", "s_es": {"type": "multiple_choice", "options": ["Apartment 4B", "Room 14", "House C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Apartment 4B", "Zimmer 14", "Haus C"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se paga la renta?", "p_de": "Wie zahlt man die Miete?", "s_es": {"type": "multiple_choice", "options": ["By bank transfer", "By cash only", "By card at reception"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Per Banküberweisung", "Nur bar", "Per Karte am Empfang"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué servicio está incluido?", "p_de": "Welche Leistung ist inklusive?", "s_es": {"type": "multiple_choice", "options": ["Water", "Internet", "Electricity"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wasser", "Internet", "Strom"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué gasto es separado?", "p_de": "Welche Kosten sind extra?", "s_es": {"type": "multiple_choice", "options": ["Electricity and internet", "Water and heating", "Deposit and notice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Strom und Internet", "Wasser und Heizung", "Kaution und Kündigung"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo hay que informar de problemas?", "p_de": "Wann muss man Probleme melden?", "s_es": {"type": "multiple_choice", "options": ["Within 48 hours", "After one week", "Before midnight"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Innerhalb von 48 Stunden", "Nach einer Woche", "Vor Mitternacht"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la estancia mínima?", "p_de": "Wie lange ist die Mindestmiete?", "s_es": {"type": "multiple_choice", "options": ["Six months", "Three months", "One year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sechs Monate", "Drei Monate", "Ein Jahr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no está permitido dentro del piso?", "p_de": "Was ist in der Wohnung nicht erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Smoking", "Cooking", "Studying"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Rauchen", "Kochen", "Lernen"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay que dar para irse del piso?", "p_de": "Was muss man für den Auszug geben?", "s_es": {"type": "multiple_choice", "options": ["30 days written notice", "A new key card", "Two photos"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["30 Tage schriftliche Kündigung", "Eine neue Schlüsselkarte", "Zwei Fotos"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM reading WHERE step_order = 3590 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading'
        );
        DELETE FROM reading WHERE step_order = 3590 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3590, 'en', 'reading', 'accommodation', $content$Apartment 4B, River Street. Monthly rent: £650. Deposit: £650. Pay the rent on the first day of each month by bank transfer.

Minimum stay is six months. Water is included in the rent, but electricity and internet are separate. No smoking is allowed inside the flat.

Tenants must check the inventory list on the first day and report any problem within 48 hours. To leave the flat, give 30 days notice in writing.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un contrato de alquiler sencillo', 'Lee las condiciones básicas de un alquiler: precio, depósito, pagos y normas.'),
            (v_reading_id, 'de', 'Lies einen einfachen Mietvertrag', 'Lies die Grundbedingungen einer Miete: Preis, Kaution, Zahlungen und Regeln.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
