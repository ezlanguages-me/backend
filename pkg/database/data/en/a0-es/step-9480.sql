-- ============================================================
-- Seed: A0 English Path – STEP 9480 – Dialogue – rebut counter-arguments (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a researcher rebutting a counter-argument with evidence at a symposium.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a researcher rebutting a counter-argument with evidence at a symposium.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are debating travel plans for next month.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are debating travel plans for next month.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The researcher refers to data showing long-term savings for larger institutions.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The researcher refers to data showing long-term savings for larger institutions.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The critic argues that the short-term cost remains too high for many organisations.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The critic argues that the short-term cost remains too high for many organisations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Both speakers accept that the proposal is strongest when supported by clear evidence.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Both speakers accept that the proposal is strongest when supported by clear evidence.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a researcher answers a counter-argument about short-term costs", "an unrelated social chat", "a routine travel update"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who provides the supporting data?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who provides the supporting data?", "s": {"type": "multiple_choice", "options": ["Researcher", "the cleaner", "the driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["data showing long-term savings", "the room is too cold", "the event starts late"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which objection appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which objection appears?", "s": {"type": "multiple_choice", "options": ["the short-term cost is too high for many organisations", "the sound system fails", "the audience falls asleep"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["clear evidence makes the proposal stronger", "the topic is cancelled", "everyone leaves without speaking"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9480 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9480 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9480 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9480 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9480 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9480 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9480 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9480 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9480,'en','dialogue','academic','[{"name": "Researcher", "gender": "neutral", "avatarURL": "https://example.com/avatars/researcher.png"}, {"name": "Critic", "gender": "neutral", "avatarURL": "https://example.com/avatars/critic.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','rebut counter-arguments','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','rebut counter-arguments','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Researcher', 'I understand the concern about cost, but the long-term data tells a more complete story.'),
            (v_dialogue_id, 1, 'Critic', 'The problem is that many organisations cannot afford the short-term investment.'),
            (v_dialogue_id, 2, 'Researcher', 'That is true for some cases, yet our figures show significant savings after the second year.'),
            (v_dialogue_id, 3, 'Critic', 'Those savings may matter later, but the initial barrier is still serious.'),
            (v_dialogue_id, 4, 'Researcher', 'Which is why we recommend phased adoption for institutions with tighter budgets.'),
            (v_dialogue_id, 5, 'Critic', 'So your position is not that the cost disappears, but that it can be managed strategically.'),
            (v_dialogue_id, 6, 'Researcher', 'Exactly, and the evidence is strongest where decision-makers consider both short-term cost and long-term benefit.'),
            (v_dialogue_id, 7, 'Critic', 'That is a stronger answer because it responds directly to the counter-argument.');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Researcher: I understand the concern about cost, but the long-term data tells a more complete story."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Researcher: I understand the concern about cost, but the long-term data tells a more complete story."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: The problem is that many organisations cannot afford the short-term investment."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: The problem is that many organisations cannot afford the short-term investment."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Researcher: That is true for some cases, yet our figures show significant savings after the second year."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Researcher: That is true for some cases, yet our figures show significant savings after the second year."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: Those savings may matter later, but the initial barrier is still serious."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: Those savings may matter later, but the initial barrier is still serious."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Researcher: Which is why we recommend phased adoption for institutions with tighter budgets."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Researcher: Which is why we recommend phased adoption for institutions with tighter budgets."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: So your position is not that the cost disappears, but that it can be managed strategically."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: So your position is not that the cost disappears, but that it can be managed strategically."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Researcher: Exactly, and the evidence is strongest where decision-makers consider both short-term cost and long-term benefit."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Researcher: Exactly, and the evidence is strongest where decision-makers consider both short-term cost and long-term benefit."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Critic: That is a stronger answer because it responds directly to the counter-argument."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Critic: That is a stronger answer because it responds directly to the counter-argument."}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
