    -- ============================================================
    -- Seed: A0 English Path – STEP 9720 – Reading – understand jokes, colloquial asides and cultural allusions (Conferencias, Seminarios y Clases)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is a foreign student catches a dry humour joke in a British TV comedy.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is a foreign student catches a dry humour joke in a British TV comedy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: the student is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the student is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: One key detail is that the joke relies on a double meaning of the word ''right'' — correct versus a tag question.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the joke relies on a double meaning of the word ''right'' — correct versus a tag question.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that a friend explains that the same joke would not translate directly into other languages.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that a friend explains that the same joke would not translate directly into other languages.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The source is a student common room.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is a student common room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the student writes down the phrase as an example of British colloquial English.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the student writes down the phrase as an example of British colloquial English.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a foreign student catches a dry humour joke in a British TV comedy", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a student common room", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the student", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the joke relies on a double meaning of the word ''right'' — correct versus a tag question", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["a friend explains that the same joke would not translate directly into other languages", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the student writes down the phrase as an example of British colloquial English", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a student common room", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
        '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Understanding humour in a second language is a sign of true fluency.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9720 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9720 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9720 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9720 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9720 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9720 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9720 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9720 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9720,'en','reading','social','Dry Humour in the Common Room

In a student common room, a foreign student catches a dry humour joke in a British TV comedy. The student pays close attention to the tone and implicit meaning behind the words.

The text explains that the joke relies on a double meaning of the word ''right'' — correct versus a tag question. It also notes that a friend explains that the same joke would not translate directly into other languages, which shows how cultural context shapes interpretation.

In the end, the text shows that the student writes down the phrase as an example of British colloquial English. The key reminder is, "Understanding humour in a second language is a sign of true fluency."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','understand jokes, colloquial asides and cultural allusions','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','understand jokes, colloquial asides and cultural allusions','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
