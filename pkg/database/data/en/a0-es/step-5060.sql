-- ============================================================
-- Seed: A0 English Path – STEP 5060 – Dialogue – ask for clarification in a lecture (Conferencias, Seminarios y Clases)
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
        '{"character": "Student", "text": "Excuse me, what does urban density mean in this chapter?", "es": "Perdón, ¿qué significa urban density en este capítulo?", "de": "Entschuldigung, was bedeutet urban density in diesem Kapitel?"}'::jsonb,
        '{"character": "Professor", "text": "It means how many people live in one area of the city.", "es": "Significa cuántas personas viven en una zona de la ciudad.", "de": "Es bedeutet, wie viele Menschen in einem Stadtgebiet leben."}'::jsonb,
        '{"character": "Student", "text": "Thank you. And do we need Chapter 2 and the article for Friday?", "es": "Gracias. ¿Y necesitamos el capítulo 2 y el artículo para el viernes?", "de": "Danke. Und brauchen wir Kapitel 2 und den Artikel für Freitag?"}'::jsonb,
        '{"character": "Professor", "text": "Yes, please read both before Friday.", "es": "Sí, por favor, lee ambos antes del viernes.", "de": "Ja, bitte lies beides vor Freitag."}'::jsonb,
        '{"character": "Student", "text": "Should the reflection be exactly one hundred and twenty words?", "es": "¿La reflexión debe tener exactamente ciento veinte palabras?", "de": "Soll die Reflexion genau hundertzwanzig Wörter haben?"}'::jsonb,
        '{"character": "Professor", "text": "Around one hundred and twenty is fine.", "es": "Alrededor de ciento veinte está bien.", "de": "Ungefähr hundertzwanzig ist in Ordnung."}'::jsonb,
        '{"character": "Student", "text": "Can I use a dictionary for the key terms?", "es": "¿Puedo usar un diccionario para los términos clave?", "de": "Kann ich für die Schlüsselbegriffe ein Wörterbuch benutzen?"}'::jsonb,
        '{"character": "Professor", "text": "Yes, for new words, but write the reflection in English.", "es": "Sí, para palabras nuevas, pero escribe la reflexión en inglés.", "de": "Ja, für neue Wörter, aber schreib die Reflexion auf Englisch."}'::jsonb,
        '{"character": "Student", "text": "Great. I understand the task now.", "es": "Perfecto. Ahora entiendo la tarea.", "de": "Gut. Jetzt verstehe ich die Aufgabe."}'::jsonb,
        '{"character": "Professor", "text": "Excellent. Ask again if anything is unclear.", "es": "Excelente. Vuelve a preguntar si algo no está claro.", "de": "Ausgezeichnet. Frag noch einmal, wenn etwas unklar ist."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La estudiante pregunta qué significa urban density.", "p_de": "Die Studentin fragt, was urban density bedeutet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El profesor dice que solo hay que leer el artículo.", "p_de": "Der Professor sagt, dass nur der Artikel gelesen werden muss.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La reflexión debe ser alrededor de ciento veinte palabras.", "p_de": "Die Reflexion soll ungefähr hundertzwanzig Wörter haben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Se puede usar un diccionario para palabras nuevas.", "p_de": "Für neue Wörter darf ein Wörterbuch benutzt werden.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El profesor pide que la reflexión se escriba en inglés.", "p_de": "Der Professor verlangt, dass die Reflexion auf Englisch geschrieben wird.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué significa urban density según el profesor?", "p_de": "Was bedeutet urban density laut Professor?", "s": {"type": "multiple_choice", "options": ["How many people live in one city area", "How many books are in the library", "How many phones are in an office"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe leer la estudiante antes del viernes?", "p_de": "Was soll die Studentin vor Freitag lesen?", "s": {"type": "multiple_choice", "options": ["Chapter 2 and the article", "Only the article title", "Only the reflection"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas palabras recomienda el profesor?", "p_de": "Wie viele Wörter empfiehlt der Professor?", "s": {"type": "multiple_choice", "options": ["Around 120 words", "Exactly 500 words", "Only 20 words"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué puede usar la estudiante un diccionario?", "p_de": "Wofür darf die Studentin ein Wörterbuch benutzen?", "s": {"type": "multiple_choice", "options": ["For new key words", "For the full reflection text", "For the room number"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace la estudiante al final?", "p_de": "Was macht die Studentin am Ende?", "s": {"type": "multiple_choice", "options": ["She says she understands the task now", "She leaves the lecture angry", "She asks for a taxi"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5060 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5060 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5060, 'en', 'dialogue', 'academic', '[{"name": "Student", "gender": "female", "avatarURL": "https://example.com/avatars/student.png"}, {"name": "Professor", "gender": "male", "avatarURL": "https://example.com/avatars/professor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Pedir aclaraciones en clase', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Im Unterricht um Klärung bitten', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
