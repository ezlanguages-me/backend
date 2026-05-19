-- ============================================================
-- Seed: A0 English Path – STEP 9320 – Dialogue – make critical remarks / express disagreement without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a delegate expressing disagreement politely during a conference discussion.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a delegate expressing disagreement politely during a conference discussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are choosing food for the conference dinner.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are choosing food for the conference dinner.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Delegate mentions a conflicting study published in the same year.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Delegate mentions a conflicting study published in the same year.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speaker acknowledges the point and explains the limits of the original claim.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speaker acknowledges the point and explains the limits of the original claim.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Both speakers agree that the claim should be stated more carefully.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Both speakers agree that the claim should be stated more carefully.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a delegate politely challenges a claim made in the keynote address", "an unrelated social chat", "a routine travel update"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who introduces the conflicting evidence?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who introduces the conflicting evidence?", "s": {"type": "multiple_choice", "options": ["Delegate", "the cleaner", "the driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["a conflicting study from the same year", "the room is too cold", "the event starts late"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What response does the speaker give?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What response does the speaker give?", "s": {"type": "multiple_choice", "options": ["the speaker acknowledges the point and qualifies the claim", "the sound system fails", "the audience falls asleep"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the claim should be presented more carefully", "the topic is cancelled", "everyone leaves without speaking"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9320 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9320 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9320 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9320 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9320 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9320 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9320 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9320 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9320,'en','dialogue','academic','[{"name": "Delegate", "gender": "neutral", "avatarURL": "https://example.com/avatars/delegate.png"}, {"name": "Speaker", "gender": "neutral", "avatarURL": "https://example.com/avatars/speaker.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','make critical remarks / express disagreement without causing offence','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','make critical remarks / express disagreement without causing offence','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Delegate', 'May I comment on the claim about universal results?'),
            (v_dialogue_id, 1, 'Speaker', 'Of course. Please go ahead.'),
            (v_dialogue_id, 2, 'Delegate', 'I recently read a study from the same year that reports different findings.'),
            (v_dialogue_id, 3, 'Speaker', 'Thank you for mentioning it. That study uses a related but not identical context.'),
            (v_dialogue_id, 4, 'Delegate', 'So would you say your conclusion should be limited to this specific setting?'),
            (v_dialogue_id, 5, 'Speaker', 'Yes, that is a reasonable clarification, and I do not want to overstate the data.'),
            (v_dialogue_id, 6, 'Delegate', 'I appreciate that nuance because it makes the discussion more precise.'),
            (v_dialogue_id, 7, 'Speaker', 'And it helps the audience see why respectful disagreement improves the session.');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Delegate: May I comment on the claim about universal results?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Delegate: May I comment on the claim about universal results?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: Of course. Please go ahead."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: Of course. Please go ahead."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Delegate: I recently read a study from the same year that reports different findings."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Delegate: I recently read a study from the same year that reports different findings."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: Thank you for mentioning it. That study uses a related but not identical context."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: Thank you for mentioning it. That study uses a related but not identical context."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Delegate: So would you say your conclusion should be limited to this specific setting?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Delegate: So would you say your conclusion should be limited to this specific setting?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: Yes, that is a reasonable clarification, and I do not want to overstate the data."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: Yes, that is a reasonable clarification, and I do not want to overstate the data."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Delegate: I appreciate that nuance because it makes the discussion more precise."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Delegate: I appreciate that nuance because it makes the discussion more precise."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: And it helps the audience see why respectful disagreement improves the session."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: And it helps the audience see why respectful disagreement improves the session."}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
