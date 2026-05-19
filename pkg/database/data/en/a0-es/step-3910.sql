-- ============================================================
-- Seed: A0 English Path – STEP 3910 – Reading – read a work report (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El informe es el Service Report 88.", "p_de": "Der Bericht ist Service Report 88.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La técnica se llama Lea Martin.", "p_de": "Die Technikerin heißt Lea Martin.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El lugar es South Clinic.", "p_de": "Der Ort ist South Clinic.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Lea llegó a las 9 AM.", "p_de": "Lea kam um 9 Uhr an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se cambiaron dos filtros de aire.", "p_de": "Es wurden zwei Luftfilter ausgetauscht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No se encontró ningún problema.", "p_de": "Es wurde kein Problem gefunden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La recomendación es una segunda visita el viernes.", "p_de": "Die Empfehlung ist ein zweiter Besuch am Freitag.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La firma del cliente fue a las 10:15 AM.", "p_de": "Die Unterschrift des Kunden war um 10:15 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué número tiene el informe?", "p_de": "Welche Nummer hat der Bericht?", "s_es": {"type": "multiple_choice", "options": ["88", "8", "808"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["88", "8", "808"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién hizo el trabajo?", "p_de": "Wer hat die Arbeit gemacht?", "s_es": {"type": "multiple_choice", "options": ["Lea Martin", "Sara Klein", "Tom Reed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lea Martin", "Sara Klein", "Tom Reed"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde fue el servicio?", "p_de": "Wo fand der Service statt?", "s_es": {"type": "multiple_choice", "options": ["At North Clinic", "At City Hub", "At River Office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der North Clinic", "Im City Hub", "Im River Office"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se cambió?", "p_de": "Was wurde ausgetauscht?", "s_es": {"type": "multiple_choice", "options": ["Two air filters", "Two windows", "Two projectors"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Luftfilter", "Zwei Fenster", "Zwei Projektoren"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema se encontró?", "p_de": "Welches Problem wurde gefunden?", "s_es": {"type": "multiple_choice", "options": ["A small water leak under the rear pipe", "A broken front door", "No electricity in the kitchen"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kleines Wasserleck unter dem hinteren Rohr", "Eine kaputte Eingangstür", "Kein Strom in der Küche"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué acción temporal hizo Lea?", "p_de": "Welche vorläufige Maßnahme machte Lea?", "s_es": {"type": "multiple_choice", "options": ["She placed a tray under the pipe", "She closed the clinic", "She ordered a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie stellte eine Schale unter das Rohr", "Sie schloss die Klinik", "Sie bestellte ein Taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo recomienda volver?", "p_de": "Wann empfiehlt sie zurückzukommen?", "s_es": {"type": "multiple_choice", "options": ["On Friday", "On Monday", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Freitag", "Am Montag", "Nächsten Monat"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo llegó la firma del cliente?", "p_de": "Wann kam die Unterschrift des Kunden?", "s_es": {"type": "multiple_choice", "options": ["At 10:15 AM", "At 9 AM", "At 4 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Um 10:15 Uhr", "Um 9 Uhr", "Um 16 Uhr"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3910 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3910 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3910, 'en', 'reading', 'professional', $content$Service Report 88. Date: Tuesday, 4 June. Technician: Lea Martin. Site: North Clinic.

Arrival time: 9 AM. Work completed: replaced two air filters and tested the cooling unit. The unit started normally after the change.

Issue found: a small water leak under the rear pipe. Temporary action: placed a tray under the pipe and informed the site manager. Recommendation: second visit on Friday to replace the pipe. Client signature received at 10:15 AM.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee un informe de trabajo', 'Lee un informe con hora, trabajo realizado, problema encontrado y recomendación.'),
            (v_reading_id, 'de', 'Lies einen Arbeitsbericht', 'Lies einen Bericht mit Zeit, erledigter Arbeit, gefundenem Problem und Empfehlung.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
