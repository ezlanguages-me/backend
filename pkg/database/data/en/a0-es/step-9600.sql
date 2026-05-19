    -- ============================================================
    -- Seed: A0 English Path – STEP 9600 – Reading – participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is two colleagues discuss an ironic situation at work with British humour.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is two colleagues discuss an ironic situation at work with British humour.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: the colleague is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the colleague is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: One key detail is that the manager who always complained about meetings has now scheduled three extra ones.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the manager who always complained about meetings has now scheduled three extra ones.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that one colleague jokes that the manager probably ran out of emails to ignore.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that one colleague jokes that the manager probably ran out of emails to ignore.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The source is an office kitchen during a coffee break.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is an office kitchen during a coffee break.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The conclusion is that they laugh and agree the situation is a perfect example of British workplace irony.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that they laugh and agree the situation is a perfect example of British workplace irony.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["two colleagues discuss an ironic situation at work with British humour", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["an office kitchen during a coffee break", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the colleague", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the manager who always complained about meetings has now scheduled three extra ones", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["one colleague jokes that the manager probably ran out of emails to ignore", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["they laugh and agree the situation is a perfect example of British workplace irony", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["an office kitchen during a coffee break", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Sometimes the best response to absurdity is a well-timed smile.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9600 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9600 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9600 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9600 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9600 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9600 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9600 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9600 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9600,'en','reading','social','British Workplace Irony

In an office kitchen during a coffee break, two colleagues discuss an ironic situation at work with British humour. The colleague pays close attention to the tone and implicit meaning behind the words.

The text explains that the manager who always complained about meetings has now scheduled three extra ones. It also notes that one colleague jokes that the manager probably ran out of emails to ignore, which shows how cultural context shapes interpretation.

In the end, the text shows that they laugh and agree the situation is a perfect example of British workplace irony. The key reminder is, "Sometimes the best response to absurdity is a well-timed smile."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
