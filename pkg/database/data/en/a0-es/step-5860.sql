-- ============================================================
-- Seed: A0 English Path – STEP 5860 – Dialogue – Gestión del Estudio y Trámites
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
        '{"character": "Student", "text": "Hello. I am looking for history books for my class.", "es": "Hola. Busco libros de historia para mi clase.", "de": "Hallo. Ich suche Geschichtsbücher für meinen Kurs."}'::jsonb,
        '{"character": "Librarian", "text": "The history books are on the second shelf on the left.", "es": "Los libros de historia están en la segunda estantería a la izquierda.", "de": "Die Geschichtsbücher stehen im zweiten Regal links."}'::jsonb,
        '{"character": "Student", "text": "Do you also have journals on this topic?", "es": "¿También tienen revistas sobre este tema?", "de": "Haben Sie auch Zeitschriften zu diesem Thema?"}'::jsonb,
        '{"character": "Librarian", "text": "Yes. The journals are in the study area near the window.", "es": "Sí. Las revistas están en la zona de estudio junto a la ventana.", "de": "Ja. Die Zeitschriften sind im Lernbereich am Fenster."}'::jsonb,
        '{"character": "Student", "text": "Can I use a computer to search the catalogue?", "es": "¿Puedo usar un ordenador para buscar en el catálogo?", "de": "Kann ich einen Computer benutzen, um im Katalog zu suchen?"}'::jsonb,
        '{"character": "Librarian", "text": "Of course. There are free computers by the main desk.", "es": "Claro. Hay ordenadores gratuitos junto al mostrador principal.", "de": "Natürlich. Es gibt freie Computer am Hauptschalter."}'::jsonb,
        '{"character": "Student", "text": "Can I borrow the book for two weeks?", "es": "¿Puedo tomar prestado el libro por dos semanas?", "de": "Kann ich das Buch für zwei Wochen ausleihen?"}'::jsonb,
        '{"character": "Librarian", "text": "Yes, if your student card is valid.", "es": "Sí, si tu carnet de estudiante está vigente.", "de": "Ja, wenn dein Studentenausweis gültig ist."}'::jsonb,
        '{"character": "Student", "text": "Thank you. I will go to the shelf now.", "es": "Gracias. Iré ahora a la estantería.", "de": "Danke. Ich gehe jetzt zum Regal."}'::jsonb,
        '{"character": "Librarian", "text": "Please come back if you need help.", "es": "Vuelve si necesitas ayuda.", "de": "Kommen Sie zurück, wenn Sie Hilfe brauchen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El estudiante busca libros de historia.", "de": "Der Student sucht Geschichtsbücher.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Las revistas están junto a la ventana.", "de": "Die Zeitschriften sind neben dem Fenster.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Los ordenadores están junto a la máquina de café.", "de": "Die Computer stehen neben dem Kaffeeautomaten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El estudiante pregunta por el catálogo.", "de": "Der Student fragt nach dem Katalog.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Puede tomar prestado el libro por dos semanas si su carnet es válido.", "de": "Er kann das Buch für zwei Wochen ausleihen, wenn sein Ausweis gültig ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿En qué estantería están los libros de historia?", "de": "In welchem Regal stehen die Geschichtsbücher?", "s_es": {"type": "multiple_choice", "options": ["Second shelf on the left", "First shelf on the right", "Top shelf in the back"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im zweiten Regal links", "Im ersten Regal rechts", "Im obersten Regal hinten"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde están las revistas?", "de": "Wo sind die Zeitschriften?", "s_es": {"type": "multiple_choice", "options": ["In the study area near the window", "At the entrance", "In the café"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Lernbereich am Fenster", "Am Eingang", "Im Café"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde hay ordenadores gratis?", "de": "Wo gibt es kostenlose Computer?", "s_es": {"type": "multiple_choice", "options": ["By the main desk", "In the car park", "By the lift"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Hauptschalter", "Im Parkplatz", "Am Aufzug"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe estar válido?", "de": "Was muss gültig sein?", "s_es": {"type": "multiple_choice", "options": ["Student card", "Bus pass", "Library book"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Studentenausweis", "Busfahrkarte", "Bibliotheksbuch"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tiempo puede pedir prestado el libro?", "de": "Wie lange kann er das Buch ausleihen?", "s_es": {"type": "multiple_choice", "options": ["Two weeks", "One day", "Three months"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei Wochen", "Einen Tag", "Drei Monate"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5860 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5860 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5860, 'en', 'dialogue', 'Gestión del Estudio y Trámites', '[{"name": "Staff", "gender": "neutral", "avatarURL": "https://example.com/avatars/staff.png"}, {"name": "Learner", "gender": "neutral", "avatarURL": "https://example.com/avatars/learner.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta por recursos de la biblioteca', 'Lee un diálogo en el que un estudiante pregunta por libros, revistas y ordenadores.'),
        (v_dialogue_id, 'de', 'Frag nach Bibliotheksressourcen', 'Lies einen Dialog, in dem ein Student nach Büchern, Zeitschriften und Computern fragt.');

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

