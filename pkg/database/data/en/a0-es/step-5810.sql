-- ============================================================
-- Seed: A0 English Path – STEP 5810 – Reading – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "Los formularios de matrícula están en la oficina de estudiantes y en la web.", "de": "Die Einschreibeformulare sind im Studierendenbüro und auf der Webseite.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Hay que escribir en minúsculas.", "de": "Man soll in Kleinbuchstaben schreiben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Se necesita una foto de pasaporte.", "de": "Ein Passfoto ist nötig.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La tasa de inscripción es de £15.", "de": "Die Einschreibegebühr beträgt 15 Pfund.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede entregar el formulario después de las 5 PM.", "de": "Man kann das Formular nach 17 Uhr abgeben.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hace falta una prueba de dirección.", "de": "Ein Adressnachweis ist erforderlich.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina de estudiantes abre de 9 AM a 4 PM.", "de": "Das Studierendenbüro ist von 9 bis 16 Uhr geöffnet.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Se puede enviar una copia escaneada antes del viernes a las 3 PM.", "de": "Man kann vor Freitag um 15 Uhr eine Scan-Kopie schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde están disponibles los formularios?", "de": "Wo sind die Formulare verfügbar?", "s_es": {"type": "multiple_choice", "options": ["At the student office and on the website", "Only in the library", "Only in class"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Studierendenbüro und auf der Webseite", "Nur in der Bibliothek", "Nur im Unterricht"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe escribir el estudiante?", "de": "Was soll der Student schreiben?", "s_es": {"type": "multiple_choice", "options": ["Full name, student number, course code, and timetable", "Only the teacher''s name", "Only the room number"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vollständiger Name, Studentennummer, Kurscode und Stundenplan", "Nur den Namen des Lehrers", "Nur die Zimmernummer"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué foto pide el formulario?", "de": "Welches Foto verlangt das Formular?", "s_es": {"type": "multiple_choice", "options": ["A passport photo", "A holiday photo", "A school photo"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein Passfoto", "Ein Urlaubsfoto", "Ein Schulfoto"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta la matrícula?", "de": "Wie viel kostet die Einschreibung?", "s_es": {"type": "multiple_choice", "options": ["£15", "£10", "£20"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["15 Pfund", "10 Pfund", "20 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora se puede entregar en persona?", "de": "Bis wann kann man es persönlich abgeben?", "s_es": {"type": "multiple_choice", "options": ["4 PM", "5 PM", "6 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["16 Uhr", "17 Uhr", "18 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué otra opción hay además de entregarlo en persona?", "de": "Welche andere Möglichkeit gibt es außer der persönlichen Abgabe?", "s_es": {"type": "multiple_choice", "options": ["Email a scanned copy", "Send a text message", "Call the bus station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Scan-Kopie per E-Mail senden", "Eine SMS schicken", "Den Busbahnhof anrufen"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué fecha límite aparece para el correo?", "de": "Welche Frist gilt für die E-Mail?", "s_es": {"type": "multiple_choice", "options": ["Before Friday at 3 PM", "Before Monday at 3 PM", "Before Thursday at noon"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Vor Freitag um 15 Uhr", "Vor Montag um 15 Uhr", "Vor Donnerstagmittag"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué número necesita el estudiante?", "de": "Welche Nummer braucht der Student?", "s_es": {"type": "multiple_choice", "options": ["Student number", "Room number", "Bus number"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Studentennummer", "Zimmernummer", "Busnummer"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5810 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5810 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5810, 'en', 'reading', 'Gestión del Estudio y Trámites', $reading$
Westbridge College enrollment forms are available at the student office and on the college website.

Please complete the form in capital letters. Write your full name, student number, course code, and preferred timetable.

Bring one passport photo, your ID card, and proof of address. The registration fee is £15.

You can hand in the form at the student office between 9 AM and 4 PM, or email a scanned copy before Friday at 3 PM.
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee un formulario de matrícula', 'Lee un formulario con datos básicos de matrícula, plazos y documentos necesarios.'),
        (v_reading_id, 'de', 'Lies ein Einschreibeformular', 'Lies ein Formular mit grundlegenden Einschreibedaten, Fristen und nötigen Unterlagen.');

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
