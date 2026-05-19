-- ============================================================
-- Seed: A0 English Path – STEP 5500 – Dialogue – express simple opinions using expressions such as I dont agree (Conferencias, Seminarios y Clases)
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
        '{"character": "Sofia", "text": "I think all lectures should be recorded.", "es": "Creo que todas las clases deberían grabarse.", "de": "Ich denke, alle Vorlesungen sollten aufgezeichnet werden."}'::jsonb,
        '{"character": "Raul", "text": "I do not agree. Some students may stop coming.", "es": "No estoy de acuerdo. Algunos estudiantes pueden dejar de venir.", "de": "Ich bin nicht einverstanden. Einige Studierende kommen dann vielleicht nicht mehr."}'::jsonb,
        '{"character": "Sofia", "text": "But recordings help when someone is ill.", "es": "Pero las grabaciones ayudan cuando alguien está enfermo.", "de": "Aber Aufzeichnungen helfen, wenn jemand krank ist."}'::jsonb,
        '{"character": "Raul", "text": "That is true, but live discussion is important too.", "es": "Eso es verdad, pero la discusión en directo también es importante.", "de": "Das stimmt, aber die Diskussion vor Ort ist auch wichtig."}'::jsonb,
        '{"character": "Sofia", "text": "Maybe the teacher can record only the main lecture part.", "es": "Quizá el profesor pueda grabar solo la parte principal de la clase.", "de": "Vielleicht kann die Lehrkraft nur den Hauptteil der Vorlesung aufzeichnen."}'::jsonb,
        '{"character": "Raul", "text": "I agree with that more.", "es": "Con eso estoy más de acuerdo.", "de": "Damit bin ich eher einverstanden."}'::jsonb,
        '{"character": "Sofia", "text": "Then students still come for discussion and questions.", "es": "Así los estudiantes siguen viniendo para la discusión y las preguntas.", "de": "Dann kommen die Studierenden trotzdem für Diskussion und Fragen."}'::jsonb,
        '{"character": "Raul", "text": "Yes, that sounds balanced.", "es": "Sí, eso suena equilibrado.", "de": "Ja, das klingt ausgewogen."}'::jsonb,
        '{"character": "Sofia", "text": "So we do not have the same opinion, but we have a shared idea now.", "es": "Entonces no tenemos la misma opinión, pero ahora tenemos una idea común.", "de": "Wir haben also nicht dieselbe Meinung, aber jetzt eine gemeinsame Idee."}'::jsonb,
        '{"character": "Raul", "text": "Exactly.", "es": "Exacto.", "de": "Genau."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Sofia cree que todas las clases deberían grabarse.", "p_de": "Sofia denkt, dass alle Vorlesungen aufgezeichnet werden sollten.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Raul está de acuerdo desde el primer momento.", "p_de": "Raul stimmt von Anfang an zu.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Sofia dice que las grabaciones ayudan cuando alguien está enfermo.", "p_de": "Sofia sagt, dass Aufzeichnungen helfen, wenn jemand krank ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Raul cree que la discusión en directo también importa.", "p_de": "Raul denkt, dass die Diskussion vor Ort ebenfalls wichtig ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al final comparten una idea más equilibrada.", "p_de": "Am Ende teilen sie eine ausgewogenere Idee.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué expresión usa Raul para mostrar desacuerdo?", "p_de": "Welchen Ausdruck benutzt Raul für Widerspruch?", "s": {"type": "multiple_choice", "options": ["I do not agree", "I am ready", "I can repeat it"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué razón da Sofia a favor de las grabaciones?", "p_de": "Welchen Grund nennt Sofia für Aufzeichnungen?", "s": {"type": "multiple_choice", "options": ["They help when someone is ill", "They reduce rent", "They add more bike parking"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué propone Sofia como solución media?", "p_de": "Welche Zwischenlösung schlägt Sofia vor?", "s": {"type": "multiple_choice", "options": ["Record only the main lecture part", "Record no classes at all", "Record the cafeteria menu"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué conservarían los estudiantes según Sofia?", "p_de": "Was würden die Studierenden laut Sofia weiterhin haben?", "s": {"type": "multiple_choice", "options": ["Discussion and questions in class", "No teacher contact", "Only online debates"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo termina la conversación?", "p_de": "Wie endet das Gespräch?", "s": {"type": "multiple_choice", "options": ["With a shared idea", "With a phone complaint", "With no agreement at all"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5500 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5500 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5500, 'en', 'dialogue', 'academic', '[{"name": "Sofia", "gender": "female", "avatarURL": "https://example.com/avatars/sofia.png"}, {"name": "Raul", "gender": "male", "avatarURL": "https://example.com/avatars/raul.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Expresar opiniones simples con desacuerdo', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Einfache Meinungen mit Widerspruch ausdrücken', '');

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
