-- ============================================================
-- Seed: A0 English Path – STEP 3230 – Dialogue – report an emergency
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
        '{"character": "Dispatcher", "text": "Emergency services. What is the problem?", "es": "Servicios de emergencia. ¿Cuál es el problema?", "de": "Notruf. Was ist das Problem?"}'::jsonb,
        '{"character": "Witness", "text": "A man fell on the stairs at Central Station.", "es": "Un hombre se cayó en las escaleras de Central Station.", "de": "Ein Mann ist auf der Treppe im Central Station gestürzt."}'::jsonb,
        '{"character": "Dispatcher", "text": "Is he awake?", "es": "¿Está despierto?", "de": "Ist er bei Bewusstsein?"}'::jsonb,
        '{"character": "Witness", "text": "Yes, but he cannot stand and his head hurts.", "es": "Sí, pero no puede ponerse de pie y le duele la cabeza.", "de": "Ja, aber er kann nicht stehen und sein Kopf tut weh."}'::jsonb,
        '{"character": "Dispatcher", "text": "Is there any blood?", "es": "¿Hay sangre?", "de": "Gibt es Blut?"}'::jsonb,
        '{"character": "Witness", "text": "A little blood on his forehead.", "es": "Un poco de sangre en la frente.", "de": "Ein wenig Blut an seiner Stirn."}'::jsonb,
        '{"character": "Dispatcher", "text": "Stay with him and keep other people away.", "es": "Quédese con él y mantenga a las otras personas alejadas.", "de": "Bleiben Sie bei ihm und halten Sie andere Leute fern."}'::jsonb,
        '{"character": "Witness", "text": "Okay. We are next to platform 3 and the ticket office.", "es": "De acuerdo. Estamos junto al andén 3 y la taquilla.", "de": "Okay. Wir sind neben Gleis 3 und dem Fahrkartenschalter."}'::jsonb,
        '{"character": "Dispatcher", "text": "An ambulance is coming now.", "es": "Una ambulancia va ahora mismo.", "de": "Ein Krankenwagen kommt jetzt."}'::jsonb,
        '{"character": "Witness", "text": "Thank you. I will wave to the crew.", "es": "Gracias. Haré señas al equipo.", "de": "Danke. Ich werde dem Team zuwinken."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "Un hombre se cayó en las escaleras de Central Station.", "de": "Ein Mann ist auf der Treppe im Central Station gestürzt.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El hombre puede levantarse y caminar solo.", "de": "Der Mann kann aufstehen und allein gehen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Hay un poco de sangre en la frente.", "de": "Es gibt ein wenig Blut an der Stirn.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El testigo está junto al andén 5.", "de": "Der Zeuge ist bei Gleis 5.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "Ya viene una ambulancia.", "de": "Ein Krankenwagen ist bereits auf dem Weg.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde ocurrió la caída?", "de": "Wo ist der Sturz passiert?", "s_es": {"type": "multiple_choice", "options": ["At Central Station", "At the hospital", "At the bakery"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Central Station", "Im Krankenhaus", "In der Bäckerei"], "answer": 0}}'::jsonb,
        '{"es": "¿Está despierto el hombre?", "de": "Ist der Mann bei Bewusstsein?", "s_es": {"type": "multiple_choice", "options": ["Yes", "No", "Nobody knows"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ja", "Nein", "Niemand weiß es"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué parte del cuerpo le duele?", "de": "Welcher Körperteil tut weh?", "s_es": {"type": "multiple_choice", "options": ["His head", "His arm", "His back"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sein Kopf", "Sein Arm", "Sein Rücken"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde espera el testigo?", "de": "Wo wartet der Zeuge?", "s_es": {"type": "multiple_choice", "options": ["Next to platform 3 and the ticket office", "At platform 1 near the taxi rank", "Inside the train"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Neben Gleis 3 und dem Fahrkartenschalter", "Bei Gleis 1 am Taxistand", "Im Zug"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hará el testigo cuando llegue la ayuda?", "de": "Was wird der Zeuge tun, wenn Hilfe kommt?", "s_es": {"type": "multiple_choice", "options": ["Wave to the crew", "Leave the station", "Call a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dem Team zuwinken", "Den Bahnhof verlassen", "Ein Taxi rufen"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 3230 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM listening WHERE step_order = 3230 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM dialogue WHERE step_order = 3230 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM speaking WHERE step_order = 3230 AND path_uuid = v_path_id
        UNION
        SELECT uuid FROM writing WHERE step_order = 3230 AND path_uuid = v_path_id
    );
    DELETE FROM dialogue WHERE step_order = 3230 AND path_uuid = v_path_id;
    DELETE FROM speaking WHERE step_order = 3230 AND path_uuid = v_path_id;
    DELETE FROM listening WHERE step_order = 3230 AND path_uuid = v_path_id;
    DELETE FROM reading WHERE step_order = 3230 AND path_uuid = v_path_id;
    DELETE FROM writing WHERE step_order = 3230 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3230, 'en', 'dialogue', 'emergency', '[{"name": "Dispatcher", "gender": "female", "avatarURL": "https://example.com/avatars/dispatcher.png"}, {"name": "Witness", "gender": "male", "avatarURL": "https://example.com/avatars/witness.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Informa de una emergencia en la estación', 'Lee un diálogo corto entre un testigo y una operadora después de una caída en una estación.'),
        (v_dialogue_id, 'de', 'Melde einen Notfall am Bahnhof', 'Lies einen kurzen Dialog zwischen einem Zeugen und einer Einsatzkraft nach einem Sturz im Bahnhof.');

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
