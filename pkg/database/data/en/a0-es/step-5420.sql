-- ============================================================
-- Seed: A0 English Path – STEP 5420 – Dialogue – open a discussion (Conferencias, Seminarios y Clases)
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
        '{"character": "Moderator", "text": "Let us begin the discussion on study spaces. Who would like to start?", "es": "Empecemos la discusión sobre espacios de estudio. ¿Quién quiere empezar?", "de": "Beginnen wir die Diskussion über Lernräume. Wer möchte anfangen?"}'::jsonb,
        '{"character": "Student", "text": "I can start. I think the quiet room is the best place for focused work.", "es": "Puedo empezar. Creo que la sala silenciosa es el mejor lugar para trabajar concentrado.", "de": "Ich kann beginnen. Ich denke, der stille Raum ist der beste Ort für konzentriertes Arbeiten."}'::jsonb,
        '{"character": "Moderator", "text": "Thank you. Can you give one reason for that?", "es": "Gracias. ¿Puedes dar una razón?", "de": "Danke. Kannst du einen Grund nennen?"}'::jsonb,
        '{"character": "Student", "text": "Yes. It has fewer distractions than the cafe area.", "es": "Sí. Tiene menos distracciones que la zona de cafetería.", "de": "Ja. Dort gibt es weniger Ablenkungen als im Cafébereich."}'::jsonb,
        '{"character": "Moderator", "text": "Good. Does anyone have a different view?", "es": "Bien. ¿Tiene alguien otra opinión?", "de": "Gut. Hat jemand eine andere Sicht?"}'::jsonb,
        '{"character": "Student", "text": "Some students prefer the cafe because it feels less formal.", "es": "Algunos estudiantes prefieren la cafetería porque parece menos formal.", "de": "Manche Studierende bevorzugen das Café, weil es weniger formell wirkt."}'::jsonb,
        '{"character": "Moderator", "text": "That is useful. Let us compare the two spaces clearly.", "es": "Eso es útil. Comparemos claramente los dos espacios.", "de": "Das ist nützlich. Vergleichen wir die beiden Räume klar."}'::jsonb,
        '{"character": "Student", "text": "The cafe is social, but the quiet room is better for long reading.", "es": "La cafetería es social, pero la sala silenciosa es mejor para lecturas largas.", "de": "Das Café ist sozial, aber der stille Raum ist besser für langes Lesen."}'::jsonb,
        '{"character": "Moderator", "text": "Excellent. We now have two starting positions.", "es": "Excelente. Ahora tenemos dos posiciones iniciales.", "de": "Ausgezeichnet. Jetzt haben wir zwei Ausgangspositionen."}'::jsonb,
        '{"character": "Student", "text": "Yes, and we can discuss them one by one.", "es": "Sí, y podemos debatirlas una por una.", "de": "Ja, und wir können sie nacheinander besprechen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La moderadora abre una discusión sobre espacios de estudio.", "p_de": "Die Moderatorin eröffnet eine Diskussion über Lernräume.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El estudiante cree que la cafetería es el mejor lugar para el trabajo concentrado.", "p_de": "Der Student glaubt, dass das Café der beste Ort für konzentrierte Arbeit ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La moderadora pide una razón para la opinión inicial.", "p_de": "Die Moderatorin bittet um einen Grund für die erste Meinung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Aparecen dos posiciones iniciales distintas.", "p_de": "Es erscheinen zwei unterschiedliche Ausgangspositionen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Quieren debatir esas posiciones una por una.", "p_de": "Sie wollen diese Positionen nacheinander diskutieren.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué tema introduce la moderadora?", "p_de": "Welches Thema führt die Moderatorin ein?", "s": {"type": "multiple_choice", "options": ["Study spaces", "Water use in labs", "Professional phone calls"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué lugar defiende primero el estudiante?", "p_de": "Welchen Ort verteidigt der Student zuerst?", "s": {"type": "multiple_choice", "options": ["The quiet room", "The bus stop", "The conference hall"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué razón da para esa preferencia?", "p_de": "Welchen Grund nennt er dafür?", "s": {"type": "multiple_choice", "options": ["Fewer distractions", "Better coffee prices", "More parking spaces"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué otra posición aparece después?", "p_de": "Welche andere Position erscheint danach?", "s": {"type": "multiple_choice", "options": ["Some students prefer the cafe", "Everyone prefers the library office", "No one likes study spaces"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué conclusión hace la moderadora?", "p_de": "Welche Schlussfolgerung zieht die Moderatorin?", "s": {"type": "multiple_choice", "options": ["There are now two starting positions", "The discussion is finished forever", "Only one view is allowed"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5420 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5420 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5420, 'en', 'dialogue', 'academic', '[{"name": "Moderator", "gender": "female", "avatarURL": "https://example.com/avatars/moderator.png"}, {"name": "Student", "gender": "male", "avatarURL": "https://example.com/avatars/student.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Abrir una discusión', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Eine Diskussion eröffnen', '');

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
