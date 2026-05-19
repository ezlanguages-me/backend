-- ============================================================
-- Seed: A0 English Path – STEP 4940 – Reading – understand seminar materials (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "La encuesta incluye a 60 estudiantes universitarios.", "p_de": "Die Umfrage umfasst 60 Studierende.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Cuarenta estudiantes van en bicicleta al campus al menos dos veces por semana.", "p_de": "Vierzig Studierende fahren mindestens zweimal pro Woche mit dem Fahrrad zum Campus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La razón principal es el precio de los libros.", "p_de": "Der Hauptgrund ist der Preis von Büchern.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La lluvia es el problema más grande.", "p_de": "Regen ist das größte Problem.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay poco aparcamiento seguro para bicicletas cerca de la biblioteca.", "p_de": "Es gibt wenig sichere Fahrradparkplätze nahe der Bibliothek.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El seminario compara el uso de la bicicleta con el del tren.", "p_de": "Das Seminar vergleicht die Fahrradnutzung mit dem Zug.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Cada grupo debe traer una pregunta sobre los resultados.", "p_de": "Jede Gruppe soll eine Frage zu den Ergebnissen mitbringen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "También deben aportar una idea práctica para la oficina de transporte del campus.", "p_de": "Sie sollen auch eine praktische Idee für das Campus-Verkehrsbüro mitbringen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Cuántos estudiantes participaron en la encuesta?", "p_de": "Wie viele Studierende nahmen an der Umfrage teil?", "s": {"type": "multiple_choice", "options": ["60 students", "40 students", "20 students"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos van en bicicleta al menos dos veces por semana?", "p_de": "Wie viele fahren mindestens zweimal pro Woche mit dem Fahrrad?", "s": {"type": "multiple_choice", "options": ["40 students", "60 students", "15 students"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuáles son las dos razones principales?", "p_de": "Was sind die zwei Hauptgründe?", "s": {"type": "multiple_choice", "options": ["Health and cost", "Weather and music", "Food and sports"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el mayor problema?", "p_de": "Was ist das größte Problem?", "s": {"type": "multiple_choice", "options": ["Rain", "Homework", "Noise"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde falta aparcamiento seguro?", "p_de": "Wo fehlt ein sicherer Parkplatz?", "s": {"type": "multiple_choice", "options": ["Near the library", "At the train station", "Behind the cafeteria"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué compara el seminario?", "p_de": "Was vergleicht das Seminar?", "s": {"type": "multiple_choice", "options": ["Bicycle use and bus use", "Bicycle use and hotel prices", "Bus use and exam grades"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe traer cada grupo?", "p_de": "Was soll jede Gruppe mitbringen?", "s": {"type": "multiple_choice", "options": ["One question and one practical idea", "One poster and one lunch ticket", "One map and one bicycle pump"], "answer": 0}}'::jsonb,
        '{"p": "¿Para quién es la idea práctica?", "p_de": "Für wen ist die praktische Idee?", "s": {"type": "multiple_choice", "options": ["The campus transport office", "The city museum", "The hotel desk"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 4940 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 4940 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 4940, 'en', 'reading', 'academic', 'Seminar handout: Student Bicycle Survey. The class survey included 60 university students. Forty students said they ride a bicycle to campus at least twice a week.

The two main reasons were health and cost. The biggest problem was rain, and the second problem was a lack of safe bike parking near the library.

In today''s seminar, students compare bicycle use with bus use. Each group should bring one question about the survey results and one practical idea for the campus transport office.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Material de seminario sobre transporte en bicicleta', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Seminarunterlagen zum Radverkehr', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
