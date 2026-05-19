-- ============================================================
-- Seed: A0 English Path – STEP 3750 – Reading – understand event programs (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El street parade es el sábado a las 11 AM.", "p_de": "Die street parade ist am Samstag um 11 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El food market termina a las 5 PM.", "p_de": "Der food market endet um 17 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El taller de arte infantil es en Hall A a las 2 PM.", "p_de": "Der Kinderkunst-Workshop ist um 14 Uhr in Hall A.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La open-air movie es el domingo a las 9 PM.", "p_de": "Die open-air movie ist am Sonntag um 21 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las entradas cuestan £8.", "p_de": "Die Tickets kosten £8.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si llueve, la película pasa a Hall B.", "p_de": "Wenn es regnet, zieht der Film in Hall B um.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La información abre cada día a las 10 AM.", "p_de": "Die Information öffnet jeden Tag um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta llevar chaqueta para la película.", "p_de": "Man braucht keine Jacke für den Film.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde es el street parade?", "p_de": "Wo ist die street parade?", "s_es": {"type": "multiple_choice", "options": ["On King Avenue", "In Hall A", "In Riverside Park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der King Avenue", "In Hall A", "Im Riverside Park"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora está el food market?", "p_de": "Bis wann ist der food market geöffnet?", "s_es": {"type": "multiple_choice", "options": ["6 PM", "5 PM", "9 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 Uhr", "17 Uhr", "21 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué actividad es a las 2 PM?", "p_de": "Welche Aktivität ist um 14 Uhr?", "s_es": {"type": "multiple_choice", "options": ["The childrens art workshop", "The movie", "The parade"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der Kinderkunst-Workshop", "Der Film", "Die Parade"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es la movie al aire libre?", "p_de": "Wo ist der Film im Freien?", "s_es": {"type": "multiple_choice", "options": ["In Riverside Park", "In Hall A", "At the tourist desk"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Riverside Park", "In Hall A", "Am Infostand"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto cuestan las entradas de la película?", "p_de": "Wie viel kosten die Filmtickets?", "s_es": {"type": "multiple_choice", "options": ["£6", "£8", "£4"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£6", "£8", "£4"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta qué hora se pueden comprar en la Tourist Office?", "p_de": "Bis wann kann man sie im Tourist Office kaufen?", "s_es": {"type": "multiple_choice", "options": ["Until 7 PM", "Until 9 PM", "Until 3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis 19 Uhr", "Bis 21 Uhr", "Bis 15 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es la película si llueve?", "p_de": "Wo ist der Film bei Regen?", "s_es": {"type": "multiple_choice", "options": ["In Hall B", "In Hall A", "At Central Square"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In Hall B", "In Hall A", "Am Central Square"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora abre la information desk?", "p_de": "Um wie viel Uhr öffnet der Infostand?", "s_es": {"type": "multiple_choice", "options": ["10 AM", "9 AM", "11 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Uhr", "9 Uhr", "11 Uhr"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 3750 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading');
        DELETE FROM reading WHERE step_order = 3750 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3750, 'en', 'reading', 'tourism', $content$Summer Weekend Program. Saturday: street parade at 11 AM on King Avenue. Food market from 12 PM to 6 PM in Central Square. Children's art workshop at 2 PM in Hall A.

Sunday: open-air movie at 9 PM in Riverside Park. Bring a jacket. Tickets are £6 online or at the Tourist Office until 7 PM.

If it rains, the movie moves to Hall B. The information desk opens every day at 10 AM.$content$)
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee programas de eventos', 'Lee un programa de fin de semana con actividades, horarios y lugar alternativo si llueve.'),
            (v_reading_id, 'de', 'Lies Veranstaltungsprogramme', 'Lies ein Wochenendprogramm mit Aktivitäten, Zeiten und einem Ausweichort bei Regen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
            VALUES
                (v_ex_id, 'es', ex->>'p', ex->'s_es'),
                (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
        END LOOP;
    END;
    $seed$;
