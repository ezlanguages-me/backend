-- ============================================================
-- Seed: A0 English Path – STEP 5780 – Reading – make all necessary arrangements regarding practical arrangements for study (Gestión del Estudio y Trámites)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        -- 8 true_false exercises first
        '{"p": "El estudiante pide acceso al laboratorio de microbiología para el miércoles por la tarde.", "p_de": "Der Studierende bittet um Zugang zum Mikrobiologielabor für Mittwochabend.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Antes del acceso, debe completar un formulario de seguridad en línea.", "p_de": "Vor dem Zugang muss ein Online-Sicherheitsformular ausgefüllt werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La tarjeta de acceso se recoge entre las 09:00 y las 11:00.", "p_de": "Die Zugangskarte wird zwischen 09:00 und 11:00 abgeholt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión con la docente se ofrece para el jueves a las 14:30.", "p_de": "Das Treffen mit der Lehrkraft wird für Donnerstag um 14:30 angeboten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La docente propone la sala 3.12 para la reunión.", "p_de": "Die Lehrkraft schlägt Raum 3.12 für das Treffen vor.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "No existe ninguna opción de reunión en línea.", "p_de": "Es gibt keine Möglichkeit für ein Online-Treffen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los correos usan un tono cortés y práctico.", "p_de": "Die E-Mails verwenden einen höflichen und praktischen Ton.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El texto trata sobre la inscripción en un club deportivo.", "p_de": "Der Text handelt von der Anmeldung in einem Sportverein.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        -- 8 multiple_choice exercises (answer ALWAYS 0)
        '{"p": "¿Para qué escribe el primer correo el estudiante?", "p_de": "Warum schreibt der Studierende die erste E-Mail?", "s": {"type": "multiple_choice", "options": ["To ask for evening lab access", "To complain about parking fees", "To submit an exam"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer primero antes de entrar al laboratorio?", "p_de": "Was muss man zuerst tun, bevor man ins Labor darf?", "s": {"type": "multiple_choice", "options": ["Complete the online safety form", "Buy a new textbook", "Book a hotel room"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde recoge la tarjeta de acceso?", "p_de": "Wo holt man die Zugangskarte ab?", "s": {"type": "multiple_choice", "options": ["At the department office", "At the sports center", "At the train station"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo ofrece la docente la reunión?", "p_de": "Wann bietet die Lehrkraft das Treffen an?", "s": {"type": "multiple_choice", "options": ["Thursday at 14:30", "Monday at 08:00", "Friday at 18:00"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué sala sugiere la docente?", "p_de": "Welchen Raum schlägt die Lehrkraft vor?", "s": {"type": "multiple_choice", "options": ["Room 3.12", "Room B2", "Room A0"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué alternativa ofrece si el estudiante está de prácticas?", "p_de": "Welche Alternative wird angeboten, wenn der Studierende im Praktikum ist?", "s": {"type": "multiple_choice", "options": ["An online meeting", "A bus pass", "A library card"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo es el lenguaje de los correos?", "p_de": "Wie ist die Sprache der E-Mails?", "s": {"type": "multiple_choice", "options": ["Polite and practical", "Angry and informal", "Humorous and vague"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué incluyen las respuestas del personal?", "p_de": "Was enthalten die Antworten des Personals?", "s": {"type": "multiple_choice", "options": ["Next steps, times, and locations", "Only personal opinions", "Only grammar corrections"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5780 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5780 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5780, 'en', 'reading', 'study-management', 'Email 1: A student writes to the science administrator to ask for access to the microbiology lab on Wednesday evening. The administrator replies that the student must complete the online safety form first and can collect the access card from the department office between 09:00 and 11:00.

Email 2: The same student writes to a lecturer to arrange a short meeting about project feedback. The lecturer answers that Thursday at 14:30 is free and suggests Room 3.12, but also offers an online meeting if the student is on placement that day.

Both emails are polite and practical. The student explains the reason for the request, asks clearly for times or access, and thanks the staff member. The replies give next steps, times, and locations so the arrangements are easy to follow.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'es', 'Organizar acceso al laboratorio y una reunión', '');
    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES (v_reading_id, 'de', 'Laborzugang und ein Treffen organisieren', '');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_reading_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
