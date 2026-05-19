-- ============================================================
-- Seed: A0 English Path – STEP 2790 – Dialogue – Pregunta por servicios y trámites de salud
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
        '{"character": "Patient", "text": "Hello. I need information about your services.", "es": "Hola. Necesito información sobre sus servicios.", "de": "Hallo. Ich brauche Informationen über Ihre Dienstleistungen."}'::jsonb,
        '{"character": "Clerk", "text": "Of course. We have GP appointments, a nurse clinic, and urgent care.", "es": "Claro. Tenemos citas con el médico, clínica de enfermería y urgent care.", "de": "Natürlich. Wir haben GP-Termine, eine Pflegeklinik und urgent care."}'::jsonb,
        '{"character": "Patient", "text": "What is urgent care for?", "es": "¿Para qué es urgent care?", "de": "Wofür ist urgent care?"}'::jsonb,
        '{"character": "Clerk", "text": "For strong pain, fever, or breathing problems.", "es": "Para dolor fuerte, fiebre o problemas para respirar.", "de": "Für starke Schmerzen, Fieber oder Atemprobleme."}'::jsonb,
        '{"character": "Patient", "text": "Do you have interpreter help?", "es": "¿Tienen ayuda de intérprete?", "de": "Gibt es Dolmetscherhilfe?"}'::jsonb,
        '{"character": "Clerk", "text": "Yes, it is free if you book it first.", "es": "Sí, es gratis si la reserva antes.", "de": "Ja, sie ist kostenlos, wenn Sie sie vorher buchen."}'::jsonb,
        '{"character": "Patient", "text": "What do I need to register?", "es": "¿Qué necesito para registrarme?", "de": "Was brauche ich zur Anmeldung?"}'::jsonb,
        '{"character": "Clerk", "text": "Bring ID, your address, and your health card.", "es": "Traiga su identificación, su dirección y su tarjeta sanitaria.", "de": "Bringen Sie Ihren Ausweis, Ihre Adresse und Ihre Gesundheitskarte mit."}'::jsonb,
        '{"character": "Patient", "text": "Can my daughter use the nurse clinic?", "es": "¿Puede mi hija usar la clínica de enfermería?", "de": "Kann meine Tochter die Pflegeklinik nutzen?"}'::jsonb,
        '{"character": "Clerk", "text": "Yes, with a parent or guardian.", "es": "Sí, con un padre, madre o tutor.", "de": "Ja, mit einem Elternteil oder Erziehungsberechtigten."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El paciente pide información sobre los servicios.", "p_de": "Der Patient bittet um Informationen zu den Dienstleistungen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La empleada dice que urgent care es para dolor fuerte, fiebre o problemas para respirar.", "p_de": "Die Mitarbeiterin sagt, urgent care sei für starke Schmerzen, Fieber oder Atemprobleme.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La ayuda de intérprete es cara y nunca es gratis.", "p_de": "Die Dolmetscherhilfe ist teuer und niemals kostenlos.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Para registrarse hay que llevar identificación, dirección y tarjeta sanitaria.", "p_de": "Zur Anmeldung muss man Ausweis, Adresse und Gesundheitskarte mitbringen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La hija puede usar la clínica de enfermería con un padre, madre o tutor.", "p_de": "Die Tochter kann die Pflegeklinik mit einem Elternteil oder Erziehungsberechtigten nutzen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pregunta hace el paciente sobre urgent care?", "p_de": "Welche Frage stellt der Patient zu urgent care?", "s": {"type": "multiple_choice", "options": ["What is urgent care for?", "How much is urgent care?", "Where is urgent care in London?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["What is urgent care for?", "How much is urgent care?", "Where is urgent care in London?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["What is urgent care for?", "How much is urgent care?", "Where is urgent care in London?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué dice la empleada sobre el intérprete?", "p_de": "Was sagt die Mitarbeiterin über den Dolmetscher?", "s": {"type": "multiple_choice", "options": ["It is free if you book it first", "It is only for doctors", "It is closed today"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["It is free if you book it first", "It is only for doctors", "It is closed today"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["It is free if you book it first", "It is only for doctors", "It is closed today"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debes llevar para registrarte?", "p_de": "Was musst du zur Anmeldung mitbringen?", "s": {"type": "multiple_choice", "options": ["ID, address, and health card", "A suitcase and cash", "A bicycle"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["ID, address, and health card", "A suitcase and cash", "A bicycle"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["ID, address, and health card", "A suitcase and cash", "A bicycle"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién quiere usar la clínica de enfermería?", "p_de": "Wer soll die Pflegeklinik nutzen?", "s": {"type": "multiple_choice", "options": ["The patient’s daughter", "The taxi driver", "The clerk’s sister"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["The patient’s daughter", "The taxi driver", "The clerk’s sister"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["The patient’s daughter", "The taxi driver", "The clerk’s sister"], "answer": 0}}'::jsonb,
        '{"p": "¿Con quién puede usarla?", "p_de": "Mit wem kann sie sie nutzen?", "s": {"type": "multiple_choice", "options": ["With a parent or guardian", "Alone at night", "With a waiter"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["With a parent or guardian", "Alone at night", "With a waiter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["With a parent or guardian", "Alone at night", "With a waiter"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2790 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2790 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2790, 'en', 'dialogue', 'health', '[{"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}, {"name": "Clerk", "gender": "female", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta por servicios y trámites de salud', 'Lee un diálogo simple sobre servicios, registro y derechos básicos en un centro de salud.'),
        (v_dialogue_id, 'de', 'Frage nach Gesundheitsdiensten und Verfahren', 'Lies einen einfachen Dialog über Dienste, Anmeldung und Grundrechte in einem Gesundheitszentrum.');

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
