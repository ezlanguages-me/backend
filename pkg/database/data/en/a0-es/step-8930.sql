-- ============================================================
-- Seed: A0 English Path – STEP 8930 – Reading – ask questions outside own immediate area of work (e.g. asking for external legal or financial advice) (Servicios Laborales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is the manager contacts the legal team to clarify the liability clause in a contract.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is the manager contacts the legal team to clarify the liability clause in a contract.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the legal adviser is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the legal adviser is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the clause limits the company''s liability to the value of the original contract.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the clause limits the company''s liability to the value of the original contract.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the adviser notes that local law may impose additional obligations.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the adviser notes that local law may impose additional obligations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is the a corporate legal office.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is the a corporate legal office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the manager requests a written summary before signing the agreement.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the manager requests a written summary before signing the agreement.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the manager contacts the legal team to clarify the liability clause in a contract", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a corporate legal office", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the legal adviser", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the clause limits the company''s liability to the value of the original contract", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the adviser notes that local law may impose additional obligations", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the manager requests a written summary before signing the agreement", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a corporate legal office", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Seek expert advice before committing to a legal obligation.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8930 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8930 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8930 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8930 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8930 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8930 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8930 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8930 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,8930,'en','reading','professional','Ask Questions Outside Own Immediate Area of Work, e.g. Asking for External Legal or Financial Advice

In the a corporate legal office, the manager contacts the legal team to clarify the liability clause in a contract. the legal adviser listens to the request and checks the practical details before replying.

The text explains that the clause limits the company''s liability to the value of the original contract. It also notes that the adviser notes that local law may impose additional obligations, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that the manager requests a written summary before signing the agreement. The key reminder is, "Seek expert advice before committing to a legal obligation."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','ask questions outside own immediate area of work (e.g. asking for external legal or financial advice)','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','ask questions outside own immediate area of work (e.g. asking for external legal or financial advice)','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
