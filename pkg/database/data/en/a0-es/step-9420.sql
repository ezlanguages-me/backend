-- ============================================================
-- Seed: A0 English Path – STEP 9420 – Reading – get and hold on to his/her turn to speak (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is that the participant interrupts politely to add a point before the floor closes.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is that the participant interrupts politely to add a point before the floor closes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a car wash.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a car wash.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the participant is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the participant is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the participant signals with a raised hand and waits for the chair to acknowledge them.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the participant signals with a raised hand and waits for the chair to acknowledge them.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that another speaker tries to continue before the point is made.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that another speaker tries to continue before the point is made.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is a panel discussion session.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is a panel discussion session.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the chair gives the floor to the participant who makes a concise and relevant contribution.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the chair gives the floor to the participant who makes a concise and relevant contribution.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the participant interrupts politely to add a point before the floor closes", "a lunch break", "a video game tournament"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a panel discussion session", "a flower shop", "a subway platform"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the participant", "Nurse Thompson", "Designer Carlos"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the participant signals with a raised hand and waits for the chair to acknowledge them", "the window is broken", "the coffee is cold"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["another speaker tries to continue before the point is made", "the room is empty", "the time runs out"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the chair gives the floor to the participant who makes a concise and relevant contribution", "the session is cancelled", "everyone leaves immediately"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a panel discussion session", "a comic book", "a radio jingle"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Knowing when and how to speak is as important as what you say.", "Never interrupt anyone.", "Speak first, think later."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9420 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9420 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9420 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9420 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9420 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9420 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9420 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9420 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9420,'en','reading','academic','Getting the Floor

In a panel discussion session, the focus is on how the participant interrupts politely to add a point before the floor closes. The participant waits for the right moment and makes a clear and relevant contribution.

The text explains that the participant signals with a raised hand and waits for the chair to acknowledge them. It also notes that another speaker tries to continue before the point is made, which makes the situation more nuanced and requires timing and tact.

In the end, the text shows that the chair gives the floor to the participant who makes a concise and relevant contribution. The key reminder is, "Knowing when and how to speak is as important as what you say."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','get and hold on to his/her turn to speak','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','get and hold on to his/her turn to speak','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
