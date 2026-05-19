-- ============================================================
-- Seed: A0 English Path – STEP 5800 – Dialogue – Gestión del Estudio y Trámites
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_id UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Student", "text": "Hello. I need help planning my study arrangements.", "es": "Hola. Necesito ayuda para organizar mis estudios.", "de": "Hallo. Ich brauche Hilfe bei der Planung meines Studiums."}'::jsonb,
        '{"character": "Advisor", "text": "Of course. Do you need help with classes, the lab, or the library?", "es": "Claro. ¿Necesitas ayuda con las clases, el laboratorio o la biblioteca?", "de": "Natürlich. Brauchst du Hilfe mit Kursen, dem Labor oder der Bibliothek?"}'::jsonb,
        '{"character": "Student", "text": "I need to meet my tutor on Tuesday morning.", "es": "Necesito reunirme con mi tutor el martes por la mañana.", "de": "Ich muss meinen Tutor am Dienstagmorgen treffen."}'::jsonb,
        '{"character": "Advisor", "text": "That is fine. I can book a short meeting at 10 AM.", "es": "Está bien. Puedo reservar una reunión corta a las 10 AM.", "de": "Das ist gut. Ich kann ein kurzes Treffen um 10 Uhr buchen."}'::jsonb,
        '{"character": "Student", "text": "I also need the lab key for the project work.", "es": "También necesito la llave del laboratorio para el trabajo del proyecto.", "de": "Ich brauche auch den Laborschlüssel für die Projektarbeit."}'::jsonb,
        '{"character": "Advisor", "text": "Please take this form to the lab desk after the meeting.", "es": "Lleva este formulario al mostrador del laboratorio después de la reunión.", "de": "Bitte bring dieses Formular nach dem Treffen zum Laborschalter."}'::jsonb,
        '{"character": "Student", "text": "Can I ask the library staff about borrowing books?", "es": "¿Puedo preguntar al personal de la biblioteca sobre el préstamo de libros?", "de": "Kann ich das Bibliothekspersonal nach dem Ausleihen von Büchern fragen?"}'::jsonb,
        '{"character": "Advisor", "text": "Yes. The library desk is open until 6 PM.", "es": "Sí. El mostrador de la biblioteca abre hasta las 6 PM.", "de": "Ja. Der Bibliotheksschalter ist bis 18 Uhr geöffnet."}'::jsonb,
        '{"character": "Student", "text": "Great. I will visit the lab first and then the library.", "es": "Genial. Iré primero al laboratorio y luego a la biblioteca.", "de": "Gut. Ich gehe zuerst ins Labor und dann in die Bibliothek."}'::jsonb,
        '{"character": "Advisor", "text": "Good plan. Please bring your student card.", "es": "Buen plan. Trae tu carnet de estudiante.", "de": "Guter Plan. Bitte bring deinen Studentenausweis mit."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El estudiante pide ayuda con sus estudios.", "de": "Der Student bittet um Hilfe für sein Studium.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tutor se reúne con el estudiante el lunes.", "de": "Der Tutor trifft den Studenten am Montag.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La reunión es a las 10 AM.", "de": "Das Treffen ist um 10 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El estudiante necesita la llave del laboratorio.", "de": "Der Student braucht den Laborschlüssel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Debe llevar el formulario al mostrador de la biblioteca.", "de": "Er soll das Formular zum Bibliotheksschalter bringen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué día tiene la reunión?", "de": "An welchem Tag ist das Treffen?", "s_es": {"type": "multiple_choice", "options": ["Tuesday", "Monday", "Friday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dienstag", "Montag", "Freitag"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hora le dan para la reunión?", "de": "Welche Uhrzeit bekommt er für das Treffen?", "s_es": {"type": "multiple_choice", "options": ["10 AM", "9 AM", "2 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Uhr", "9 Uhr", "14 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debe llevar el formulario?", "de": "Wohin soll er das Formular bringen?", "s_es": {"type": "multiple_choice", "options": ["The lab desk", "The canteen", "The bus stop"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum Laborschalter", "Zur Mensa", "Zur Bushaltestelle"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora abre el mostrador de la biblioteca?", "de": "Bis wann ist der Bibliotheksschalter geöffnet?", "s_es": {"type": "multiple_choice", "options": ["6 PM", "4 PM", "8 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["18 Uhr", "16 Uhr", "20 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué documento debe llevar el estudiante?", "de": "Welches Dokument soll der Student mitbringen?", "s_es": {"type": "multiple_choice", "options": ["Student card", "Driving licence", "Passport"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Studentenausweis", "Führerschein", "Reisepass"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5800 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5800 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5800, 'en', 'dialogue', 'Gestión del Estudio y Trámites', '[{"name": "Staff", "gender": "neutral", "avatarURL": "https://example.com/avatars/staff.png"}, {"name": "Learner", "gender": "neutral", "avatarURL": "https://example.com/avatars/learner.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Organiza tu estudio con el personal académico', 'Lee un diálogo en el que un estudiante acuerda horarios, documentos y apoyo con varios miembros del personal.'),
        (v_dialogue_id, 'de', 'Organisiere dein Studium mit dem Hochschulpersonal', 'Lies einen Dialog, in dem ein Student Zeiten, Unterlagen und Hilfe mit verschiedenen Mitarbeitenden abstimmt.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_id, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_id, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;

