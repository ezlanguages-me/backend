-- ============================================================
-- Seed: A0 English Path – STEP 5390 – Reading – read a conference programme (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El panel sobre vivienda estudiantil empieza a las nueve en la sala B.", "p_de": "Das Panel über studentisches Wohnen beginnt um neun Uhr in Halle B.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El taller de toma de notas digital es a las diez y media en la sala D.", "p_de": "Der Workshop zu digitalem Mitschreiben ist um halb elf in Raum D.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ruta de pósteres empieza después de comer.", "p_de": "Der Poster-Rundgang beginnt nach dem Mittagessen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La comida es a las 12:45 en la cafetería principal.", "p_de": "Das Mittagessen ist um 12:45 in der Hauptcafeteria.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La keynote sobre aprendizaje de lenguas es a las dos en la sala A.", "p_de": "Die Keynote zum Sprachenlernen ist um zwei Uhr in Halle A.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El debate estructurado es en la sala B.", "p_de": "Die strukturierte Debatte ist in Halle B.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La sesión de cierre comienza a las cinco.", "p_de": "Die Abschlusssitzung beginnt um fünf Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El programa es del segundo día de la conferencia.", "p_de": "Das Programm gehört zum zweiten Konferenztag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué empieza a las 9:00?", "p_de": "Was beginnt um 9:00 Uhr?", "s": {"type": "multiple_choice", "options": ["The student housing panel", "The keynote on language learning", "The closing session"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es el taller sobre notas digitales?", "p_de": "Wo ist der Workshop zum digitalen Mitschreiben?", "s": {"type": "multiple_choice", "options": ["In Room D", "In Hall A", "In the corridor"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empieza la ruta de pósteres?", "p_de": "Wann beginnt der Poster-Rundgang?", "s": {"type": "multiple_choice", "options": ["At 12:00", "At 2:00", "At 5:00"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se sirve la comida?", "p_de": "Wo wird das Mittagessen serviert?", "s": {"type": "multiple_choice", "options": ["In the main cafeteria", "In Hall B", "In Room C"], "answer": 0}}'::jsonb,
        '{"p": "¿Sobre qué trata la keynote de las 2:00?", "p_de": "Worum geht es in der Keynote um 2:00?", "s": {"type": "multiple_choice", "options": ["Language learning", "Professional phone calls", "Water sensors"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde es el debate estructurado?", "p_de": "Wo ist die strukturierte Debatte?", "s": {"type": "multiple_choice", "options": ["In Room C", "In Hall B", "In Room D"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es la sesión de cierre?", "p_de": "Wann ist die Abschlusssitzung?", "s": {"type": "multiple_choice", "options": ["At 5:00", "At 3:30", "At 10:30"], "answer": 0}}'::jsonb,
        '{"p": "¿De qué día es el programa?", "p_de": "Von welchem Tag ist das Programm?", "s": {"type": "multiple_choice", "options": ["Day 2", "Day 1", "The final week"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5390 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5390 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5390, 'en', 'reading', 'academic', 'Conference programme - Day 2. At 9:00 a.m., the panel on student housing begins in Hall B. At 10:30, there is a workshop on digital note-taking in Room D.

The poster walk starts at 12:00 in the central corridor, and lunch is at 12:45 in the main cafeteria. At 2:00 p.m., a keynote on language learning opens in Hall A.

A structured debate begins at 3:30 in Room C, and the closing session starts at 5:00 in Hall B.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Programa de conferencia', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Konferenzprogramm', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
