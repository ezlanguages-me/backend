-- ============================================================
-- Seed: A0 English Path – STEP 9360 – Dialogue – take an active part in most kinds of seminars or tutorials (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a student taking an active part in a university seminar.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a student taking an active part in a university seminar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a sports event.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a sports event.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The student asks whether carbon offset programmes reduce emissions or only move responsibility elsewhere.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The student asks whether carbon offset programmes reduce emissions or only move responsibility elsewhere.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Another participant challenges the interpretation of the data from the seminar reading.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Another participant challenges the interpretation of the data from the seminar reading.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The group agrees that active questions improve the quality of the seminar discussion.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The group agrees that active questions improve the quality of the seminar discussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a student asks an informed question about carbon offset programmes in the seminar", "an unrelated social chat", "a routine travel update"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who asks the main question?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who asks the main question?", "s": {"type": "multiple_choice", "options": ["Student", "the cleaner", "the driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the question about carbon offset programmes and real emissions", "the room is too cold", "the event starts late"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which challenge appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which challenge appears?", "s": {"type": "multiple_choice", "options": ["another participant questions the interpretation of the data", "the sound system fails", "the audience falls asleep"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["active questions improve the seminar discussion", "the topic is cancelled", "everyone leaves without speaking"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9360 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9360 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9360 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9360 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9360 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9360 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9360 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9360 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9360,'en','dialogue','academic','[{"name": "Student", "gender": "neutral", "avatarURL": "https://example.com/avatars/student.png"}, {"name": "Participant", "gender": "neutral", "avatarURL": "https://example.com/avatars/participant.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','take an active part in most kinds of seminars or tutorials','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','take an active part in most kinds of seminars or tutorials','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Student', 'Could I ask whether carbon offset programmes reduce emissions or simply move responsibility elsewhere?'),
            (v_dialogue_id, 1, 'Participant', 'That is an important question because the article presents offsets as a clear solution.'),
            (v_dialogue_id, 2, 'Student', 'I noticed that, but some of the evidence seems to depend on how the results are interpreted.'),
            (v_dialogue_id, 3, 'Participant', 'I agree, and I think the author may be too optimistic about the long-term effect.'),
            (v_dialogue_id, 4, 'Student', 'So perhaps the real issue is which programmes create measurable change.'),
            (v_dialogue_id, 5, 'Participant', 'Yes, and that is why your question helps the seminar move beyond a simple summary.'),
            (v_dialogue_id, 6, 'Student', 'I am glad, because I want to contribute rather than just repeat the text.'),
            (v_dialogue_id, 7, 'Participant', 'That kind of active participation makes the discussion useful for everyone.');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Student: Could I ask whether carbon offset programmes reduce emissions or simply move responsibility elsewhere?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Student: Could I ask whether carbon offset programmes reduce emissions or simply move responsibility elsewhere?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: That is an important question because the article presents offsets as a clear solution."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: That is an important question because the article presents offsets as a clear solution."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Student: I noticed that, but some of the evidence seems to depend on how the results are interpreted."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Student: I noticed that, but some of the evidence seems to depend on how the results are interpreted."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: I agree, and I think the author may be too optimistic about the long-term effect."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: I agree, and I think the author may be too optimistic about the long-term effect."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Student: So perhaps the real issue is which programmes create measurable change."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Student: So perhaps the real issue is which programmes create measurable change."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: Yes, and that is why your question helps the seminar move beyond a simple summary."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: Yes, and that is why your question helps the seminar move beyond a simple summary."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Student: I am glad, because I want to contribute rather than just repeat the text."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Student: I am glad, because I want to contribute rather than just repeat the text."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Participant: That kind of active participation makes the discussion useful for everyone."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Participant: That kind of active participation makes the discussion useful for everyone."}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
