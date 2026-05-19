-- ============================================================
-- Seed: A0 English Path – STEP 2550 – Dialogue – Pide una cita médica cara a cara
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
        '{"character": "Patient", "text": "Hello. I would like a doctor appointment today, please.", "es": "Hola. Quisiera una cita con el médico para hoy, por favor.", "de": "Hallo. Ich hätte heute gern einen Arzttermin, bitte."}'::jsonb,
        '{"character": "Receptionist", "text": "Of course. What is the problem?", "es": "Claro. ¿Cuál es el problema?", "de": "Natürlich. Was ist das Problem?"}'::jsonb,
        '{"character": "Patient", "text": "I have a sore throat and a fever.", "es": "Tengo dolor de garganta y fiebre.", "de": "Ich habe Halsschmerzen und Fieber."}'::jsonb,
        '{"character": "Receptionist", "text": "We have one appointment at 3:20 this afternoon with Dr Brown.", "es": "Tenemos una cita a las 3:20 de esta tarde con la doctora Brown.", "de": "Wir haben heute Nachmittag um 3:20 einen Termin bei Dr Brown."}'::jsonb,
        '{"character": "Patient", "text": "Yes, that is good for me.", "es": "Sí, esa hora me va bien.", "de": "Ja, diese Uhrzeit passt mir."}'::jsonb,
        '{"character": "Receptionist", "text": "Can I have your name, please?", "es": "¿Me da su nombre, por favor?", "de": "Kann ich bitte Ihren Namen haben?"}'::jsonb,
        '{"character": "Patient", "text": "It is Marta Diaz.", "es": "Es Marta Díaz.", "de": "Ich heiße Marta Diaz."}'::jsonb,
        '{"character": "Receptionist", "text": "Thank you. Please arrive ten minutes early and bring your health card.", "es": "Gracias. Por favor, llegue diez minutos antes y traiga su tarjeta sanitaria.", "de": "Danke. Bitte kommen Sie zehn Minuten früher und bringen Sie Ihre Gesundheitskarte mit."}'::jsonb,
        '{"character": "Patient", "text": "Okay. I will be here at 3:10.", "es": "De acuerdo. Estaré aquí a las 3:10.", "de": "Okay. Ich bin um 3:10 hier."}'::jsonb,
        '{"character": "Receptionist", "text": "Perfect. See you later.", "es": "Perfecto. Hasta luego.", "de": "Perfekt. Bis später."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La paciente quiere una cita médica para hoy.", "p_de": "Die Patientin möchte heute einen Arzttermin.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La paciente dice que tiene dolor de garganta y fiebre.", "p_de": "Die Patientin sagt, dass sie Halsschmerzen und Fieber hat.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La cita es a las 2:20 con Dr Brown.", "p_de": "Der Termin ist um 2:20 bei Dr Brown.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La recepcionista pide el nombre de la paciente.", "p_de": "Die Rezeptionistin fragt nach dem Namen der Patientin.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La paciente debe llegar diez minutos antes y traer su tarjeta sanitaria.", "p_de": "Die Patientin soll zehn Minuten früher kommen und ihre Gesundheitskarte mitbringen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A qué hora es la cita?", "p_de": "Um wie viel Uhr ist der Termin?", "s": {"type": "multiple_choice", "options": ["At 3:20", "At 2:20", "At 3:50"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["At 3:20", "At 2:20", "At 3:50"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["At 3:20", "At 2:20", "At 3:50"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué médico es la cita?", "p_de": "Bei welchem Arzt ist der Termin?", "s": {"type": "multiple_choice", "options": ["Dr Brown", "Dr Lee", "Dr Green"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Dr Brown", "Dr Lee", "Dr Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dr Brown", "Dr Lee", "Dr Green"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo se llama la paciente?", "p_de": "Wie heißt die Patientin?", "s": {"type": "multiple_choice", "options": ["Marta Diaz", "Maria Torres", "Marta Green"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Marta Diaz", "Maria Torres", "Marta Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Marta Diaz", "Maria Torres", "Marta Green"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe traer?", "p_de": "Was soll sie mitbringen?", "s": {"type": "multiple_choice", "options": ["Her health card", "Her suitcase", "Her bus card"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Her health card", "Her suitcase", "Her bus card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Her health card", "Her suitcase", "Her bus card"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora dice la paciente que llegará?", "p_de": "Um wie viel Uhr sagt die Patientin, dass sie ankommt?", "s": {"type": "multiple_choice", "options": ["At 3:10", "At 3:20", "At 2:50"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["At 3:10", "At 3:20", "At 2:50"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["At 3:10", "At 3:20", "At 2:50"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2550 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2550 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2550, 'en', 'dialogue', 'health', '[{"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}, {"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pide una cita médica cara a cara', 'Sigue un diálogo breve entre una paciente y la recepción para pedir una cita médica.'),
        (v_dialogue_id, 'de', 'Einen Arzttermin persönlich vereinbaren', 'Verfolge einen kurzen Dialog zwischen einer Patientin und der Rezeption, um einen Arzttermin zu vereinbaren.');

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
