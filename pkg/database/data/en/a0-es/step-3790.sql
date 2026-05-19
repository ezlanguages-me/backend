-- ============================================================
-- Seed: A0 English Path – STEP 3790 – Reading – understand a concert/show program (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Las puertas abren a las 7 PM.", "p_de": "Die Türen öffnen um 19 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El espectáculo empieza a las 7 PM.", "p_de": "Die Show beginnt um 19 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El asiento está en Section B, Row 12, Seat 6.", "p_de": "Der Platz ist in Section B, Row 12, Seat 6.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pausa dura 20 minutos.", "p_de": "Die Pause dauert 20 Minuten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se permiten bolsas grandes.", "p_de": "Große Taschen sind erlaubt.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La tienda de merchandising está en la primera planta.", "p_de": "Der Merchandising-Stand ist im ersten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El último tranvía sale a las 11:15 PM.", "p_de": "Die letzte Straßenbahn fährt um 23:15 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hay ninguna pausa durante el concierto.", "p_de": "Es gibt keine Pause während des Konzerts.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿A qué hora abren las puertas?", "p_de": "Um wie viel Uhr öffnen die Türen?", "s_es": {"type": "multiple_choice", "options": ["7 PM", "8 PM", "11:15 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["19 Uhr", "20 Uhr", "23:15 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora empieza el espectáculo?", "p_de": "Um wie viel Uhr beginnt die Show?", "s_es": {"type": "multiple_choice", "options": ["8 PM", "7 PM", "9 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 Uhr", "19 Uhr", "21 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué sección está el asiento?", "p_de": "In welchem Bereich ist der Platz?", "s_es": {"type": "multiple_choice", "options": ["Section B", "Section A", "Section C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Section B", "Section A", "Section C"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto dura la pausa?", "p_de": "Wie lange dauert die Pause?", "s_es": {"type": "multiple_choice", "options": ["20 minutes", "10 minutes", "30 minutes"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["20 Minuten", "10 Minuten", "30 Minuten"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no se permite?", "p_de": "Was ist nicht erlaubt?", "s_es": {"type": "multiple_choice", "options": ["Large bags", "Tickets", "Coats"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Große Taschen", "Tickets", "Mäntel"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está el merchandise desk?", "p_de": "Wo ist der Merchandising-Stand?", "s_es": {"type": "multiple_choice", "options": ["On the first floor", "At the exit", "In Row 12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im ersten Stock", "Am Ausgang", "In Reihe 12"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué transporte sale después del concierto?", "p_de": "Welches Verkehrsmittel fährt nach dem Konzert?", "s_es": {"type": "multiple_choice", "options": ["The last tram", "The airport bus", "The city ferry"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die letzte Straßenbahn", "Der Flughafenbus", "Die Stadtfähre"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora sale ese transporte?", "p_de": "Um wie viel Uhr fährt dieses Verkehrsmittel?", "s_es": {"type": "multiple_choice", "options": ["11:15 PM", "10:15 PM", "12 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["23:15 Uhr", "22:15 Uhr", "0 Uhr"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3790 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3790 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3790, 'en', 'reading', 'tourism', $content$River Hall Concert Program. Doors open at 7 PM. The show starts at 8 PM. Your seat is Section B, Row 12, Seat 6.

There is a 20-minute interval after the first part. Large bags are not allowed. The merchandise desk is on the first floor.

After the concert, the last tram leaves at 11:15 PM.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee el programa de un concierto o espectáculo', 'Lee un programa con puertas, inicio, asientos, pausa y transporte de regreso.'),
            (v_reading_id, 'de', 'Lies das Programm eines Konzerts oder einer Show', 'Lies ein Programm mit Einlass, Beginn, Sitzplätzen, Pause und Rückfahrt.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
