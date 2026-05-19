-- ============================================================
-- Seed: A0 English Path – STEP 6530 – Dialogue – plan a sightseeing day (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The dialogue is about a day in Port Vista.", "p_de": "Laut dem Material, markiere wahr oder falsch: The dialogue is about a day in Port Vista.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The speakers meet at 05:00 in the morning.", "p_de": "Laut dem Material, markiere wahr oder falsch: The speakers meet at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The first speaker asks about the sightseeing plan.", "p_de": "Laut dem Material, markiere wahr oder falsch: The first speaker asks about the sightseeing plan.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The second speaker says they buy the day pass first.", "p_de": "Laut dem Material, markiere wahr oder falsch: The second speaker says they buy the day pass first.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: At the end, both speakers are still confused.", "p_de": "Laut dem Material, markiere wahr oder falsch: At the end, both speakers are still confused.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who gives the main information?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who gives the main information?", "s": {"type": "multiple_choice", "options": ["Ana", "a pilot", "a football player"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What time is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What time is mentioned?", "s": {"type": "multiple_choice", "options": ["09:30", "05:00", "23:50"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which place is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which place is mentioned?", "s": {"type": "multiple_choice", "options": ["the main square", "the airport tunnel", "the desert farm"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the main purpose of the dialogue?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the main purpose of the dialogue?", "s": {"type": "multiple_choice", "options": ["the sightseeing plan", "buy a tractor", "find a lost camel"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How does the dialogue end?", "p_de": "Laut dem Material, wähle die richtige Antwort: How does the dialogue end?", "s": {"type": "multiple_choice", "options": ["with a clear meeting plan", "with a big argument", "with no clear plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6530 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6530 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6530 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6530 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6530 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6530 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6530 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6530 AND path_uuid=v_path_id;
    INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
    VALUES (v_path_id,6530,'en','dialogue','tourism','[{"name":"Ana","gender":"female","avatarURL":"https://example.com/avatars/ana.png"},{"name":"Leo","gender":"male","avatarURL":"https://example.com/avatars/leo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','Plan para un día en Port Vista','Lee el diálogo de planificación y responde.');
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','Plan für einen Tag in Port Vista','Lies den Planungsdialog und antworte.');
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES
        (v_dialogue_id, 0, 'Ana', 'Hi. Shall we meet at the main square at 09:30?'),
        (v_dialogue_id, 1, 'Leo', 'Yes. I want to visit the market and the square.'),
        (v_dialogue_id, 2, 'Ana', 'Good. I will wear light shoes.'),
        (v_dialogue_id, 3, 'Leo', 'I can bring cold drinks.'),
        (v_dialogue_id, 4, 'Ana', 'Perfect. Do we need anything else?'),
        (v_dialogue_id, 5, 'Leo', 'Please buy the day pass first.'),
        (v_dialogue_id, 6, 'Ana', 'No problem. I will do that now.'),
        (v_dialogue_id, 7, 'Leo', 'Great. See you later.');
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. ¿Quedamos en the main square a las 09:30?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Wollen wir uns um 09:30 bei the main square treffen?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Quiero visit the market and the square."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Ich möchte visit the market and the square."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Bien. Llevaré light shoes."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Gut. Ich werde light shoes tragen."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Puedo llevar cold drinks."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich kann cold drinks mitbringen."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Perfecto. ¿Necesitamos algo más?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Perfekt. Brauchen wir noch etwas?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Por favor, buy the day pass first."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Bitte buy the day pass first."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'es', '[{"translations": [{"languageCode": "es", "translation": "No hay problema. Lo haré ahora."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 6), 'de', '[{"translations": [{"languageCode": "de", "translation": "Kein Problem. Ich mache das jetzt."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'es', '[{"translations": [{"languageCode": "es", "translation": "Genial. Hasta luego."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 7), 'de', '[{"translations": [{"languageCode": "de", "translation": "Super. Bis später."}]}]'::jsonb);
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
