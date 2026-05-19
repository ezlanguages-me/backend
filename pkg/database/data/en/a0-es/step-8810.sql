-- ============================================================
-- Seed: A0 English Path – STEP 8810 – Reading – argue/complain effectively about most problem areas that are likely to occur (Alquileres)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is the landlord refuses to return the deposit after the tenant leaves the flat.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is the landlord refuses to return the deposit after the tenant leaves the flat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the tenant is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the tenant is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the tenant has documented all damage with photos and a written report.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the tenant has documented all damage with photos and a written report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the landlord claims the carpet and windows are damaged beyond normal wear.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is the a flat rental office and phone call.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is the a flat rental office and phone call.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that they agree to a partial refund pending the landlord''s written response.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that they agree to a partial refund pending the landlord''s written response.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the landlord refuses to return the deposit after the tenant leaves the flat", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a flat rental office and phone call", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the tenant", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the tenant has documented all damage with photos and a written report", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the landlord claims the carpet and windows are damaged beyond normal wear", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["they agree to a partial refund pending the landlord''s written response", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a flat rental office and phone call", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["A clear record protects both landlord and tenant.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8810 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8810 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8810 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8810 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8810 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8810 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8810 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8810 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,8810,'en','reading','rental','Argue/Complain Effectively About Most Problem Areas That Are Likely to Occur

In the a flat rental office and phone call, the landlord refuses to return the deposit after the tenant leaves the flat. the tenant listens to the request and checks the practical details before replying.

The text explains that the tenant has documented all damage with photos and a written report. It also notes that the landlord claims the carpet and windows are damaged beyond normal wear, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that they agree to a partial refund pending the landlord''s written response. The key reminder is, "A clear record protects both landlord and tenant."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','argue/complain effectively about most problem areas that are likely to occur','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','argue/complain effectively about most problem areas that are likely to occur','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
