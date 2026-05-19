-- ============================================================
-- Seed: A0 English Path – STEP 7990 – Reading – understand a post-event debrief (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El evento se llama Student Seminar Day.", "de": "Die Veranstaltung heißt Student Seminar Day.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La fecha es Thursday.", "de": "Das Datum ist Thursday.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Uno de los problemas es que la última sala estaba demasiado caliente.", "de": "Ein Problem ist, dass der letzte Raum zu warm war.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La decisión es seguir en la sala pequeña.", "de": "Die Entscheidung ist, im kleinen Raum zu bleiben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La nueva sala es la library hall.", "de": "Der neue Raum ist die library hall.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Van a mandar las diapositivas el viernes.", "de": "Sie werden die Folien am Freitag senden.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Piden diez ayudantes estudiantes.", "de": "Sie bitten um zehn studentische Helfer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Las charlas cortas funcionaron bien.", "de": "Die kurzen Vorträge haben gut funktioniert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cómo se llama el evento?", "de": "Wie heißt die Veranstaltung?", "s_es": {"type": "multiple_choice", "options": ["Student Seminar Day", "Teacher Lunch Time", "Library Tour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Student Seminar Day", "Teacher Lunch Time", "Library Tour"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué funcionó bien?", "de": "Was hat gut funktioniert?", "s_es": {"type": "multiple_choice", "options": ["Clear signs and short talks", "Heavy rain and traffic", "A late bus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Klare Schilder und kurze Vorträge", "Starker Regen und Verkehr", "Ein später Bus"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál fue un problema?", "de": "Was war ein Problem?", "s_es": {"type": "multiple_choice", "options": ["The last room was too warm", "The food was too cold", "The museum was closed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der letzte Raum war zu warm", "Das Essen war zu kalt", "Das Museum war geschlossen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dos opciones aparecen para el próximo mes?", "de": "Welche zwei Optionen gibt es für den nächsten Monat?", "s_es": {"type": "multiple_choice", "options": ["Use the same small room or move to the library hall", "Cancel the event or travel abroad", "Paint the walls or buy a bus"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Den gleichen kleinen Raum nutzen oder in die Bibliothekshalle umziehen", "Die Veranstaltung absagen oder ins Ausland reisen", "Die Wände streichen oder einen Bus kaufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la decisión final?", "de": "Was ist die endgültige Entscheidung?", "s_es": {"type": "multiple_choice", "options": ["Move to the library hall", "Stay in the small room", "Stop all seminars"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In die Bibliothekshalle umziehen", "Im kleinen Raum bleiben", "Alle Seminare beenden"], "answer": 0}}'::jsonb,
        '{"es": "¿Por qué eligen la library hall?", "de": "Warum wählen sie die library hall?", "s_es": {"type": "multiple_choice", "options": ["It is bigger and cooler", "It is darker and quieter", "It is next to the beach"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie ist größer und kühler", "Sie ist dunkler und ruhiger", "Sie ist neben dem Strand"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo van a mandar las diapositivas?", "de": "Wann werden sie die Folien senden?", "s_es": {"type": "multiple_choice", "options": ["On Friday", "On Monday night", "Next year"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Freitag", "Am Montagabend", "Nächstes Jahr"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuántos ayudantes estudiantes van a pedir?", "de": "Wie viele studentische Helfer werden sie anfragen?", "s_es": {"type": "multiple_choice", "options": ["Two", "Ten", "Zero"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei", "Zehn", "Null"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 7990 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 7990 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7990, 'en', 'reading', 'academic', 'Post-Event Debrief Memo\n\nEvent: Student Seminar Day
Date: Thursday
What worked well: clear signs, friendly volunteers, short talks, and water at the door.
Problem: the last room was too warm and one speaker started late.
Two options for next month: use the same small room or move to the library hall.
Decision: move to the library hall because it is bigger and cooler.
Actions: send slides on Friday, book the hall, and ask two student helpers.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Entiende un informe posterior al evento', 'Lee un breve informe de evaluación después de un seminario y reconoce problemas, opciones y decisiones.'),
        (v_reading_id, 'de', 'Verstehe ein Nachbereitungsprotokoll', 'Lies eine kurze Nachbesprechung nach einem Seminar und erkenne Probleme, Optionen und Entscheidungen.');

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
