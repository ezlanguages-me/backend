-- ============================================================
-- Seed: A0 English Path – STEP 8220 – Dialogue – participate in a tutorial discussion (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about whether remote lab sessions should stay after the pilot year.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about whether remote lab sessions should stay after the pilot year.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: Diego explains that supporters say recordings help students review procedures.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Diego explains that supporters say recordings help students review procedures.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that critics worry about weaker teamwork and slower troubleshooting.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that critics worry about weaker teamwork and slower troubleshooting.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the tutorial group supports blended labs rather than fully remote labs.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the tutorial group supports blended labs rather than fully remote labs.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["whether remote lab sessions should stay after the pilot year", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Diego", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["supporters say recordings help students review procedures", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["critics worry about weaker teamwork and slower troubleshooting", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the tutorial group supports blended labs rather than fully remote labs", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8220 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8220 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8220 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8220 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8220 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8220 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8220 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8220 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,8220,'en','dialogue','academic','[{"name": "Sara", "gender": "female", "avatarURL": "https://example.com/avatars/sara.png"}, {"name": "Diego", "gender": "male", "avatarURL": "https://example.com/avatars/diego.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','participate in a tutorial discussion','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','participate in a tutorial discussion','Lies den Dialog und beantworte die Fragen.');
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES
            (v_dialogue_id, 0, 'Sara', 'Did you read the note about whether remote lab sessions should stay after the pilot year for a tutorial on science teaching?'),
            (v_dialogue_id, 1, 'Diego', 'Yes. Dr Chen says that supporters say recordings help students review procedures'),
            (v_dialogue_id, 2, 'Sara', 'So the counterpoint is that critics worry about weaker teamwork and slower troubleshooting?'),
            (v_dialogue_id, 3, 'Diego', 'Exactly. That is why the argument feels balanced.'),
            (v_dialogue_id, 4, 'Sara', 'What conclusion do they reach in the end?'),
            (v_dialogue_id, 5, 'Diego', 'They conclude that the tutorial group supports blended labs rather than fully remote labs'),
            (v_dialogue_id, 6, 'Sara', 'That makes the explanation clearer for the seminar.'),
            (v_dialogue_id, 7, 'Diego', 'I agree. The best line is: "A defendable position responds to the other side."');
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Leíste the note about whether remote lab sessions should stay after the pilot year for a tutorial on science teaching?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hast du the note about whether remote lab sessions should stay after the pilot year for a tutorial on science teaching?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Dr Chen says that supporters say recordings help students review procedures"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Dr Chen says that supporters say recordings help students review procedures"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "So the counterpoint is that critics worry about weaker teamwork and slower troubleshooting?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "So the counterpoint is that critics worry about weaker teamwork and slower troubleshooting?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Exacto. That is why the argument feels balanced."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Genau. That is why the argument feels balanced."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿A qué conclusión llegan al final?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Zu welcher Schlussfolgerung kommen sie am Ende?"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "They conclude that the tutorial group supports blended labs rather than fully remote labs"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "They conclude that the tutorial group supports blended labs rather than fully remote labs"}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Eso hace más clara la explicación para el seminario."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Das macht die Erklärung für das Seminar klarer."}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Estoy de acuerdo. The best line is: \"A defendable position responds to the other side.\""}]}]'::jsonb),
            ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich stimme zu. The best line is: \"A defendable position responds to the other side.\""}]}]'::jsonb);
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
