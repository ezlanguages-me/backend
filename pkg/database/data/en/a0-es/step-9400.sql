-- ============================================================
-- Seed: A0 English Path – STEP 9400 – Dialogue – deal with hostile questioning confidently (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a speaker responding calmly to hostile questioning after a project presentation.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a speaker responding calmly to hostile questioning after a project presentation.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are discussing the colour of the presentation slides.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are discussing the colour of the presentation slides.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The questioner demands a direct explanation for the increased budget.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The questioner demands a direct explanation for the increased budget.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speaker explains that supply chain problems raised costs during the project.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speaker explains that supply chain problems raised costs during the project.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The exchange ends when the audience accepts the honest explanation.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The exchange ends when the audience accepts the honest explanation.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a speaker answers a hostile question about the project budget", "an unrelated social chat", "a routine travel update"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the budget explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the budget explanation?", "s": {"type": "multiple_choice", "options": ["Speaker", "the cleaner", "the driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the questioner demands a direct budget explanation", "the room is too cold", "the event starts late"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What answer is given?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What answer is given?", "s": {"type": "multiple_choice", "options": ["supply chain problems caused the extra cost", "the sound system fails", "the audience falls asleep"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the audience accepts the honest explanation", "the topic is cancelled", "everyone leaves without speaking"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9400 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9400 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9400 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9400 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9400 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9400 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9400 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9400 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9400,'en','dialogue','academic','[{"name": "Speaker", "gender": "neutral", "avatarURL": "https://example.com/avatars/speaker.png"}, {"name": "Questioner", "gender": "neutral", "avatarURL": "https://example.com/avatars/questioner.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','deal with hostile questioning confidently','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','deal with hostile questioning confidently','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Speaker', 'I understand your concern, and I will answer the budget question directly.'),
            (v_dialogue_id, 1, 'Questioner', 'Then explain why the project cost much more than you originally promised.'),
            (v_dialogue_id, 2, 'Speaker', 'The main increase came from supply chain delays that forced us to buy key materials later and at higher prices.'),
            (v_dialogue_id, 3, 'Questioner', 'That sounds convenient. Why did you not warn people sooner?'),
            (v_dialogue_id, 4, 'Speaker', 'We informed the board as soon as the pattern was clear, but the numbers changed week by week.'),
            (v_dialogue_id, 5, 'Questioner', 'So you are saying the overrun was real and not the result of poor planning alone?'),
            (v_dialogue_id, 6, 'Speaker', 'Yes, and I am not hiding the mistakes either. We adjusted the plan and reduced other costs where possible.'),
            (v_dialogue_id, 7, 'Questioner', 'I still do not like the result, but your answer is clearer and more honest than I expected.');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: I understand your concern, and I will answer the budget question directly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: I understand your concern, and I will answer the budget question directly."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Questioner: Then explain why the project cost much more than you originally promised."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Questioner: Then explain why the project cost much more than you originally promised."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: The main increase came from supply chain delays that forced us to buy key materials later and at higher prices."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: The main increase came from supply chain delays that forced us to buy key materials later and at higher prices."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Questioner: That sounds convenient. Why did you not warn people sooner?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Questioner: That sounds convenient. Why did you not warn people sooner?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: We informed the board as soon as the pattern was clear, but the numbers changed week by week."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: We informed the board as soon as the pattern was clear, but the numbers changed week by week."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Questioner: So you are saying the overrun was real and not the result of poor planning alone?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Questioner: So you are saying the overrun was real and not the result of poor planning alone?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Speaker: Yes, and I am not hiding the mistakes either. We adjusted the plan and reduced other costs where possible."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Speaker: Yes, and I am not hiding the mistakes either. We adjusted the plan and reduced other costs where possible."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Questioner: I still do not like the result, but your answer is clearer and more honest than I expected."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Questioner: I still do not like the result, but your answer is clearer and more honest than I expected."}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
