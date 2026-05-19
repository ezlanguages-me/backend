-- ============================================================
-- Seed: A0 English Path – STEP 3510 – Reading – understand job/work descriptions (Servicios Laborales)
-- Source language: Spanish
-- ============================================================

    DO $seed$
    DECLARE
        v_path_id UUID;
        v_reading_id UUID;
        v_ex_id UUID;
        ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "El puesto es a tiempo parcial.", "p_de": "Die Stelle ist in Teilzeit.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El horario es de lunes a viernes de 7 AM a 12 PM.", "p_de": "Die Arbeitszeit ist Montag bis Freitag von 7 Uhr bis 12 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empresa pide inglés perfecto.", "p_de": "Die Firma verlangt perfektes Englisch.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La formación empieza en la primera semana.", "p_de": "Die Einarbeitung beginnt in der ersten Woche.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empresa está cerca de Green Park station.", "p_de": "Die Firma liegt in der Nähe von Green Park station.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El descanso es a las 9 AM.", "p_de": "Die Pause ist um 9 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que enviar un email corto y el CV antes del viernes.", "p_de": "Man soll vor Freitag eine kurze E-Mail und den Lebenslauf schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las entrevistas son el próximo mes.", "p_de": "Die Vorstellungsgespräche sind nächsten Monat.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué puesto ofrece Sunrise Services?", "p_de": "Welche Stelle bietet Sunrise Services an?", "s_es": {"type": "multiple_choice", "options": ["A warehouse assistant", "A bus driver", "A hotel cook"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Lagerassistenz", "Einen Busfahrer", "Einen Hotelkoch"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de inglés necesitan los candidatos?", "p_de": "Welches Englischniveau brauchen die Bewerber?", "s_es": {"type": "multiple_choice", "options": ["Basic English", "Perfect English", "No English"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Einfaches Englisch", "Perfektes Englisch", "Kein Englisch"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué deben llevar los candidatos?", "p_de": "Was sollen die Bewerber mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Safety shoes", "A uniform", "A passport photo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sicherheitsschuhe", "Eine Uniform", "Ein Passfoto"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pasa cada mañana?", "p_de": "Was passiert jeden Morgen?", "s_es": {"type": "multiple_choice", "options": ["A short team meeting", "A long exam", "A delivery to the station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein kurzes Teamtreffen", "Eine lange Prüfung", "Eine Lieferung zum Bahnhof"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es el descanso?", "p_de": "Um wie viel Uhr ist die Pause?", "s_es": {"type": "multiple_choice", "options": ["10 AM", "9 AM", "12 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Uhr", "9 Uhr", "12 Uhr"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se solicita el puesto?", "p_de": "Wie bewirbt man sich?", "s_es": {"type": "multiple_choice", "options": ["By sending a short email and a CV", "By calling the station", "By visiting on Sunday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einer kurzen E-Mail und einem Lebenslauf", "Mit einem Anruf beim Bahnhof", "Mit einem Besuch am Sonntag"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la empresa?", "p_de": "Wo ist die Firma?", "s_es": {"type": "multiple_choice", "options": ["Near Green Park station", "Inside the airport", "Next to the beach"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der Nähe von Green Park station", "Im Flughafen", "Neben dem Strand"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo son las entrevistas?", "p_de": "Wann sind die Gespräche?", "s_es": {"type": "multiple_choice", "options": ["Next Tuesday", "This evening", "Next month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nächsten Dienstag", "Heute Abend", "Nächsten Monat"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
        DELETE FROM exercise WHERE target_uuid IN (
            SELECT uuid FROM reading
            WHERE step_order = 3510 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading'
        );
        DELETE FROM reading WHERE step_order = 3510 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'reading';

        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (v_path_id, 3510, 'en', 'reading', 'professional', $content$Sunrise Services is looking for a part-time warehouse assistant. Hours are Monday to Friday, from 7 AM to 12 PM. Duties include preparing boxes, checking labels, and keeping the work area clean.

Applicants need basic English, safety shoes, and simple computer skills. Experience is helpful, but it is not necessary. The manager gives training in the first week.

The company is near Green Park station. Staff start every morning with a short team meeting. There is a 20-minute break at 10 AM.

To apply, send a short email and your CV to jobs@sunriseservices.com before Friday. Interviews are next Tuesday.$content$)
        RETURNING uuid INTO v_reading_id;

        INSERT INTO reading_translation (reading_uuid, language, title, description)
        VALUES
            (v_reading_id, 'es', 'Lee descripciones de trabajos', 'Lee un anuncio de empleo sencillo con horario, tareas y requisitos.'),
            (v_reading_id, 'de', 'Lies Stellen- und Arbeitsbeschreibungen', 'Lies eine einfache Stellenanzeige mit Arbeitszeit, Aufgaben und Anforderungen.');

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
