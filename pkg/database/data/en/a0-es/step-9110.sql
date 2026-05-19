-- ============================================================
-- Seed: A0 English Path – STEP 9110 – Dialogue – advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about the adviser explains the potential legal risks of terminating the contract early.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about the adviser explains the potential legal risks of terminating the contract early.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Adviser explains that the penalty clause requires a payment of twenty percent of the total contract value.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Adviser explains that the penalty clause requires a payment of twenty percent of the total contract value.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the client argues that the supplier failed to meet the agreed deadlines.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the client argues that the supplier failed to meet the agreed deadlines.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that both sides agree to pursue mediation before considering legal action.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that both sides agree to pursue mediation before considering legal action.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the adviser explains the potential legal risks of terminating the contract early", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Adviser", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the penalty clause requires a payment of twenty percent of the total contract value", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the client argues that the supplier failed to meet the agreed deadlines", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["both sides agree to pursue mediation before considering legal action", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9110 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9110 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9110 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9110 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9110 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9110 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9110 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9110 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9110,'en','dialogue','professional','[{"name": "Client", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Adviser", "gender": "neutral", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Client', 'I need help with terminating the contract early.'),
            (v_dialogue_id, 1, 'Adviser', 'Of course. We are at a corporate legal office, and the penalty clause requires a payment of twenty percent of the total contract value.'),
            (v_dialogue_id, 2, 'Client', 'My argument is that the supplier failed to meet the agreed deadlines.'),
            (v_dialogue_id, 3, 'Adviser', 'I understand. You are also saying that the client argues that the supplier failed to meet the agreed deadlines.'),
            (v_dialogue_id, 4, 'Client', 'Yes, and I want to know the safest next step.'),
            (v_dialogue_id, 5, 'Adviser', 'After checking the details, the result is that both sides agree to pursue mediation before considering legal action.'),
            (v_dialogue_id, 6, 'Client', 'Thank you. That sounds fair and clear.'),
            (v_dialogue_id, 7, 'Adviser', 'You are welcome. Remember: "Careful legal advice prevents costly disputes."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Client: I need help with terminating the contract early."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Client: I need help with terminating the contract early."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Adviser: Of course. We are at a corporate legal office, and the penalty clause requires a payment of twenty percent of the total contract value."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Adviser: Of course. We are at a corporate legal office, and the penalty clause requires a payment of twenty percent of the total contract value."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Client: My argument is that the supplier failed to meet the agreed deadlines."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Client: My argument is that the supplier failed to meet the agreed deadlines."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Adviser: I understand. You are also saying that the client argues that the supplier failed to meet the agreed deadlines."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Adviser: I understand. You are also saying that the client argues that the supplier failed to meet the agreed deadlines."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Client: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Client: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Adviser: After checking the details, the result is that both sides agree to pursue mediation before considering legal action."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Adviser: After checking the details, the result is that both sides agree to pursue mediation before considering legal action."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Client: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Client: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Adviser: You are welcome. Remember: \"Careful legal advice prevents costly disputes.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Adviser: You are welcome. Remember: \"Careful legal advice prevents costly disputes.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
