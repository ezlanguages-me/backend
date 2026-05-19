-- ============================================================
-- Seed: A0 English Path – STEP 7420 – Dialogue – discuss agenda items (Reuniones y Presentaciones)
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
        '{"character": "Maya", "text": "Can we start with the visitor email?", "es": "¿Podemos empezar con el correo para visitantes?", "de": "Können wir mit der Besucher-E-Mail anfangen?"}'::jsonb,
        '{"character": "Alex", "text": "Yes, but first we need the room number.", "es": "Sí, pero primero necesitamos el número de la sala.", "de": "Ja, aber zuerst brauchen wir die Raumnummer."}'::jsonb,
        '{"character": "Maya", "text": "Room C is free at ten.", "es": "La sala C está libre a las diez.", "de": "Raum C ist um zehn frei."}'::jsonb,
        '{"character": "Alex", "text": "Good. Then the email can be item one.", "es": "Bien. Entonces el correo puede ser el punto uno.", "de": "Gut. Dann kann die E-Mail Punkt eins sein."}'::jsonb,
        '{"character": "Maya", "text": "After that, I want to talk about the printer.", "es": "Después quiero hablar de la impresora.", "de": "Danach möchte ich über den Drucker sprechen."}'::jsonb,
        '{"character": "Alex", "text": "I agree. The printer problem is important.", "es": "Estoy de acuerdo. El problema de la impresora es importante.", "de": "Ich stimme zu. Das Druckerproblem ist wichtig."}'::jsonb,
        '{"character": "Maya", "text": "Do we keep the coffee break idea on the agenda?", "es": "¿Mantenemos la idea de la pausa para el café en la agenda?", "de": "Behalten wir die Idee für die Kaffeepause auf der Agenda?"}'::jsonb,
        '{"character": "Alex", "text": "Yes, but only for five minutes.", "es": "Sí, pero solo durante cinco minutos.", "de": "Ja, aber nur für fünf Minuten."}'::jsonb,
        '{"character": "Maya", "text": "Great. I can write the final agenda now.", "es": "Genial. Ahora puedo escribir la agenda final.", "de": "Super. Ich kann jetzt die endgültige Agenda schreiben."}'::jsonb,
        '{"character": "Alex", "text": "Thank you. Please send it before lunch.", "es": "Gracias. Por favor, envíala antes del almuerzo.", "de": "Danke. Bitte schick sie vor dem Mittagessen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El correo para visitantes puede ser el punto uno.", "de": "Die Besucher-E-Mail kann Punkt eins sein.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La sala C está libre a las diez.", "de": "Raum C ist um zehn frei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Maya no quiere hablar de la impresora.", "de": "Maya will nicht über den Drucker sprechen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La idea de la pausa para el café sigue en la agenda durante cinco minutos.", "de": "Die Idee für die Kaffeepause bleibt fünf Minuten auf der Agenda.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Alex pide a Maya que envíe la agenda antes del almuerzo.", "de": "Alex bittet Maya, die Agenda vor dem Mittagessen zu schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Qué puede ser el punto uno?", "de": "Was kann Punkt eins sein?", "s_es": {"type": "multiple_choice", "options": ["The visitor email", "The printer problem", "The coffee break idea"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Besucher-E-Mail", "Das Druckerproblem", "Die Idee für die Kaffeepause"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué necesitan primero?", "de": "Was brauchen sie zuerst?", "s_es": {"type": "multiple_choice", "options": ["The room number", "The visitor list", "The lunch menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Raumnummer", "Die Besucherliste", "Das Mittagsmenü"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué sala está libre?", "de": "Welcher Raum ist frei?", "s_es": {"type": "multiple_choice", "options": ["Room C", "Room A", "Room B"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum C", "Raum A", "Raum B"], "answer": 0}}'::jsonb,
        '{"es": "¿Cómo describe Alex el problema de la impresora?", "de": "Wie beschreibt Alex das Druckerproblem?", "s_es": {"type": "multiple_choice", "options": ["Important", "Funny", "Easy"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Wichtig", "Lustig", "Einfach"], "answer": 0}}'::jsonb,
        '{"es": "¿Quién escribe la agenda final?", "de": "Wer schreibt die endgültige Agenda?", "s_es": {"type": "multiple_choice", "options": ["Maya", "Alex", "The chair"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Maya", "Alex", "Die Leitung"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 7420 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 7420 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7420, 'en', 'dialogue', 'meetings', '[{"name": "Maya", "gender": "female", "avatarURL": "https://example.com/avatars/maya.png"}, {"name": "Alex", "gender": "male", "avatarURL": "https://example.com/avatars/alex.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre puntos de la agenda', 'Lee un diálogo corto donde dos compañeros ordenan los puntos de una agenda de reunión.'),
        (v_dialogue_id, 'de', 'Besprich Agendapunkte', 'Lies einen kurzen Dialog, in dem zwei Kollegen die Punkte einer Meeting-Agenda ordnen.');

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
