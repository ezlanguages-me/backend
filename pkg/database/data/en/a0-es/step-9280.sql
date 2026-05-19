-- ============================================================
-- Seed: A0 English Path – STEP 9280 – Dialogue – rebut criticisms without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about the presenter responding to criticism without causing offence.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about the presenter responding to criticism without causing offence.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are discussing a holiday brochure.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are discussing a holiday brochure.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Presenter explains that a larger study was not feasible at that stage.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Presenter explains that a larger study was not feasible at that stage.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The critic questions the sample size and the strength of the conclusion.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The critic questions the sample size and the strength of the conclusion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Both speakers agree that the findings are useful within clear limitations.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Both speakers agree that the findings are useful within clear limitations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the presenter responds to a criticism of her research methodology", "an unrelated social chat", "a routine travel update"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the key explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the key explanation?", "s": {"type": "multiple_choice", "options": ["Presenter", "the cleaner", "the driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["a larger study was not feasible at that stage", "the room is too cold", "the event starts late"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which concern is raised?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which concern is raised?", "s": {"type": "multiple_choice", "options": ["the critic questions the sample size and the conclusion", "the sound system fails", "the audience falls asleep"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the findings are useful within clear limitations", "the topic is cancelled", "everyone leaves without speaking"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9280 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9280 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9280 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9280 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9280 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9280 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9280 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9280 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9280,'en','dialogue','academic','[{"name": "Presenter", "gender": "neutral", "avatarURL": "https://example.com/avatars/presenter.png"}, {"name": "Critic", "gender": "neutral", "avatarURL": "https://example.com/avatars/critic.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','rebut criticisms without causing offence','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','rebut criticisms without causing offence','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Presenter', 'Thank you for the question about my methodology.'),
            (v_dialogue_id, 1, 'Critic', 'I am concerned that the sample size is too small to support such a strong conclusion.'),
            (v_dialogue_id, 2, 'Presenter', 'That is a fair concern, and I agree that a larger sample would have strengthened the study.'),
            (v_dialogue_id, 3, 'Critic', 'Then why did you not expand the project before presenting the findings?'),
            (v_dialogue_id, 4, 'Presenter', 'At this stage, a larger study was not feasible because of time and funding limits.'),
            (v_dialogue_id, 5, 'Critic', 'I appreciate the clarification, especially if the limitations are made explicit.'),
            (v_dialogue_id, 6, 'Presenter', 'Exactly, and within those limits the findings still offer a useful starting point.'),
            (v_dialogue_id, 7, 'Critic', 'In that case, your response turns the criticism into a constructive discussion.');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Presenter: Thank you for the question about my methodology."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Presenter: Thank you for the question about my methodology."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: I am concerned that the sample size is too small to support such a strong conclusion."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: I am concerned that the sample size is too small to support such a strong conclusion."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Presenter: That is a fair concern, and I agree that a larger sample would have strengthened the study."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Presenter: That is a fair concern, and I agree that a larger sample would have strengthened the study."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: Then why did you not expand the project before presenting the findings?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: Then why did you not expand the project before presenting the findings?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Presenter: At this stage, a larger study was not feasible because of time and funding limits."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Presenter: At this stage, a larger study was not feasible because of time and funding limits."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: I appreciate the clarification, especially if the limitations are made explicit."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: I appreciate the clarification, especially if the limitations are made explicit."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Presenter: Exactly, and within those limits the findings still offer a useful starting point."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Presenter: Exactly, and within those limits the findings still offer a useful starting point."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: In that case, your response turns the criticism into a constructive discussion."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: In that case, your response turns the criticism into a constructive discussion."}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
