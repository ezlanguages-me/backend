-- ============================================================
-- Seed: A0 English Path – STEP 8990 – Dialogue – answer questions outside own immediate area of work (Servicios Laborales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about the HR officer explains the process for requesting extended leave.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about the HR officer explains the process for requesting extended leave.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: HR Officer explains that the employee must submit a formal written request at least four weeks in advance.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: HR Officer explains that the employee must submit a formal written request at least four weeks in advance.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the officer notes that urgent cases can be handled under a different policy.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the officer notes that urgent cases can be handled under a different policy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the employee submits the request electronically and receives written confirmation.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the employee submits the request electronically and receives written confirmation.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the HR officer explains the process for requesting extended leave", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["HR Officer", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the employee must submit a formal written request at least four weeks in advance", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the officer notes that urgent cases can be handled under a different policy", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the employee submits the request electronically and receives written confirmation", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8990 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8990 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8990 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8990 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8990 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8990 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8990 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8990 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,8990,'en','dialogue','professional','[{"name": "Customer", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "HR Officer", "gender": "neutral", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','answer questions outside own immediate area of work','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','answer questions outside own immediate area of work','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Customer', 'I need help because the HR officer explains the process for requesting extended leave.'),
            (v_dialogue_id, 1, 'HR Officer', 'Of course. We are discussing this in an HR department office, so I can explain the situation clearly.'),
            (v_dialogue_id, 2, 'HR Officer', 'One important detail is that the employee must submit a formal written request at least four weeks in advance.'),
            (v_dialogue_id, 3, 'HR Officer', 'A counterpoint is that the officer notes that urgent cases can be handled under a different policy.'),
            (v_dialogue_id, 4, 'Customer', 'Yes, and I want to know the safest next step.'),
            (v_dialogue_id, 5, 'HR Officer', 'After checking the details, the result is that the employee submits the request electronically and receives written confirmation.'),
            (v_dialogue_id, 6, 'Customer', 'Thank you. That sounds fair and clear.'),
            (v_dialogue_id, 7, 'HR Officer', 'You are welcome. Remember: "Following the correct procedure ensures a fair outcome for everyone."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: I need help because the HR officer explains the process for requesting extended leave."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: I need help because the HR officer explains the process for requesting extended leave."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "HR Officer: Of course. We are discussing this in an HR department office, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "HR Officer: Of course. We are discussing this in an HR department office, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "HR Officer: One important detail is that the employee must submit a formal written request at least four weeks in advance."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "HR Officer: One important detail is that the employee must submit a formal written request at least four weeks in advance."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "HR Officer: A counterpoint is that the officer notes that urgent cases can be handled under a different policy."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "HR Officer: A counterpoint is that the officer notes that urgent cases can be handled under a different policy."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "HR Officer: After checking the details, the result is that the employee submits the request electronically and receives written confirmation."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "HR Officer: After checking the details, the result is that the employee submits the request electronically and receives written confirmation."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "HR Officer: You are welcome. Remember: \"Following the correct procedure ensures a fair outcome for everyone.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "HR Officer: You are welcome. Remember: \"Following the correct procedure ensures a fair outcome for everyone.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
