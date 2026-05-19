-- ============================================================
-- Seed: A0 English Path – STEP 7130 – Dialogue – discuss personal correspondence (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_dialogue_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The dialogue is about a personal email.", "p_de": "Laut dem Material, markiere wahr oder falsch: The dialogue is about a personal email.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The speakers meet at 05:00 in the morning.", "p_de": "Laut dem Material, markiere wahr oder falsch: The speakers meet at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The first speaker asks about the email message.", "p_de": "Laut dem Material, markiere wahr oder falsch: The first speaker asks about the email message.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The second speaker says they talk about the next visit.", "p_de": "Laut dem Material, markiere wahr oder falsch: The second speaker says they talk about the next visit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: At the end, both speakers are still confused.", "p_de": "Laut dem Material, markiere wahr oder falsch: At the end, both speakers are still confused.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who gives the main information?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who gives the main information?", "s": {"type": "multiple_choice", "options": ["Ana", "a pilot", "a football player"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What time is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What time is mentioned?", "s": {"type": "multiple_choice", "options": ["18:30", "05:00", "23:50"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which place is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which place is mentioned?", "s": {"type": "multiple_choice", "options": ["Ana''s house", "the airport tunnel", "the desert farm"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the main purpose of the dialogue?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the main purpose of the dialogue?", "s": {"type": "multiple_choice", "options": ["the email message", "buy a tractor", "find a lost camel"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How does the dialogue end?", "p_de": "Laut dem Material, wähle die richtige Antwort: How does the dialogue end?", "s": {"type": "multiple_choice", "options": ["with the email understood", "with a big argument", "with no clear plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7130 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7130 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7130 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7130 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7130 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7130 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7130 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7130 AND path_uuid=v_path_id;
    INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
    VALUES (v_path_id,7130,'en','dialogue','phone_correspondence','[{"name":"Ana","gender":"female","avatarURL":"https://example.com/avatars/ana.png"},{"name":"Leo","gender":"male","avatarURL":"https://example.com/avatars/leo.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','Hablar sobre un correo personal','Lee el diálogo y responde.');
    INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','Über eine persönliche E-Mail sprechen','Lies den Dialog und antworte.');
    INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
    VALUES
        (v_dialogue_id, 0, 'Ana', 'Hi. Shall we meet at Ana''s house at 18:30?'),
        (v_dialogue_id, 1, 'Leo', 'Yes. I want to talk about the email and the next visit.'),
        (v_dialogue_id, 2, 'Ana', 'Good. I will wear casual clothes.'),
        (v_dialogue_id, 3, 'Leo', 'I can bring tea and biscuits.'),
        (v_dialogue_id, 4, 'Ana', 'Perfect. Do we need anything else?'),
        (v_dialogue_id, 5, 'Leo', 'Please send the photos later.'),
        (v_dialogue_id, 6, 'Ana', 'No problem. I will do that now.'),
        (v_dialogue_id, 7, 'Leo', 'Great. See you later.');
    INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
    VALUES
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'es', '[{"translations": [{"languageCode": "es", "translation": "Hola. ¿Quedamos en Ana''s house a las 18:30?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 0), 'de', '[{"translations": [{"languageCode": "de", "translation": "Hallo. Wollen wir uns um 18:30 bei Ana''s house treffen?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'es', '[{"translations": [{"languageCode": "es", "translation": "Sí. Quiero talk about the email and the next visit."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 1), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ja. Ich möchte talk about the email and the next visit."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'es', '[{"translations": [{"languageCode": "es", "translation": "Bien. Llevaré casual clothes."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 2), 'de', '[{"translations": [{"languageCode": "de", "translation": "Gut. Ich werde casual clothes tragen."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'es', '[{"translations": [{"languageCode": "es", "translation": "Puedo llevar tea and biscuits."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 3), 'de', '[{"translations": [{"languageCode": "de", "translation": "Ich kann tea and biscuits mitbringen."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'es', '[{"translations": [{"languageCode": "es", "translation": "Perfecto. ¿Necesitamos algo más?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 4), 'de', '[{"translations": [{"languageCode": "de", "translation": "Perfekt. Brauchen wir noch etwas?"}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'es', '[{"translations": [{"languageCode": "es", "translation": "Por favor, send the photos later."}]}]'::jsonb),
        ((SELECT uuid FROM dialogue_lines WHERE dialogue_uuid = v_dialogue_id AND line_order = 5), 'de', '[{"translations": [{"languageCode": "de", "translation": "Bitte send the photos later."}]}]'::jsonb),
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
