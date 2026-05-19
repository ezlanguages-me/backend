-- ============================================================
-- Seed: A0 English Path – STEP 5040 – Reading – understand academic reading assignments (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El lunes hay que leer el capítulo 2, páginas 34 a 48.", "p_de": "Am Montag soll Kapitel 2, Seiten 34 bis 48, gelesen werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El miércoles hay que leer un artículo llamado Small Parks, Big Cities.", "p_de": "Am Mittwoch soll ein Artikel namens Small Parks, Big Cities gelesen werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El viernes hay que escribir una reflexión de 300 palabras.", "p_de": "Am Freitag soll eine Reflexion von 300 Wörtern geschrieben werden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La pregunta de la reflexión trata de por qué importan los parques pequeños.", "p_de": "Die Frage der Reflexion behandelt, warum kleine Parks wichtig sind.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Hay que buscar tres términos clave: density, commute y rent.", "p_de": "Drei Schlüsselbegriffe sollen nachgeschlagen werden: density, commute und rent.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los estudiantes deben traer un ejemplo de otra universidad.", "p_de": "Die Studierenden sollen ein Beispiel von einer anderen Universität mitbringen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Se puede usar un diccionario para palabras académicas nuevas.", "p_de": "Für neue akademische Wörter darf ein Wörterbuch benutzt werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reflexión debe escribirse en inglés.", "p_de": "Die Reflexion soll auf Englisch geschrieben werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué capítulo hay que leer el lunes?", "p_de": "Welches Kapitel soll am Montag gelesen werden?", "s": {"type": "multiple_choice", "options": ["Chapter 2", "Chapter 5", "The appendix only"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se llama el artículo del miércoles?", "p_de": "Wie heißt der Artikel am Mittwoch?", "s": {"type": "multiple_choice", "options": ["Small Parks, Big Cities", "The Long Bus Ride", "Modern Office Calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas palabras debe tener la reflexión?", "p_de": "Wie viele Wörter soll die Reflexion haben?", "s": {"type": "multiple_choice", "options": ["120 words", "300 words", "50 words"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta responde la reflexión?", "p_de": "Welche Frage beantwortet die Reflexion?", "s": {"type": "multiple_choice", "options": ["Why do small parks matter in busy cities?", "How do you buy a train ticket?", "When does the lecture end?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tres términos deben buscarse?", "p_de": "Welche drei Begriffe sollen nachgeschlagen werden?", "s": {"type": "multiple_choice", "options": ["density, commute, and rent", "park, bus, and coffee", "phone, email, and printer"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe traer cada estudiante a clase?", "p_de": "Was soll jeder Studierende in den Unterricht mitbringen?", "s": {"type": "multiple_choice", "options": ["One example from their own city", "A visitor badge", "A hotel receipt"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué se puede usar con palabras nuevas?", "p_de": "Was darf bei neuen Wörtern benutzt werden?", "s": {"type": "multiple_choice", "options": ["A dictionary", "A calculator only", "No support at all"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué idioma se escribe la reflexión?", "p_de": "In welcher Sprache wird die Reflexion geschrieben?", "s": {"type": "multiple_choice", "options": ["In English", "In Spanish", "In German"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5040 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5040 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5040, 'en', 'reading', 'academic', 'Course reading plan. On Monday, read Chapter 2, pages 34 to 48, about urban density. On Wednesday, read the article ''Small Parks, Big Cities'' and underline two examples about public space.

On Friday, write a reflection of 120 words that answers one question: Why do small parks matter in busy cities? The teacher also asks students to look up three key terms: density, commute, and rent.

Bring one example from your own city to discuss in class next week. Students may use a dictionary for new academic words, but the reflection must be written in English.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Tareas de lectura académica', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Akademische Leseaufgaben', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
