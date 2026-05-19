-- ============================================================
-- Seed: A0 English Path – STEP 2710 – Dialogue – Pregunta cómo tomar un medicamento
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
        '{"character": "Patient", "text": "Hello. How do I take these tablets?", "es": "Hola. ¿Cómo tomo estas pastillas?", "de": "Hallo. Wie nehme ich diese Tabletten?"}'::jsonb,
        '{"character": "Pharmacist", "text": "Take one in the morning and one at night after food.", "es": "Tome una por la mañana y una por la noche después de comer.", "de": "Nehmen Sie eine morgens und eine abends nach dem Essen."}'::jsonb,
        '{"character": "Patient", "text": "Do I take them with water?", "es": "¿Las tomo con agua?", "de": "Nehme ich sie mit Wasser?"}'::jsonb,
        '{"character": "Pharmacist", "text": "Yes, with water. Not with alcohol.", "es": "Sí, con agua. No con alcohol.", "de": "Ja, mit Wasser. Nicht mit Alkohol."}'::jsonb,
        '{"character": "Patient", "text": "For how many days?", "es": "¿Durante cuántos días?", "de": "Für wie viele Tage?"}'::jsonb,
        '{"character": "Pharmacist", "text": "For seven days. Finish all the tablets.", "es": "Durante siete días. Termine todas las pastillas.", "de": "Sieben Tage lang. Beenden Sie alle Tabletten."}'::jsonb,
        '{"character": "Patient", "text": "What if I miss one?", "es": "¿Qué pasa si olvido una?", "de": "Was ist, wenn ich eine vergesse?"}'::jsonb,
        '{"character": "Pharmacist", "text": "Take it later, but do not take two together.", "es": "Tómela más tarde, pero no tome dos juntas.", "de": "Nehmen Sie sie später, aber nicht zwei zusammen."}'::jsonb,
        '{"character": "Patient", "text": "Okay. Morning and night, after food, with water.", "es": "De acuerdo. Mañana y noche, después de comer, con agua.", "de": "Okay. Morgens und abends, nach dem Essen, mit Wasser."}'::jsonb,
        '{"character": "Pharmacist", "text": "Exactly.", "es": "Exactamente.", "de": "Genau."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El paciente pregunta cómo tomar las pastillas.", "p_de": "Der Patient fragt, wie er die Tabletten nehmen soll.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La farmacéutica dice que tome una por la mañana y una por la noche.", "p_de": "Die Apothekerin sagt, er soll morgens und abends je eine nehmen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puede tomarlas con alcohol.", "p_de": "Er kann sie mit Alkohol nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El tratamiento dura siete días y hay que terminar todas las pastillas.", "p_de": "Die Behandlung dauert sieben Tage und man soll alle Tabletten beenden.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Si olvida una, debe tomar dos juntas.", "p_de": "Wenn er eine vergisst, soll er zwei zusammen nehmen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Con qué debe tomar las pastillas?", "p_de": "Womit soll er die Tabletten nehmen?", "s": {"type": "multiple_choice", "options": ["With water", "With juice", "With coffee"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["With water", "With juice", "With coffee"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["With water", "With juice", "With coffee"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuántos días dura el tratamiento?", "p_de": "Wie viele Tage dauert die Behandlung?", "s": {"type": "multiple_choice", "options": ["Seven days", "Two days", "Ten hours"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Seven days", "Two days", "Ten hours"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Seven days", "Two days", "Ten hours"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace sobre una dosis?", "p_de": "Welche Frage stellt er über eine Dosis?", "s": {"type": "multiple_choice", "options": ["What if I miss one?", "Can I open the box?", "Is the room free?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["What if I miss one?", "Can I open the box?", "Is the room free?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["What if I miss one?", "Can I open the box?", "Is the room free?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué resume el paciente al final?", "p_de": "Was fasst der Patient am Ende zusammen?", "s": {"type": "multiple_choice", "options": ["Morning and night, after food, with water", "Only on Sunday", "With alcohol and juice"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Morning and night, after food, with water", "Only on Sunday", "With alcohol and juice"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Morning and night, after food, with water", "Only on Sunday", "With alcohol and juice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué responde la farmacéutica al final?", "p_de": "Was antwortet die Apothekerin am Ende?", "s": {"type": "multiple_choice", "options": ["Exactly", "Maybe tomorrow", "I do not know"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Exactly", "Maybe tomorrow", "I do not know"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Exactly", "Maybe tomorrow", "I do not know"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2710 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2710 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2710, 'en', 'dialogue', 'health', '[{"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}, {"name": "Pharmacist", "gender": "female", "avatarURL": "https://example.com/avatars/pharmacist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta cómo tomar un medicamento', 'Lee un diálogo corto entre un paciente y una farmacéutica sobre instrucciones de medicación.'),
        (v_dialogue_id, 'de', 'Frage, wie man ein Medikament einnimmt', 'Lies einen kurzen Dialog zwischen einem Patienten und einer Apothekerin über Medikamentenanweisungen.');

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
