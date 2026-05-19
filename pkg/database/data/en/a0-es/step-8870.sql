-- ============================================================
-- Seed: A0 English Path – STEP 8870 – Dialogue – understand a tenancy agreement in detail, e.g. technical details and their legal implications (Alquileres)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about the agent explains that subletting is not permitted without written consent.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about the agent explains that subletting is not permitted without written consent.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Agent explains that the break clause allows early termination with two months'' notice.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Agent explains that the break clause allows early termination with two months'' notice.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the tenant questions whether the inventory list is legally binding.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the tenant questions whether the inventory list is legally binding.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that both parties sign the agreement once the disputed clause is amended.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that both parties sign the agreement once the disputed clause is amended.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the agent explains that subletting is not permitted without written consent", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Agent", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the break clause allows early termination with two months'' notice", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the tenant questions whether the inventory list is legally binding", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["both parties sign the agreement once the disputed clause is amended", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8870 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8870 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8870 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8870 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8870 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8870 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8870 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8870 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,8870,'en','dialogue','rental','[{"name": "Customer", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Agent", "gender": "neutral", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','understand a tenancy agreement in detail, e.g. technical details and their legal implications','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','understand a tenancy agreement in detail, e.g. technical details and their legal implications','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Customer', 'I need help because the agent explains that subletting is not permitted without written consent.'),
            (v_dialogue_id, 1, 'Agent', 'Of course. We are discussing this in a letting agency office, so I can explain the situation clearly.'),
            (v_dialogue_id, 2, 'Agent', 'One important detail is that the break clause allows early termination with two months'' notice.'),
            (v_dialogue_id, 3, 'Agent', 'A counterpoint is that the tenant questions whether the inventory list is legally binding.'),
            (v_dialogue_id, 4, 'Customer', 'Yes, and I want to know the safest next step.'),
            (v_dialogue_id, 5, 'Agent', 'After checking the details, the result is that both parties sign the agreement once the disputed clause is amended.'),
            (v_dialogue_id, 6, 'Customer', 'Thank you. That sounds fair and clear.'),
            (v_dialogue_id, 7, 'Agent', 'You are welcome. Remember: "Read every clause before you sign."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: I need help because the agent explains that subletting is not permitted without written consent."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: I need help because the agent explains that subletting is not permitted without written consent."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Agent: Of course. We are discussing this in a letting agency office, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Agent: Of course. We are discussing this in a letting agency office, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Agent: One important detail is that the break clause allows early termination with two months'' notice."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Agent: One important detail is that the break clause allows early termination with two months'' notice."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Agent: A counterpoint is that the tenant questions whether the inventory list is legally binding."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Agent: A counterpoint is that the tenant questions whether the inventory list is legally binding."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Agent: After checking the details, the result is that both parties sign the agreement once the disputed clause is amended."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Agent: After checking the details, the result is that both parties sign the agreement once the disputed clause is amended."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Agent: You are welcome. Remember: \"Read every clause before you sign.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Agent: You are welcome. Remember: \"Read every clause before you sign.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
