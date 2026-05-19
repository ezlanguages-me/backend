-- ============================================================
-- Seed: A0 English Path – STEP 5350 – Reading – read a peer evaluation form (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Hay que puntuar la presentación del 1 al 5.", "p_de": "Die Präsentation soll von 1 bis 5 bewertet werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Las cinco áreas incluyen claridad, estructura y contacto visual.", "p_de": "Die fünf Bereiche umfassen Klarheit, Struktur und Blickkontakt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No hace falta comentar nada por escrito.", "p_de": "Man muss nichts schriftlich kommentieren.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El nombre del evaluador es opcional.", "p_de": "Der Name der bewertenden Person ist optional.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El nombre del ponente y el tema son obligatorios.", "p_de": "Name des Vortragenden und Thema sind verpflichtend.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La puntuación total va al principio de la página.", "p_de": "Die Gesamtpunktzahl steht am Anfang der Seite.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que entregar el formulario antes de comer.", "p_de": "Der Bogen soll vor dem Mittagessen abgegeben werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La profesora compartirá los comentarios más tarde.", "p_de": "Die Lehrkraft teilt die Kommentare später.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Entre qué números se puntúa?", "p_de": "Zwischen welchen Zahlen wird bewertet?", "s": {"type": "multiple_choice", "options": ["From 1 to 5", "From 1 to 10", "From 0 to 100"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué área visual aparece en la lista?", "p_de": "Welcher visuelle Bereich steht in der Liste?", "s": {"type": "multiple_choice", "options": ["Eye contact", "Phone speed", "Parking control"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dos comentarios escritos se piden?", "p_de": "Welche zwei schriftlichen Kommentare werden verlangt?", "s": {"type": "multiple_choice", "options": ["One positive comment and one suggestion", "Two complaints only", "No written comments"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué nombre es opcional?", "p_de": "Welcher Name ist optional?", "s": {"type": "multiple_choice", "options": ["The evaluator name", "The presenter name", "The course name"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué datos son obligatorios?", "p_de": "Welche Angaben sind verpflichtend?", "s": {"type": "multiple_choice", "options": ["Presenter name and topic", "Evaluator phone number", "Room price and lunch choice"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde va la puntuación total?", "p_de": "Wo kommt die Gesamtpunktzahl hin?", "s": {"type": "multiple_choice", "options": ["At the bottom of the page", "At the top of the title", "On the back of the badge"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo se entrega el formulario?", "p_de": "Wann wird der Bogen abgegeben?", "s": {"type": "multiple_choice", "options": ["Before lunch", "After midnight", "Next semester"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará la profesora después?", "p_de": "Was macht die Lehrkraft danach?", "s": {"type": "multiple_choice", "options": ["Share the comments later", "Cancel the seminar", "Print a conference schedule"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5350 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5350 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5350, 'en', 'reading', 'academic', 'Peer evaluation form. Please score the presentation from 1 to 5 in five areas: clarity, structure, eye contact, visuals, and answers to questions.

Write one positive comment and one suggestion for improvement. The evaluator name is optional, but the presenter name and topic are required.

Add the total score at the bottom of the page and return the form before lunch. The teacher will collect the forms and share the comments later.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Formulario de evaluación entre compañeros', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Peer-Bewertungsbogen', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
