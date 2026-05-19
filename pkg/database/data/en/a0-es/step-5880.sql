-- ============================================================
-- Seed: A0 English Path – STEP 5880 – Reading – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Se debe asistir al menos al 80% de las clases.", "de": "Man muss mindestens 80 % der Klassen besuchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si falta a una clase, hay que escribir al tutor el mismo día.", "de": "Wenn man eine Stunde verpasst, soll man dem Tutor am selben Tag schreiben.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los plazos aparecen en la página del curso.", "de": "Die Fristen stehen auf der Kursseite.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La prórroga se pide después de la fecha límite.", "de": "Die Verlängerung beantragt man nach der Frist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Si está enfermo, puede mandar una nota médica.", "de": "Wenn man krank ist, kann man eine ärztliche Notiz schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El aula de apoyo está en la planta baja.", "de": "Der Lernhilferaum ist im Erdgeschoss.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Puede reservar una reunión corta con el tutor.", "de": "Man kann ein kurzes Treffen mit dem Tutor buchen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El manual habla de horas de oficina.", "de": "Das Handbuch spricht über Sprechzeiten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Cuánta asistencia se exige?", "de": "Wie viel Anwesenheit wird verlangt?", "s_es": {"type": "multiple_choice", "options": ["80%", "50%", "100%"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["80 %", "50 %", "100 %"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo debe escribir al tutor si falta?", "de": "Wann soll man dem Tutor schreiben, wenn man fehlt?", "s_es": {"type": "multiple_choice", "options": ["The same day", "The next month", "After the exam"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am selben Tag", "Im nächsten Monat", "Nach der Prüfung"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se muestran los plazos?", "de": "Wo werden die Fristen angezeigt?", "s_es": {"type": "multiple_choice", "options": ["On the course page", "On the bus stop", "In the cafeteria menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf der Kursseite", "An der Bushaltestelle", "Im Mensamenü"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuándo se pide la prórroga?", "de": "Wann beantragt man die Verlängerung?", "s_es": {"type": "multiple_choice", "options": ["Before the deadline", "After the deadline", "Only in summer"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor der Frist", "Nach der Frist", "Nur im Sommer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe llevar si está enfermo?", "de": "Was soll man mitbringen, wenn man krank ist?", "s_es": {"type": "multiple_choice", "options": ["A doctors note", "A library card", "A train ticket"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine ärztliche Notiz", "Einen Bibliotheksausweis", "Ein Zugticket"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué planta está la sala de apoyo?", "de": "In welchem Stock ist der Unterstützungsraum?", "s_es": {"type": "multiple_choice", "options": ["First floor", "Ground floor", "Third floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Erster Stock", "Erdgeschoss", "Dritter Stock"], "answer": 0}}'::jsonb,
        '{"es": "¿Con quién puede reservar una reunión corta?", "de": "Mit wem kann man ein kurzes Treffen buchen?", "s_es": {"type": "multiple_choice", "options": ["Tutor", "Bus driver", "Chef"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Tutor", "Busfahrer", "Chef"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de apoyo ofrece el manual?", "de": "Welche Art von Unterstützung nennt das Handbuch?", "s_es": {"type": "multiple_choice", "options": ["Study support", "Car repair", "Gym training"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Lernunterstützung", "Autoreparatur", "Fitnesstraining"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5880 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5880 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5880, 'en', 'reading', 'Gestión del Estudio y Trámites', $reading$
Student Handbook Section 4: Attendance, deadlines, and support.

You must attend at least 80% of your classes. If you miss a class, email your tutor on the same day.

Coursework deadlines are shown on the course page. If you need more time, ask for an extension before the deadline.

If you are ill, bring a note from a doctor or email the student office.

For extra help, visit the study support room on the first floor or book a short meeting with your tutor during office hours.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee la sección del manual del estudiante', 'Lee un apartado del manual con asistencia, plazos y apoyo académico.'),
        (v_reading_id, 'de', 'Lies den Abschnitt im Studierendenhandbuch', 'Lies einen Abschnitt des Handbuchs zu Anwesenheit, Fristen und akademischer Unterstützung.');

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

