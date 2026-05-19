-- ============================================================
-- Seed: A0 English Path – STEP 4260 – Reading – read a technical specifications document (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El documento describe las especificaciones de un sistema de climatización.", "p_de": "Das Dokument beschreibt die Spezifikationen einer Klimaanlage.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La potencia del sistema es de 5 kW.", "p_de": "Die Leistung des Systems beträgt 5 kW.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El sistema requiere una toma de corriente de 230V.", "p_de": "Das System benötigt eine Steckdose von 230V.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El mantenimiento debe realizarse dos veces al año.", "p_de": "Die Wartung muss zweimal pro Jahr durchgeführt werden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La instalación la puede hacer cualquier electricista.", "p_de": "Die Installation kann jeder Elektriker durchführen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El nivel de ruido máximo es de 45 dB.", "p_de": "Der maximale Geräuschpegel beträgt 45 dB.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El sistema puede enfriar y calentar.", "p_de": "Das System kann kühlen und heizen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El documento incluye instrucciones de emergencia.", "p_de": "Das Dokument enthält Notfallanweisungen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué tipo de sistema describe el documento?", "p_de": "Welche Art von System beschreibt das Dokument?", "s_es": {"type": "multiple_choice", "options": ["Air conditioning system", "Fire suppression system", "Water purification system"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Klimaanlage", "Feuerlöschanlage", "Wasserreinigungsanlage"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es la potencia del sistema?", "p_de": "Was ist die Leistung des Systems?", "s_es": {"type": "multiple_choice", "options": ["12 kW", "5 kW", "8 kW"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["12 kW", "5 kW", "8 kW"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué voltaje necesita el sistema?", "p_de": "Welche Spannung benötigt das System?", "s_es": {"type": "multiple_choice", "options": ["230V", "110V", "400V"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["230V", "110V", "400V"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia debe hacerse el mantenimiento?", "p_de": "Wie oft muss die Wartung durchgeführt werden?", "s_es": {"type": "multiple_choice", "options": ["Twice a year", "Once a year", "Monthly"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweimal im Jahr", "Einmal im Jahr", "Monatlich"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién puede instalar el sistema?", "p_de": "Wer kann das System installieren?", "s_es": {"type": "multiple_choice", "options": ["A certified technician only", "Any electrician", "The office manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nur ein zertifizierter Techniker", "Jeder Elektriker", "Der Büro-Manager"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el nivel de ruido máximo?", "p_de": "Was ist der maximale Geräuschpegel?", "s_es": {"type": "multiple_choice", "options": ["45 dB", "60 dB", "30 dB"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["45 dB", "60 dB", "30 dB"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué funciones tiene el sistema?", "p_de": "Welche Funktionen hat das System?", "s_es": {"type": "multiple_choice", "options": ["Cooling and heating", "Cooling only", "Heating only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Kühlen und Heizen", "Nur Kühlen", "Nur Heizen"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué tipo de documento se trata?", "p_de": "Um welche Art von Dokument handelt es sich?", "s_es": {"type": "multiple_choice", "options": ["A technical specifications sheet", "A user handbook", "A safety report"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein technisches Datenblatt", "Ein Benutzerhandbuch", "Ein Sicherheitsbericht"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4260 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 4260 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 4260, 'en', 'reading', 'professional', $content$TECHNICAL SPECIFICATIONS – Model AC-12 Air Conditioning System

Power output: 12 kW
Power supply: 230V / 50Hz
Noise level (max): 45 dB
Functions: Cooling and heating

Installation must be carried out by a certified technician only. Maintenance is required twice a year.

For optimum performance, keep air filters clean and check refrigerant levels at each service.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un documento de especificaciones técnicas', 'Lee una ficha técnica de un sistema de climatización con potencia, voltaje, ruido y mantenimiento.'),
            (v_reading_id, 'de', 'Lies ein technisches Datenblatt', 'Lies ein technisches Datenblatt einer Klimaanlage mit Leistung, Spannung, Geräusch und Wartung.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
