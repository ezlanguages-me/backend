-- ============================================================
-- Seed: A0 English Path – STEP 1030 – Reading – read all information related to practical arrangements for study which teachers or lecturers are likely to write (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El taller es mañana a las 2 PM en el edificio de ciencias 4.", "de": "Der Workshop ist morgen um 14 Uhr in Gebäude 4 der Naturwissenschaften.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los estudiantes dejan los abrigos en la estantería del fondo.", "de": "Die Studierenden legen ihre Mäntel auf das Regal hinten.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Cada estudiante toma una hoja amarilla de la mesa principal.", "de": "Jede Person nimmt ein gelbes Blatt vom Haupttisch.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Primero escriben su nombre y número de grupo.", "de": "Zuerst schreiben sie ihren Namen und ihre Gruppennummer.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Trabajan solos en el ordenador 5.", "de": "Sie arbeiten allein an Computer 5.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Después imprimen una página y la ponen en una caja verde.", "de": "Danach drucken sie eine Seite und legen sie in eine grüne Box.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Si la impresora no funciona, hablan con Ms Brown en el escritorio 1.", "de": "Wenn der Drucker nicht funktioniert, sprechen sie mit Ms Brown an Tisch 1.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La lista de tutoría se quita del tablón a las 3 PM.", "de": "Die Liste für die Sprechstunde wird um 15 Uhr vom Brett genommen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué color tiene la hoja que toman los estudiantes?", "de": "Welche Farbe hat das Blatt, das die Studierenden nehmen?", "s_es": {"type": "multiple_choice", "options": ["Blue", "Yellow", "Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Blau", "Gelb", "Grün"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué archivo descargan?", "de": "Welche Datei laden sie herunter?", "s_es": {"type": "multiple_choice", "options": ["File A", "File B", "File C"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Datei A", "Datei B", "Datei C"], "answer": 0}}'::jsonb,
        '{"es": "¿Con quién trabajan?", "de": "Mit wem arbeiten sie?", "s_es": {"type": "multiple_choice", "options": ["With a partner", "With the librarian", "With the principal"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem Partner", "Mit der Bibliothekarin", "Mit dem Direktor"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué ordenadores trabajan?", "de": "An welchen Computern arbeiten sie?", "s_es": {"type": "multiple_choice", "options": ["Computer 6 or 7", "Computer 1 or 2", "Computer 8 or 9"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Computer 6 oder 7", "Computer 1 oder 2", "Computer 8 oder 9"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde ponen la página impresa?", "de": "Wohin legen sie die gedruckte Seite?", "s_es": {"type": "multiple_choice", "options": ["In the green box near the window", "On the teachers chair", "Under the keyboard"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In die grüne Box am Fenster", "Auf den Stuhl der Lehrerin", "Unter die Tastatur"], "answer": 0}}'::jsonb,
        '{"es": "¿Con quién hablan si la impresora se para?", "de": "Mit wem sprechen sie, wenn der Drucker stehen bleibt?", "s_es": {"type": "multiple_choice", "options": ["Ms Brown", "Mr Green", "The security guard"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit Ms Brown", "Mit Mr Green", "Mit dem Wachmann"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hacen antes de salir?", "de": "Was machen sie vor dem Gehen?", "s_es": {"type": "multiple_choice", "options": ["Sign up for next weeks office hour", "Buy a new worksheet", "Move to Room 5"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sich für die Sprechstunde nächste Woche eintragen", "Ein neues Arbeitsblatt kaufen", "In Raum 5 gehen"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora está la lista en el tablón?", "de": "Bis wann bleibt die Liste am Brett?", "s_es": {"type": "multiple_choice", "options": ["5 PM", "2 PM", "6 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["17 Uhr", "14 Uhr", "18 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 1030 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 1030 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 1030, 'en', 'reading', 'academic', 'Dear students, tomorrow we meet in Science Building 4 at 2 PM for the workshop. Put your coats on the back shelf and take one blue worksheet from the front table.\n\nFirst, write your name and group number on the sheet. Then open the class website and download File A. Work with your partner at Computer 6 or Computer 7.\n\nAfter the activity, print one page and put it in the green box near the window. If the printer stops, tell Ms Brown at Desk 1.\n\nBefore you leave, sign up for next weeks office hour on the paper list. The list stays on the notice board until 5 PM.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee todas las indicaciones prácticas de estudio', 'Lee instrucciones escritas por una profesora para organizar un taller y la entrega del trabajo.'),
        (v_reading_id, 'de', 'Lies alle praktischen Studienhinweise', 'Lies schriftliche Hinweise einer Lehrerin zur Organisation eines Workshops und der Abgabe.');

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
