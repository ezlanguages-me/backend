-- ============================================================
-- Seed: A0 English Path – STEP 5130 – Dialogue – express simple opinions in academic context (Conferencias, Seminarios y Clases)
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
        '{"character": "Ana", "text": "I like group work because we can share ideas.", "es": "Me gusta el trabajo en grupo porque podemos compartir ideas.", "de": "Ich mag Gruppenarbeit, weil wir Ideen teilen können."}'::jsonb,
        '{"character": "Jonas", "text": "Sometimes I agree, but small groups work better for me.", "es": "A veces estoy de acuerdo, pero para mí funcionan mejor los grupos pequeños.", "de": "Manchmal stimme ich zu, aber kleine Gruppen funktionieren für mich besser."}'::jsonb,
        '{"character": "Ana", "text": "Yes, big groups can be slow.", "es": "Sí, los grupos grandes pueden ser lentos.", "de": "Ja, große Gruppen können langsam sein."}'::jsonb,
        '{"character": "Jonas", "text": "I also think clear roles are important.", "es": "También creo que los roles claros son importantes.", "de": "Ich finde auch, dass klare Rollen wichtig sind."}'::jsonb,
        '{"character": "Ana", "text": "I do not agree with groups that have no plan.", "es": "No estoy de acuerdo con los grupos que no tienen plan.", "de": "Ich bin mit Gruppen ohne Plan nicht einverstanden."}'::jsonb,
        '{"character": "Jonas", "text": "Same here. A simple plan makes discussion easier.", "es": "A mí también. Un plan sencillo hace más fácil la discusión.", "de": "Geht mir genauso. Ein einfacher Plan macht die Diskussion leichter."}'::jsonb,
        '{"character": "Ana", "text": "Do you think peer feedback helps at the end?", "es": "¿Crees que la retroalimentación entre compañeros ayuda al final?", "de": "Glaubst du, dass Peer-Feedback am Ende hilft?"}'::jsonb,
        '{"character": "Jonas", "text": "Yes, because we can improve the final version.", "es": "Sí, porque podemos mejorar la versión final.", "de": "Ja, weil wir die Endversion verbessern können."}'::jsonb,
        '{"character": "Ana", "text": "Then maybe our class should use small groups with clear roles.", "es": "Entonces quizá nuestra clase debería usar grupos pequeños con roles claros.", "de": "Dann sollte unsere Klasse vielleicht kleine Gruppen mit klaren Rollen verwenden."}'::jsonb,
        '{"character": "Jonas", "text": "I think that is a good idea.", "es": "Creo que es una buena idea.", "de": "Ich denke, das ist eine gute Idee."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Ana dice que le gusta el trabajo en grupo para compartir ideas.", "p_de": "Ana sagt, dass sie Gruppenarbeit zum Teilen von Ideen mag.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Jonas prefiere grupos muy grandes.", "p_de": "Jonas bevorzugt sehr große Gruppen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Ambos creen que los roles claros son importantes.", "p_de": "Beide denken, dass klare Rollen wichtig sind.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ana está de acuerdo con grupos sin plan.", "p_de": "Ana ist mit Gruppen ohne Plan einverstanden.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Los dos piensan que la retroalimentación final puede ayudar.", "p_de": "Beide denken, dass Feedback am Ende helfen kann.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué le gusta a Ana el trabajo en grupo?", "p_de": "Warum mag Ana Gruppenarbeit?", "s": {"type": "multiple_choice", "options": ["Because people can share ideas", "Because it is always shorter", "Because there is no homework"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué tipo de grupo prefiere Jonas?", "p_de": "Welche Art von Gruppe bevorzugt Jonas?", "s": {"type": "multiple_choice", "options": ["Small groups", "Very large groups", "No groups at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hace una discusión más fácil según Jonas?", "p_de": "Was macht eine Diskussion laut Jonas leichter?", "s": {"type": "multiple_choice", "options": ["A simple plan", "A phone call", "A later library time"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué pregunta hace Ana sobre el final?", "p_de": "Welche Frage stellt Ana über das Ende?", "s": {"type": "multiple_choice", "options": ["Whether peer feedback helps", "Whether the room is open", "Whether lunch is free"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué idea final aceptan los dos?", "p_de": "Welche Schlussidee akzeptieren beide?", "s": {"type": "multiple_choice", "options": ["Small groups with clear roles", "No group work ever again", "Only online exams"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5130 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5130 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5130, 'en', 'dialogue', 'academic', '[{"name": "Ana", "gender": "female", "avatarURL": "https://example.com/avatars/ana.png"}, {"name": "Jonas", "gender": "male", "avatarURL": "https://example.com/avatars/jonas.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Opiniones simples sobre el trabajo en grupo', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Einfache Meinungen über Gruppenarbeit', '');

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
