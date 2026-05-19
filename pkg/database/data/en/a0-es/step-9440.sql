-- ============================================================
-- Seed: A0 English Path – STEP 9440 – Dialogue – get and hold on to his/her turn to speak (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a participant getting and holding the floor during a panel discussion.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a participant getting and holding the floor during a panel discussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are chatting casually after the event.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are chatting casually after the event.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The participant raises a hand and waits for the moderator to acknowledge the request to speak.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The participant raises a hand and waits for the moderator to acknowledge the request to speak.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Another speaker tries to continue before the participant can make the point.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Another speaker tries to continue before the participant can make the point.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The participant keeps the floor and makes a short relevant contribution.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The participant keeps the floor and makes a short relevant contribution.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a participant politely secures a turn to speak in a panel discussion", "an unrelated social chat", "a routine travel update"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who asks for the floor?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who asks for the floor?", "s": {"type": "multiple_choice", "options": ["Participant", "the cleaner", "the driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the participant raises a hand and waits to be acknowledged", "the room is too cold", "the event starts late"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which difficulty appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which difficulty appears?", "s": {"type": "multiple_choice", "options": ["another speaker tries to continue talking", "the sound system fails", "the audience falls asleep"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the participant makes a short relevant contribution", "the topic is cancelled", "everyone leaves without speaking"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9440 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9440 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9440 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9440 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9440 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9440 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9440 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9440 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9440,'en','dialogue','academic','[{"name": "Participant", "gender": "neutral", "avatarURL": "https://example.com/avatars/participant.png"}, {"name": "Moderator", "gender": "neutral", "avatarURL": "https://example.com/avatars/moderator.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','get and hold on to his/her turn to speak','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','get and hold on to his/her turn to speak','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Participant', 'Excuse me, may I add one point before we move on?'),
            (v_dialogue_id, 1, 'Moderator', 'Yes, I saw your hand. Please go ahead.'),
            (v_dialogue_id, 2, 'Participant', 'Thank you. I want to connect this question to the earlier comment about public funding.'),
            (v_dialogue_id, 3, 'Moderator', 'Please keep it brief because we have little time left.'),
            (v_dialogue_id, 4, 'Participant', 'Of course. My point is that the policy only works if local groups are included from the start.'),
            (v_dialogue_id, 5, 'Moderator', 'All right, that is relevant.'),
            (v_dialogue_id, 6, 'Participant', 'I appreciate the time, because it clarifies the previous argument.'),
            (v_dialogue_id, 7, 'Moderator', 'And you managed to hold the floor politely and effectively.');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: Excuse me, may I add one point before we move on?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: Excuse me, may I add one point before we move on?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Moderator: Yes, I saw your hand. Please go ahead."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Moderator: Yes, I saw your hand. Please go ahead."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: Thank you. I want to connect this question to the earlier comment about public funding."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: Thank you. I want to connect this question to the earlier comment about public funding."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Moderator: Please keep it brief because we have little time left."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Moderator: Please keep it brief because we have little time left."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: Of course. My point is that the policy only works if local groups are included from the start."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: Of course. My point is that the policy only works if local groups are included from the start."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Moderator: All right, that is relevant."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Moderator: All right, that is relevant."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: I appreciate the time, because it clarifies the previous argument."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: I appreciate the time, because it clarifies the previous argument."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Moderator: And you managed to hold the floor politely and effectively."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Moderator: And you managed to hold the floor politely and effectively."}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
