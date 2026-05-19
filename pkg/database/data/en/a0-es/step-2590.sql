-- ============================================================
-- Seed: A0 English Path – STEP 2590 – Dialogue – Explica dónde te duele
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
        '{"character": "Nurse", "text": "Hello. What is the problem?", "es": "Hola. ¿Cuál es el problema?", "de": "Hallo. Was ist das Problem?"}'::jsonb,
        '{"character": "Patient", "text": "It hurts here.", "es": "Me duele aquí.", "de": "Es tut hier weh."}'::jsonb,
        '{"character": "Nurse", "text": "Can you show me?", "es": "¿Puede enseñármelo?", "de": "Können Sie es mir zeigen?"}'::jsonb,
        '{"character": "Patient", "text": "Yes. It is my stomach, on the right side.", "es": "Sí. Es el estómago, en el lado derecho.", "de": "Ja. Es ist mein Magen, auf der rechten Seite."}'::jsonb,
        '{"character": "Nurse", "text": "Did it start today?", "es": "¿Empezó hoy?", "de": "Hat es heute angefangen?"}'::jsonb,
        '{"character": "Patient", "text": "Yes, this morning.", "es": "Sí, esta mañana.", "de": "Ja, heute Morgen."}'::jsonb,
        '{"character": "Nurse", "text": "Do you have a fever?", "es": "¿Tiene fiebre?", "de": "Haben Sie Fieber?"}'::jsonb,
        '{"character": "Patient", "text": "Yes, and I feel sick.", "es": "Sí, y me siento mal.", "de": "Ja, und mir ist schlecht."}'::jsonb,
        '{"character": "Nurse", "text": "Okay. Please sit here. The doctor will see you soon.", "es": "De acuerdo. Por favor, siéntese aquí. El médico la verá pronto.", "de": "Okay. Bitte setzen Sie sich hier. Der Arzt wird Sie bald sehen."}'::jsonb,
        '{"character": "Patient", "text": "Thank you.", "es": "Gracias.", "de": "Danke."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La enfermera pregunta cuál es el problema.", "p_de": "Die Krankenschwester fragt, was das Problem ist.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El paciente dice que le duele el estómago en el lado derecho.", "p_de": "Der Patient sagt, dass der Magen auf der rechten Seite weh tut.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El dolor empezó la semana pasada.", "p_de": "Der Schmerz begann letzte Woche.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El paciente tiene fiebre y se siente mal.", "p_de": "Der Patient hat Fieber und fühlt sich schlecht.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La enfermera manda al paciente a casa inmediatamente.", "p_de": "Die Krankenschwester schickt den Patienten sofort nach Hause.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué parte del cuerpo duele?", "p_de": "Welcher Körperteil tut weh?", "s": {"type": "multiple_choice", "options": ["The stomach", "The foot", "The shoulder"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The stomach", "The foot", "The shoulder"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The stomach", "The foot", "The shoulder"], "answer": 0}}'::jsonb,
        '{"p": "¿En qué lado duele?", "p_de": "Auf welcher Seite tut es weh?", "s": {"type": "multiple_choice", "options": ["On the right side", "On the left side", "On both sides"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["On the right side", "On the left side", "On both sides"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["On the right side", "On the left side", "On both sides"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo empezó?", "p_de": "Wann begann es?", "s": {"type": "multiple_choice", "options": ["This morning", "Yesterday night", "Last month"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["This morning", "Yesterday night", "Last month"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["This morning", "Yesterday night", "Last month"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la enfermera al final?", "p_de": "Was sagt die Krankenschwester am Ende?", "s": {"type": "multiple_choice", "options": ["Please sit here", "Please go outside", "Please call a taxi"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Please sit here", "Please go outside", "Please call a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Please sit here", "Please go outside", "Please call a taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién verá al paciente pronto?", "p_de": "Wer wird den Patienten bald sehen?", "s": {"type": "multiple_choice", "options": ["The doctor", "The pharmacist", "The waiter"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The doctor", "The pharmacist", "The waiter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The doctor", "The pharmacist", "The waiter"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2590 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2590 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2590, 'en', 'dialogue', 'health', '[{"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}, {"name": "Nurse", "gender": "female", "avatarURL": "https://example.com/avatars/nurse.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Explica dónde te duele', 'Lee un diálogo corto en el que un paciente indica con palabras simples y gestos dónde le duele.'),
        (v_dialogue_id, 'de', 'Erkläre, wo es weh tut', 'Lies einen kurzen Dialog, in dem ein Patient mit einfachen Wörtern und Gesten zeigt, wo es weh tut.');

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
