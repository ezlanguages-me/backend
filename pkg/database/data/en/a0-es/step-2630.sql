-- ============================================================
-- Seed: A0 English Path – STEP 2630 – Dialogue – Explica tus síntomas al farmacéutico
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
        '{"character": "Pharmacist", "text": "Good afternoon. How can I help you?", "es": "Buenas tardes. ¿En qué puedo ayudarle?", "de": "Guten Tag. Wie kann ich Ihnen helfen?"}'::jsonb,
        '{"character": "Patient", "text": "I have a cough and a sore throat.", "es": "Tengo tos y dolor de garganta.", "de": "Ich habe Husten und Halsschmerzen."}'::jsonb,
        '{"character": "Pharmacist", "text": "Do you also have a fever?", "es": "¿Tiene también fiebre?", "de": "Haben Sie auch Fieber?"}'::jsonb,
        '{"character": "Patient", "text": "Yes, a little. Since yesterday.", "es": "Sí, un poco. Desde ayer.", "de": "Ja, ein wenig. Seit gestern."}'::jsonb,
        '{"character": "Pharmacist", "text": "Do you have any allergy to medicine?", "es": "¿Tiene alguna alergia a medicamentos?", "de": "Haben Sie eine Allergie gegen Medikamente?"}'::jsonb,
        '{"character": "Patient", "text": "No, I do not.", "es": "No, no tengo.", "de": "Nein, habe ich nicht."}'::jsonb,
        '{"character": "Pharmacist", "text": "This syrup is good for the cough, and these sweets can help your throat.", "es": "Este jarabe es bueno para la tos y estos caramelos pueden ayudar a la garganta.", "de": "Dieser Sirup ist gut gegen den Husten, und diese Bonbons können dem Hals helfen."}'::jsonb,
        '{"character": "Patient", "text": "How often do I take the syrup?", "es": "¿Cada cuánto tomo el jarabe?", "de": "Wie oft nehme ich den Sirup?"}'::jsonb,
        '{"character": "Pharmacist", "text": "Three times a day after food.", "es": "Tres veces al día después de comer.", "de": "Dreimal am Tag nach dem Essen."}'::jsonb,
        '{"character": "Patient", "text": "Thank you. I will take it today.", "es": "Gracias. Lo tomaré hoy.", "de": "Danke. Ich werde es heute nehmen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El paciente tiene tos y dolor de garganta.", "p_de": "Der Patient hat Husten und Halsschmerzen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Dice que tiene mucha fiebre desde hace una semana.", "p_de": "Er sagt, dass er seit einer Woche hohes Fieber hat.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El farmacéutico pregunta por alergias a medicamentos.", "p_de": "Der Apotheker fragt nach Allergien gegen Medikamente.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El farmacéutico recomienda jarabe y caramelos.", "p_de": "Der Apotheker empfiehlt Sirup und Bonbons.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El jarabe se toma tres veces al día después de comer.", "p_de": "Der Sirup wird dreimal am Tag nach dem Essen genommen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué tiene el paciente?", "p_de": "Was hat der Patient?", "s": {"type": "multiple_choice", "options": ["A cough and a sore throat", "A broken tooth", "A leg problem"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["A cough and a sore throat", "A broken tooth", "A leg problem"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["A cough and a sore throat", "A broken tooth", "A leg problem"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde cuándo tiene un poco de fiebre?", "p_de": "Seit wann hat er ein wenig Fieber?", "s": {"type": "multiple_choice", "options": ["Since yesterday", "Since last month", "Since this morning only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Since yesterday", "Since last month", "Since this morning only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Since yesterday", "Since last month", "Since this morning only"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace el farmacéutico?", "p_de": "Welche Frage stellt der Apotheker?", "s": {"type": "multiple_choice", "options": ["Do you have any allergy to medicine?", "Do you have a train ticket?", "Do you need a hotel room?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Do you have any allergy to medicine?", "Do you have a train ticket?", "Do you need a hotel room?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Do you have any allergy to medicine?", "Do you have a train ticket?", "Do you need a hotel room?"], "answer": 0}}'::jsonb,
        '{"p": "¿Con qué frecuencia toma el jarabe?", "p_de": "Wie oft nimmt er den Sirup?", "s": {"type": "multiple_choice", "options": ["Three times a day", "Once a week", "Every hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Three times a day", "Once a week", "Every hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Three times a day", "Once a week", "Every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo toma el jarabe?", "p_de": "Wann nimmt er den Sirup?", "s": {"type": "multiple_choice", "options": ["After food", "Before driving", "At midnight only"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["After food", "Before driving", "At midnight only"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["After food", "Before driving", "At midnight only"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2630 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2630 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2630, 'en', 'dialogue', 'health', '[{"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}, {"name": "Pharmacist", "gender": "male", "avatarURL": "https://example.com/avatars/pharmacist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Explica tus síntomas al farmacéutico', 'Lee un diálogo simple en el que un paciente explica qué le pasa en una farmacia.'),
        (v_dialogue_id, 'de', 'Erkläre dem Apotheker deine Symptome', 'Lies einen einfachen Dialog, in dem ein Patient dem Apotheker erklärt, was ihm fehlt.');

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
