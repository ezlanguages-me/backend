-- ============================================================
-- Seed: A0 English Path – STEP 6620 – Dialogue – ask for and understand clarifications on tour (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The dialogue is about Colors of the Sea Exhibition.", "p_de": "Laut dem Material, markiere wahr oder falsch: The dialogue is about Colors of the Sea Exhibition.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The speakers meet at 05:00 in the morning.", "p_de": "Laut dem Material, markiere wahr oder falsch: The speakers meet at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The first speaker asks about extra clarification.", "p_de": "Laut dem Material, markiere wahr oder falsch: The first speaker asks about extra clarification.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The second speaker says the map is available at the blue desk.", "p_de": "Laut dem Material, markiere wahr oder falsch: The second speaker says the map is available at the blue desk.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: At the end, both speakers are still confused.", "p_de": "Laut dem Material, markiere wahr oder falsch: At the end, both speakers are still confused.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who gives the main information?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who gives the main information?", "s": {"type": "multiple_choice", "options": ["Guide", "a pilot", "a football player"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What time is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What time is mentioned?", "s": {"type": "multiple_choice", "options": ["12:00", "05:00", "23:50"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which place is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which place is mentioned?", "s": {"type": "multiple_choice", "options": ["the blue desk", "the airport tunnel", "the desert farm"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the main purpose of the dialogue?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the main purpose of the dialogue?", "s": {"type": "multiple_choice", "options": ["extra clarification", "buy a tractor", "find a lost camel"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How does the dialogue end?", "p_de": "Laut dem Material, wähle die richtige Antwort: How does the dialogue end?", "s": {"type": "multiple_choice", "options": ["with better understanding", "with a big argument", "with no clear plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6620 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6620 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6620 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6620 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6620 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6620 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6620 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6620 AND path_uuid=v_path_id;
    INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
    VALUES (v_path_id,6620,'en','dialogue','tourism','[{"name":"Guide","gender":"neutral","avatarURL":"https://example.com/avatars/guide.png"},{"name":"Visitor","gender":"neutral","avatarURL":"https://example.com/avatars/visitor.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','Pedir aclaraciones en Colors of the Sea','Lee el diálogo con aclaraciones y responde.');
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','Nach Erklärungen bei Colors of the Sea fragen','Lies den Dialog mit Erklärungen und antworte.');
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES
        (v_dialogue_id, 0, 'Guide', 'Hello. The visit to Colors of the Sea Exhibition starts at the blue desk at 12:00.'),
        (v_dialogue_id, 1, 'Visitor', 'Great. How long does it last?'),
        (v_dialogue_id, 2, 'Guide', 'It lasts 35 minutes.'),
        (v_dialogue_id, 3, 'Visitor', 'What can I see first?'),
        (v_dialogue_id, 4, 'Guide', 'First you see Wave Window, and later you see the shell room.'),
        (v_dialogue_id, 5, 'Visitor', 'How much is the ticket?'),
        (v_dialogue_id, 6, 'Guide', 'It is 9 euros. Please ask for the blue map.'),
        (v_dialogue_id, 7, 'Visitor', 'Thank you. I will also look for the education desk.');
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. La visita a Colors of the Sea Exhibition empieza en the blue desk a las 12:00."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Der Besuch von Colors of the Sea Exhibition beginnt bei the blue desk um 12:00."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Genial. ¿Cuánto dura?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Super. Wie lange dauert er?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Dura 35 minutes."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Er dauert 35 minutes."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Qué puedo ver primero?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Was kann ich zuerst sehen?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Primero ves Wave Window y luego ves the shell room."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Zuerst siehst du Wave Window, und später siehst du the shell room."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "¿Cuánto cuesta la entrada?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Wie viel kostet die Eintrittskarte?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "Cuesta 9 euros. Por favor, ask for the blue map."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Sie kostet 9 euros. Bitte ask for the blue map."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Gracias. También buscaré the education desk."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Danke. Ich werde auch nach the education desk suchen."}]}]'::jsonb);
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
