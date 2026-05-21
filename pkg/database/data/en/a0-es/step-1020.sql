-- ============================================================
-- Seed: A0 English Path – STEP 1020 – Reading – read basic details of arrangements such as lecture, class and exam times, dates and room numbers from classroom boards or notice boards (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La clase English 1 es el lunes 7 de octubre a las 9 AM en el aula 12.", "de": "Der Kurs English 1 ist am Montag, dem 7. Oktober, um 9 Uhr in Raum 12.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes deben llegar a las 8:55 con la tarjeta de estudiante.", "de": "Die Studierenden sollen um 8:55 mit dem Studentenausweis kommen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La clase de pronunciación es el martes en el laboratorio 3.", "de": "Der Aussprachekurs ist am Dienstag in Labor 3.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El grupo B se sienta cerca de la puerta.", "de": "Gruppe B sitzt in der Nähe der Tür.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El test corto de gramática es el viernes a las 10 AM.", "de": "Der kurze Grammatiktest ist am Freitag um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Para el test se puede escribir con bolígrafo azul o negro.", "de": "Für den Test darf man mit blauem oder schwarzem Stift schreiben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La mesa de ayuda para el examen está en la oficina 2.", "de": "Die Hilfe für die Prüfung ist in Büro 2.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La lista para la mesa de ayuda está junto a la ventana.", "de": "Die Liste für die Sprechzeit hängt neben dem Fenster.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿En qué aula es la clase English 1?", "de": "In welchem Raum ist der Kurs English 1?", "s_es": {"type": "multiple_choice", "options": ["Room 12", "Room 21", "Lab 2"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum 12", "Raum 21", "Labor 2"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora empieza la clase de pronunciación?", "de": "Um wie viel Uhr beginnt der Aussprachekurs?", "s_es": {"type": "multiple_choice", "options": ["9 AM", "1 PM", "11 AM"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["9 Uhr", "13 Uhr", "11 Uhr"], "answer": 2}}'::jsonb,
        '{"es": "¿Dónde se sienta el grupo A?", "de": "Wo sitzt Gruppe A?", "s_es": {"type": "multiple_choice", "options": ["Near the stairs", "Near the windows", "Near the board"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["In der Nähe der Treppe", "In der Nähe der Fenster", "In der Nähe der Tafel"], "answer": 1}}'::jsonb,
        '{"es": "¿Cuándo es el test corto?", "de": "Wann ist der kurze Test?", "s_es": {"type": "multiple_choice", "options": ["Friday, 11 October", "Wednesday, 9 October", "Monday, 7 October"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Freitag, 11. Oktober", "Mittwoch, 9. Oktober", "Montag, 7. Oktober"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué color de bolígrafo usan los estudiantes en el test?", "de": "Welche Stiftfarbe benutzen die Studierenden im Test?", "s_es": {"type": "multiple_choice", "options": ["Blue", "Black", "Red"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Blau", "Schwarz", "Rot"], "answer": 1}}'::jsonb,
        '{"es": "¿Dónde está la mesa de ayuda para el examen?", "de": "Wo ist die Hilfe für die Prüfung?", "s_es": {"type": "multiple_choice", "options": ["Office 2", "Room 8", "Lab 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Büro 2", "Raum 8", "Labor 3"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hacen los estudiantes antes de entrar a la mesa de ayuda?", "de": "Was machen die Studierenden vor der Sprechzeit?", "s_es": {"type": "multiple_choice", "options": ["Show a blue notebook", "Buy a ticket", "Write their name on the list"], "answer": 2}, "s_de": {"type": "multiple_choice", "options": ["Ein blaues Heft zeigen", "Ein Ticket kaufen", "Ihren Namen auf die Liste schreiben"], "answer": 2}}'::jsonb,
        '{"es": "¿Cuánto tiempo está abierta la mesa de ayuda los viernes?", "de": "Wie lange ist die Sprechzeit freitags offen?", "s_es": {"type": "multiple_choice", "options": ["Two hours", "One hour", "Thirty minutes"], "answer": 1}, "s_de": {"type": "multiple_choice", "options": ["Zwei Stunden", "Eine Stunde", "Dreißig Minuten"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1020 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1020 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1020, 'en', 'reading', 'academic', 'Main Building Notice Board\n\nEnglish 1 lecture: Monday, 7 October, 9 AM, Room 12.\nPlease arrive at 8:55. Bring your student card. Do not be late. The door closes at 9 AM.\n\nPronunciation class: Wednesday, 9 October, 11 AM, Lab 3.\nThis class is on Wednesday, not Tuesday. Group A sits near the windows. Group B sits near the door. Please sit in the correct place.\n\nShort grammar test: Friday, 11 October, 10 AM, Room 8.\nStudents use rows A and B. Write all your answers in black pen. Do not use a blue pen or a pencil. Only black pen is allowed.\n\nExam help desk: Office 2. Open every Friday from 1 PM to 2 PM. The help desk is open for one hour each week.\nWrite your name on the list before you come in. The list is next to the office door. It is not next to the window.\n\nPlease read all notices carefully before class.')RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES
        (v_reading_id, 'es', 'Fechas y aulas en el tablón'), (v_reading_id, 'de', 'Daten und Räume am schwarzen Brett');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
