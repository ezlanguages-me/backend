-- ============================================================
-- Seed: A0 English Path – STEP 8950 – Dialogue – ask questions outside own immediate area of work (e.g. asking for external legal or financial advice) (Servicios Laborales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about the manager contacts the legal team to clarify the liability clause in a contract.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about the manager contacts the legal team to clarify the liability clause in a contract.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Legal Adviser explains that the clause limits the company''s liability to the value of the original contract.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Legal Adviser explains that the clause limits the company''s liability to the value of the original contract.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the adviser notes that local law may impose additional obligations.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the adviser notes that local law may impose additional obligations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the manager requests a written summary before signing the agreement.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the manager requests a written summary before signing the agreement.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the manager contacts the legal team to clarify the liability clause in a contract", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Legal Adviser", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the clause limits the company''s liability to the value of the original contract", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the adviser notes that local law may impose additional obligations", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the manager requests a written summary before signing the agreement", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8950 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8950 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8950 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8950 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8950 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8950 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8950 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8950 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,8950,'en','dialogue','professional','[{"name": "Customer", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Legal Adviser", "gender": "neutral", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','ask questions outside own immediate area of work (e.g. asking for external legal or financial advice)','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','ask questions outside own immediate area of work (e.g. asking for external legal or financial advice)','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Customer', 'I need help because the manager contacts the legal team to clarify the liability clause in a contract.'),
            (v_dialogue_id, 1, 'Legal Adviser', 'Of course. We are discussing this in a corporate legal office, so I can explain the situation clearly.'),
            (v_dialogue_id, 2, 'Legal Adviser', 'One important detail is that the clause limits the company''s liability to the value of the original contract.'),
            (v_dialogue_id, 3, 'Legal Adviser', 'A counterpoint is that the adviser notes that local law may impose additional obligations.'),
            (v_dialogue_id, 4, 'Customer', 'Yes, and I want to know the safest next step.'),
            (v_dialogue_id, 5, 'Legal Adviser', 'After checking the details, the result is that the manager requests a written summary before signing the agreement.'),
            (v_dialogue_id, 6, 'Customer', 'Thank you. That sounds fair and clear.'),
            (v_dialogue_id, 7, 'Legal Adviser', 'You are welcome. Remember: "Seek expert advice before committing to a legal obligation."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: I need help because the manager contacts the legal team to clarify the liability clause in a contract."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: I need help because the manager contacts the legal team to clarify the liability clause in a contract."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Legal Adviser: Of course. We are discussing this in a corporate legal office, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Legal Adviser: Of course. We are discussing this in a corporate legal office, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Legal Adviser: One important detail is that the clause limits the company''s liability to the value of the original contract."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Legal Adviser: One important detail is that the clause limits the company''s liability to the value of the original contract."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Legal Adviser: A counterpoint is that the adviser notes that local law may impose additional obligations."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Legal Adviser: A counterpoint is that the adviser notes that local law may impose additional obligations."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Legal Adviser: After checking the details, the result is that the manager requests a written summary before signing the agreement."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Legal Adviser: After checking the details, the result is that the manager requests a written summary before signing the agreement."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Legal Adviser: You are welcome. Remember: \"Seek expert advice before committing to a legal obligation.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Legal Adviser: You are welcome. Remember: \"Seek expert advice before committing to a legal obligation.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
