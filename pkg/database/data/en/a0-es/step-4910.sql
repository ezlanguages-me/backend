-- ============================================================
-- Seed: A0 English Path – STEP 4910 – Reading – understand a conference schedule (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El registro empieza a las 9:00 en la sala A.", "p_de": "Die Anmeldung beginnt um 9:00 Uhr in Halle A.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La introducción de bienvenida es a las 9:30.", "p_de": "Die Begrüßung ist um 9:30 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ponencia principal empieza a las 11:15.", "p_de": "Der Hauptvortrag beginnt um 11:15 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El taller sobre vivienda estudiantil es en la sala C.", "p_de": "Der Workshop über studentisches Wohnen ist in Raum C.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La pausa del café dura media hora.", "p_de": "Die Kaffeepause dauert eine halbe Stunde.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La comida es en la cafetería.", "p_de": "Das Mittagessen ist in der Cafeteria.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sesión de pósteres empieza a las dos.", "p_de": "Die Postersitzung beginnt um zwei Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El panel final es en la biblioteca.", "p_de": "Die Abschlussrunde ist in der Bibliothek.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Dónde se hace el registro?", "p_de": "Wo findet die Anmeldung statt?", "s": {"type": "multiple_choice", "options": ["In Hall A", "In Room C", "In the library lobby"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la bienvenida?", "p_de": "Um wie viel Uhr ist die Begrüßung?", "s": {"type": "multiple_choice", "options": ["At 9:30", "At 9:00", "At 10:30"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el tema de la ponencia principal?", "p_de": "Was ist das Thema des Hauptvortrags?", "s": {"type": "multiple_choice", "options": ["Urban mobility", "Student visas", "Research funding"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comienza a las 11:15?", "p_de": "Was beginnt um 11:15 Uhr?", "s": {"type": "multiple_choice", "options": ["Workshop 2 on student housing", "The lunch break", "The final panel"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es la pausa del café?", "p_de": "Wo ist die Kaffeepause?", "s": {"type": "multiple_choice", "options": ["In the foyer", "In Hall B", "In Room C"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la comida?", "p_de": "Um wie viel Uhr ist das Mittagessen?", "s": {"type": "multiple_choice", "options": ["At 12:30", "At 1:30", "At 11:30"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la sesión de pósteres?", "p_de": "Wo ist die Postersitzung?", "s": {"type": "multiple_choice", "options": ["In the library lobby", "In the cafeteria", "In Hall A"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es el panel final?", "p_de": "Wo ist die Abschlussrunde?", "s": {"type": "multiple_choice", "options": ["In Hall B", "In Hall A", "In Room C"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4910 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 4910 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 4910, 'en', 'reading', 'academic', 'Learning and Cities Conference - Tuesday Schedule. Registration opens at 9:00 in Hall A. The welcome introduction starts at 9:30 in the same hall.

At 10:00, the keynote talk on urban mobility begins in Hall A. At 11:15, Workshop 2 on student housing starts in Room C. The coffee break is from 11:00 to 11:15 in the foyer.

Lunch is at 12:30 in the cafeteria. The poster session opens at 2:00 p.m. in the library lobby, and the final panel discussion begins at 4:00 p.m. in Hall B.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Programa de una conferencia', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Konferenzprogramm', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
