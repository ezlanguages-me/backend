-- ============================================================
-- Seed: A0 English Path – STEP 5460 – Dialogue – take turns in a discussion (Conferencias, Seminarios y Clases)
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
        '{"character": "Nora", "text": "Can I add something about the quiet room?", "es": "¿Puedo añadir algo sobre la sala silenciosa?", "de": "Kann ich etwas zum stillen Raum hinzufügen?"}'::jsonb,
        '{"character": "Iker", "text": "Yes, go ahead.", "es": "Sí, adelante.", "de": "Ja, bitte."}'::jsonb,
        '{"character": "Nora", "text": "I think it works well for reading, but not for group tasks.", "es": "Creo que funciona bien para leer, pero no para tareas en grupo.", "de": "Ich denke, er funktioniert gut zum Lesen, aber nicht für Gruppenaufgaben."}'::jsonb,
        '{"character": "Iker", "text": "That makes sense. In my view, the cafe is better for short group meetings.", "es": "Tiene sentido. En mi opinión, la cafetería es mejor para reuniones breves de grupo.", "de": "Das ergibt Sinn. Meiner Ansicht nach ist das Café besser für kurze Gruppentreffen."}'::jsonb,
        '{"character": "Nora", "text": "I agree with that. The problem is the noise after lunch.", "es": "Estoy de acuerdo con eso. El problema es el ruido después de comer.", "de": "Dem stimme ich zu. Das Problem ist der Lärm nach dem Mittagessen."}'::jsonb,
        '{"character": "Iker", "text": "True. Maybe the lab is the middle option.", "es": "Es verdad. Quizá el laboratorio sea la opción intermedia.", "de": "Stimmt. Vielleicht ist das Labor die Zwischenlösung."}'::jsonb,
        '{"character": "Nora", "text": "Good point. It is quieter than the cafe and more social than the quiet room.", "es": "Buen punto. Es más silencioso que la cafetería y más social que la sala silenciosa.", "de": "Guter Punkt. Es ist ruhiger als das Café und sozialer als der stille Raum."}'::jsonb,
        '{"character": "Iker", "text": "Should we ask the rest of the group what they think?", "es": "¿Deberíamos preguntar al resto del grupo qué piensa?", "de": "Sollen wir den Rest der Gruppe fragen, was sie denkt?"}'::jsonb,
        '{"character": "Nora", "text": "Yes, that would keep the discussion open.", "es": "Sí, eso mantendría abierta la discusión.", "de": "Ja, das würde die Diskussion offen halten."}'::jsonb,
        '{"character": "Iker", "text": "Okay, who wants to speak next?", "es": "Vale, ¿quién quiere hablar ahora?", "de": "Okay, wer möchte als Nächstes sprechen?"}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Nora pide turno para añadir una idea.", "p_de": "Nora bittet um das Wort, um eine Idee hinzuzufügen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Iker dice que la sala silenciosa es ideal para trabajos en grupo.", "p_de": "Iker sagt, dass der stille Raum ideal für Gruppenarbeit ist.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Nora cree que la cafetería tiene ruido después de comer.", "p_de": "Nora findet, dass das Café nach dem Mittagessen laut ist.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Los dos consideran el laboratorio como opción intermedia.", "p_de": "Beide sehen das Labor als Zwischenlösung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Al final quieren dar la palabra a otra persona.", "p_de": "Am Ende wollen sie einer anderen Person das Wort geben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Para qué pide turno Nora?", "p_de": "Wofür bittet Nora um das Wort?", "s": {"type": "multiple_choice", "options": ["To add something about the quiet room", "To leave the class", "To print the notes"], "answer": 0}}'::jsonb,
        '{"p": "¿Para qué lugar prefiere Iker las reuniones breves?", "p_de": "Welchen Ort bevorzugt Iker für kurze Treffen?", "s": {"type": "multiple_choice", "options": ["The cafe", "The quiet room", "The office hall"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema menciona Nora del café?", "p_de": "Welches Problem des Cafés nennt Nora?", "s": {"type": "multiple_choice", "options": ["Noise after lunch", "No chairs", "No coffee"], "answer": 0}}'::jsonb,
        '{"p": "¿Cómo describen el laboratorio?", "p_de": "Wie beschreiben sie das Labor?", "s": {"type": "multiple_choice", "options": ["As a middle option", "As the noisiest place", "As a closed space"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace Iker al final?", "p_de": "Was macht Iker am Ende?", "s": {"type": "multiple_choice", "options": ["Invites the next speaker", "Ends the seminar forever", "Calls the conference desk"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5460 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5460 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5460, 'en', 'dialogue', 'academic', '[{"name": "Nora", "gender": "female", "avatarURL": "https://example.com/avatars/nora.png"}, {"name": "Iker", "gender": "male", "avatarURL": "https://example.com/avatars/iker.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Tomar turnos en una discusión', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Sich in einer Diskussion abwechseln', '');

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
