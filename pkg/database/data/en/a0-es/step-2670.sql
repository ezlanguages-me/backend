-- ============================================================
-- Seed: A0 English Path – STEP 2670 – Dialogue – Comprende y confirma los consejos del médico
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Doctor", "text": "You have a chest infection, but it is not serious.", "es": "Tiene una infección en el pecho, pero no es grave.", "de": "Sie haben eine Brustinfektion, aber sie ist nicht ernst."}'::jsonb,
        '{"character": "Patient", "text": "Okay. What should I do now?", "es": "De acuerdo. ¿Qué debo hacer ahora?", "de": "Okay. Was soll ich jetzt tun?"}'::jsonb,
        '{"character": "Doctor", "text": "Rest at home for two days and drink warm water.", "es": "Descanse en casa dos días y beba agua caliente.", "de": "Ruhen Sie sich zwei Tage zu Hause aus und trinken Sie warmes Wasser."}'::jsonb,
        '{"character": "Patient", "text": "Can I go to work tomorrow?", "es": "¿Puedo ir a trabajar mañana?", "de": "Kann ich morgen zur Arbeit gehen?"}'::jsonb,
        '{"character": "Doctor", "text": "No. Stay at home tomorrow.", "es": "No. Quédese en casa mañana.", "de": "Nein. Bleiben Sie morgen zu Hause."}'::jsonb,
        '{"character": "Patient", "text": "How often do I take the medicine?", "es": "¿Cada cuánto tomo la medicina?", "de": "Wie oft nehme ich das Medikament?"}'::jsonb,
        '{"character": "Doctor", "text": "Twice a day after food.", "es": "Dos veces al día después de comer.", "de": "Zweimal am Tag nach dem Essen."}'::jsonb,
        '{"character": "Patient", "text": "And no sport this week?", "es": "¿Y nada de deporte esta semana?", "de": "Und diese Woche kein Sport?"}'::jsonb,
        '{"character": "Doctor", "text": "That''''s right. Call the clinic if your breathing gets worse.", "es": "Eso es. Llame a la clínica si respira peor.", "de": "Genau. Rufen Sie die Klinik an, wenn Ihre Atmung schlechter wird."}'::jsonb,
        '{"character": "Patient", "text": "Thank you. I understand.", "es": "Gracias. Lo entiendo.", "de": "Danke. Ich verstehe."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El médico dice que la infección no es grave.", "p_de": "Der Arzt sagt, dass die Infektion nicht ernst ist.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente puede ir a trabajar mañana.", "p_de": "Der Patient kann morgen zur Arbeit gehen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La medicina se toma dos veces al día después de comer.", "p_de": "Das Medikament wird zweimal am Tag nach dem Essen genommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El médico permite hacer deporte esta semana.", "p_de": "Der Arzt erlaubt diese Woche Sport.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Si la respiración empeora, el paciente debe llamar a la clínica.", "p_de": "Wenn die Atmung schlechter wird, soll der Patient die Klinik anrufen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué problema tiene el paciente?", "p_de": "Welches Problem hat der Patient?", "s": {"type": "multiple_choice", "options": ["A chest infection", "A stomach problem", "A broken tooth"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A chest infection", "A stomach problem", "A broken tooth"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A chest infection", "A stomach problem", "A broken tooth"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el paciente sobre mañana?", "p_de": "Was fragt der Patient über morgen?", "s": {"type": "multiple_choice", "options": ["Can I go to work tomorrow?", "Can I drive to London?", "Can I eat ice cream?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Can I go to work tomorrow?", "Can I drive to London?", "Can I eat ice cream?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Can I go to work tomorrow?", "Can I drive to London?", "Can I eat ice cream?"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántas veces al día toma la medicina?", "p_de": "Wie oft am Tag nimmt er das Medikament?", "s": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Three times an hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Three times an hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Twice a day", "Once a week", "Three times an hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace sobre esta semana?", "p_de": "Welche Frage stellt er über diese Woche?", "s": {"type": "multiple_choice", "options": ["And no sport this week?", "And no coffee this week?", "And no train this week?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["And no sport this week?", "And no coffee this week?", "And no train this week?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["And no sport this week?", "And no coffee this week?", "And no train this week?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe hacer si respira peor?", "p_de": "Was soll er tun, wenn er schlechter atmet?", "s": {"type": "multiple_choice", "options": ["Call the clinic", "Go to the cinema", "Buy more tea"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Call the clinic", "Go to the cinema", "Buy more tea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Call the clinic", "Go to the cinema", "Buy more tea"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2670 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2670 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2670, 'en', 'dialogue', 'health', '[{"name": "Doctor", "gender": "female", "avatarURL": "https://example.com/avatars/doctor.png"}, {"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Comprende y confirma los consejos del médico', 'Lee un diálogo entre médico y paciente en el que se repasan los consejos principales de la consulta.'),
        (v_dialogue_id, 'de', 'Verstehe und bestätige die Ratschläge des Arztes', 'Lies einen Dialog zwischen Arzt und Patient, in dem die wichtigsten Ratschläge der Untersuchung wiederholt werden.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
