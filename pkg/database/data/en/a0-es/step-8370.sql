-- ============================================================
-- Seed: A0 English Path – STEP 8370 – Dialogue – debate a topic (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about whether phones should be banned in seminars.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about whether phones should be banned in seminars.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Diego explains that one side argues for attention while the other cites accessibility and quick research.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Diego explains that one side argues for attention while the other cites accessibility and quick research.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the chair asks for evidence instead of slogans.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the chair asks for evidence instead of slogans.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the audience prefers limited use rather than a total ban.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the audience prefers limited use rather than a total ban.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["whether phones should be banned in seminars", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Diego", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["one side argues for attention while the other cites accessibility and quick research", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the chair asks for evidence instead of slogans", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the audience prefers limited use rather than a total ban", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8370 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8370 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8370 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8370 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8370 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8370 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8370 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8370 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,8370,'en','dialogue','academic','[{"name": "Sara", "gender": "female", "avatarURL": "https://example.com/avatars/sara.png"}, {"name": "Diego", "gender": "male", "avatarURL": "https://example.com/avatars/diego.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','debate a topic','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','debate a topic','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Sara', 'Did you read the note about whether phones should be banned in seminars for the student union debate night?'),
            (v_dialogue_id, 1, 'Diego', 'Yes. Owen says that one side argues for attention while the other cites accessibility and quick research'),
            (v_dialogue_id, 2, 'Sara', 'So the counterpoint is that the chair asks for evidence instead of slogans?'),
            (v_dialogue_id, 3, 'Diego', 'Exactly. That is why the argument feels balanced.'),
            (v_dialogue_id, 4, 'Sara', 'What conclusion do they reach in the end?'),
            (v_dialogue_id, 5, 'Diego', 'They conclude that the audience prefers limited use rather than a total ban'),
            (v_dialogue_id, 6, 'Sara', 'That makes the explanation clearer for the seminar.'),
            (v_dialogue_id, 7, 'Diego', 'I agree. The best line is: "A debate is strongest when claims are tested."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Leíste the note about whether phones should be banned in seminars for the student union debate night?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hast du the note about whether phones should be banned in seminars for the student union debate night?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Owen says that one side argues for attention while the other cites accessibility and quick research"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Owen says that one side argues for attention while the other cites accessibility and quick research"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "So the counterpoint is that the chair asks for evidence instead of slogans?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "So the counterpoint is that the chair asks for evidence instead of slogans?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Exacto. That is why the argument feels balanced."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Genau. That is why the argument feels balanced."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿A qué conclusión llegan al final?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Zu welcher Schlussfolgerung kommen sie am Ende?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "They conclude that the audience prefers limited use rather than a total ban"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "They conclude that the audience prefers limited use rather than a total ban"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Eso hace más clara la explicación para el seminario."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Das macht die Erklärung für das Seminar klarer."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Estoy de acuerdo. The best line is: \"A debate is strongest when claims are tested.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich stimme zu. The best line is: \"A debate is strongest when claims are tested.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
