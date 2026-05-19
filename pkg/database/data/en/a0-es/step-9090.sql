-- ============================================================
-- Seed: A0 English Path – STEP 9090 – Reading – advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is the adviser explains the potential legal risks of terminating the contract early.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is the adviser explains the potential legal risks of terminating the contract early.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the adviser is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the adviser is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the penalty clause requires a payment of twenty percent of the total contract value.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the penalty clause requires a payment of twenty percent of the total contract value.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the client argues that the supplier failed to meet the agreed deadlines.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the client argues that the supplier failed to meet the agreed deadlines.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is the a corporate legal office.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is the a corporate legal office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that both sides agree to pursue mediation before considering legal action.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that both sides agree to pursue mediation before considering legal action.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the adviser explains the potential legal risks of terminating the contract early", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a corporate legal office", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the adviser", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the penalty clause requires a payment of twenty percent of the total contract value", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the client argues that the supplier failed to meet the agreed deadlines", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["both sides agree to pursue mediation before considering legal action", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a corporate legal office", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Careful legal advice prevents costly disputes.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9090 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9090 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9090 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9090 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9090 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9090 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9090 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9090 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9090,'en','reading','professional','Early Contract Termination Risks

In the a corporate legal office, the adviser explains the potential legal risks of terminating the contract early. the adviser listens to the request and checks the practical details before replying.

The text explains that the penalty clause requires a payment of twenty percent of the total contract value. It also notes that the client argues that the supplier failed to meet the agreed deadlines, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that both sides agree to pursue mediation before considering legal action. The key reminder is, "Careful legal advice prevents costly disputes."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','advise on/handle complex, delicate or contentious issues, e.g. legal or financial situations','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
