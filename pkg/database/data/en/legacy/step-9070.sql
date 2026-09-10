-- ============================================================
-- Seed: A0 English Path – STEP 9070 – Dialogue – give detailed information and deal with most routine problems that are likely to arise (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The dialogue is about the team leader explains the system backup procedure step by step.", "p_de": "The dialogue is about the team leader explains the system backup procedure step by step.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers are planning a beach holiday.", "p_de": "The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Team Leader explains that the backup must run every Friday at midnight on the main server.", "p_de": "Team Leader explains that the backup must run every Friday at midnight on the main server.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "A counterpoint is that the colleague asks what to do if the system fails to respond.", "p_de": "A counterpoint is that the colleague asks what to do if the system fails to respond.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the leader provides a written checklist and emergency contact details.", "p_de": "The conclusion is that the leader provides a written checklist and emergency contact details.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["the team leader explains the system backup procedure step by step", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Who gives the main explanation?", "p_de": "Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Team Leader", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Which detail is named?", "p_de": "Which detail is named?", "s": {"type": "multiple_choice", "options": ["the backup must run every Friday at midnight on the main server", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Which counterpoint appears?", "p_de": "Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the colleague asks what to do if the system fails to respond", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "What conclusion do the speakers reach?", "p_de": "What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the leader provides a written checklist and emergency contact details", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9070 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9070 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9070 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9070 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9070 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9070 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9070 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9070 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
        VALUES (v_path_id, 9070, 'en', 'dialogue', 'professional', '[{"name": "Colleague", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Team Leader", "gender": "neutral", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid, language, title) VALUES (v_dialogue_id, 'es', 'Diálogo informativo');
        INSERT INTO dialogue_translation (dialogue_uuid, language, title) VALUES (v_dialogue_id, 'de', 'Informationsdialog');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Colleague', 'I need help with the system backup procedure.'),
            (v_dialogue_id, 1, 'Team Leader', 'Of course. We are at a server room and IT office, and the backup must run every Friday at midnight on the main server.'),
            (v_dialogue_id, 2, 'Colleague', 'My question is what to do if the system fails to respond.'),
            (v_dialogue_id, 3, 'Team Leader', 'I understand. You are also saying that the colleague asks what to do if the system fails to respond.'),
            (v_dialogue_id, 4, 'Colleague', 'Yes, and I want to know the safest next step.'),
            (v_dialogue_id, 5, 'Team Leader', 'After checking the details, the result is that the leader provides a written checklist and emergency contact details.'),
            (v_dialogue_id, 6, 'Colleague', 'Thank you. That sounds fair and clear.'),
            (v_dialogue_id, 7, 'Team Leader', 'You are welcome. Remember: "A clear procedure prevents costly mistakes."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Colleague: I need help with the system backup procedure."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Colleague: I need help with the system backup procedure."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Team Leader: Of course. We are at a server room and IT office, and the backup must run every Friday at midnight on the main server."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Team Leader: Of course. We are at a server room and IT office, and the backup must run every Friday at midnight on the main server."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Colleague: My question is what to do if the system fails to respond."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Colleague: My question is what to do if the system fails to respond."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Team Leader: I understand. You are also saying that the colleague asks what to do if the system fails to respond."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Team Leader: I understand. You are also saying that the colleague asks what to do if the system fails to respond."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Colleague: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Colleague: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Team Leader: After checking the details, the result is that the leader provides a written checklist and emergency contact details."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Team Leader: After checking the details, the result is that the leader provides a written checklist and emergency contact details."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Colleague: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Colleague: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Team Leader: You are welcome. Remember: \"A clear procedure prevents costly mistakes.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Team Leader: You are welcome. Remember: \"A clear procedure prevents costly mistakes.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
