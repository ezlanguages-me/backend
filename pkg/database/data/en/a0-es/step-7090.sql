-- ============================================================
-- Seed: A0 English Path – STEP 7090 – Dialogue – have a phone conversation about travel plans (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "The dialogue is about a trip to Seville.", "p_de": "The dialogue is about a trip to Seville.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The speakers meet at 05:00 in the morning.", "p_de": "The speakers meet at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The first speaker asks about the travel plan.", "p_de": "The first speaker asks about the travel plan.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The second speaker says they travel by the train.", "p_de": "The second speaker says they travel by the train.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "At the end, both speakers are still confused.", "p_de": "At the end, both speakers are still confused.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Who gives the main information?", "p_de": "Who gives the main information?", "s": {"type": "multiple_choice", "options": ["Friend", "a pilot", "a football player"], "answer": 0}}'::jsonb,
        '{"p": "What time is mentioned?", "p_de": "What time is mentioned?", "s": {"type": "multiple_choice", "options": ["16:00", "05:00", "23:50"], "answer": 0}}'::jsonb,
        '{"p": "Which place is mentioned?", "p_de": "Which place is mentioned?", "s": {"type": "multiple_choice", "options": ["platform 3", "the airport tunnel", "the desert farm"], "answer": 0}}'::jsonb,
        '{"p": "What is the main purpose of the dialogue?", "p_de": "What is the main purpose of the dialogue?", "s": {"type": "multiple_choice", "options": ["the travel plan", "buy a tractor", "find a lost camel"], "answer": 0}}'::jsonb,
        '{"p": "How does the dialogue end?", "p_de": "How does the dialogue end?", "s": {"type": "multiple_choice", "options": ["with the call confirmed", "with a big argument", "with no clear plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7090 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7090 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7090 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7090 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7090 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7090 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7090 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7090 AND path_uuid=v_path_id;
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 7090, 'en', 'dialogue', 'phone_correspondence', '[{"name":"Caller","gender":"neutral","avatarURL":"https://example.com/avatars/caller.png"},{"name":"Friend","gender":"neutral","avatarURL":"https://example.com/avatars/friend.png"}]'::jsonb)RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title) VALUES (v_dialogue_id, 'es', 'Llamada sobre planes de viaje');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title) VALUES (v_dialogue_id, 'de', 'Telefonat über Reisepläne');
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES
        (v_dialogue_id, 0, 'Caller', 'Hi. Are we still travelling to Seville on Friday?'),
        (v_dialogue_id, 1, 'Friend', 'Yes. The time is 16:00.'),
        (v_dialogue_id, 2, 'Caller', 'Great. We can go by train.'),
        (v_dialogue_id, 3, 'Friend', 'Let us meet at platform 3.'),
        (v_dialogue_id, 4, 'Caller', 'Okay. Please bring the mobile tickets.'),
        (v_dialogue_id, 5, 'Friend', 'No problem. I will do it.'),
        (v_dialogue_id, 6, 'Caller', 'Please call again at 15:00.'),
        (v_dialogue_id, 7, 'Friend', 'See you soon.');
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. ¿Seguimos viajando a Seville el Friday?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Reisen wir am Friday noch nach Seville?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. La hora es 16:00."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Die Uhrzeit ist 16:00."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Genial. Podemos ir en train."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Super. Wir können mit train fahren."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Quedemos en platform 3."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Treffen wir uns bei platform 3."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Vale. Por favor, bring the mobile tickets."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Okay. Bitte bring the mobile tickets."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "No hay problema. Lo haré."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Kein Problem. Ich mache es."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Please call again at 15:00."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Please call again at 15:00."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Hasta pronto."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Bis bald."}]}]'::jsonb);
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
