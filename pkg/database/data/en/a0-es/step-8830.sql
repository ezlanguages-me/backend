-- ============================================================
-- Seed: A0 English Path – STEP 8830 – Dialogue – argue/complain effectively about most problem areas that are likely to occur (Alquileres)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about the landlord refuses to return the deposit after the tenant leaves the flat.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about the landlord refuses to return the deposit after the tenant leaves the flat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Landlord explains that the tenant has documented all damage with photos and a written report.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Landlord explains that the tenant has documented all damage with photos and a written report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that they agree to a partial refund pending the landlord''s written response.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that they agree to a partial refund pending the landlord''s written response.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the landlord refuses to return the deposit after the tenant leaves the flat", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Landlord", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the tenant has documented all damage with photos and a written report", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the landlord claims the carpet and windows are damaged beyond normal wear", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["they agree to a partial refund pending the landlord''s written response", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8830 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8830 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8830 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8830 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8830 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8830 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8830 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8830 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,8830,'en','dialogue','rental','[{"name": "Customer", "gender": "neutral", "avatarURL": "https://example.com/avatars/customer.png"}, {"name": "Landlord", "gender": "neutral", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','argue/complain effectively about most problem areas that are likely to occur','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','argue/complain effectively about most problem areas that are likely to occur','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Customer', 'I need help because the landlord refuses to return the deposit after the tenant leaves the flat.'),
            (v_dialogue_id, 1, 'Landlord', 'Of course. We are discussing this in a flat rental office and phone call, so I can explain the situation clearly.'),
            (v_dialogue_id, 2, 'Landlord', 'One important detail is that the tenant has documented all damage with photos and a written report.'),
            (v_dialogue_id, 3, 'Landlord', 'A counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear.'),
            (v_dialogue_id, 4, 'Customer', 'Yes, and I want to know the safest next step.'),
            (v_dialogue_id, 5, 'Landlord', 'After checking the details, the result is that they agree to a partial refund pending the landlord''s written response.'),
            (v_dialogue_id, 6, 'Customer', 'Thank you. That sounds fair and clear.'),
            (v_dialogue_id, 7, 'Landlord', 'You are welcome. Remember: "A clear record protects both landlord and tenant."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: I need help because the landlord refuses to return the deposit after the tenant leaves the flat."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: I need help because the landlord refuses to return the deposit after the tenant leaves the flat."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Landlord: Of course. We are discussing this in a flat rental office and phone call, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Landlord: Of course. We are discussing this in a flat rental office and phone call, so I can explain the situation clearly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Landlord: One important detail is that the tenant has documented all damage with photos and a written report."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Landlord: One important detail is that the tenant has documented all damage with photos and a written report."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Landlord: A counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Landlord: A counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Yes, and I want to know the safest next step."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Landlord: After checking the details, the result is that they agree to a partial refund pending the landlord''s written response."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Landlord: After checking the details, the result is that they agree to a partial refund pending the landlord''s written response."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Customer: Thank you. That sounds fair and clear."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Landlord: You are welcome. Remember: \"A clear record protects both landlord and tenant.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Landlord: You are welcome. Remember: \"A clear record protects both landlord and tenant.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
