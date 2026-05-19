-- ============================================================
-- Seed: A0 English Path – STEP 9460 – Reading – rebut counter-arguments (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is that the researcher rebuts a counter-argument about the cost-effectiveness of the approach.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is that the researcher rebuts a counter-argument about the cost-effectiveness of the approach.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a hair salon.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a hair salon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the researcher is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the researcher is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the researcher provides additional data showing long-term savings.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the researcher provides additional data showing long-term savings.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the critic argues that the short-term cost is too high for most organisations.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the critic argues that the short-term cost is too high for most organisations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is a research symposium.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is a research symposium.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that both sides agree that the approach is viable for larger institutions.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that both sides agree that the approach is viable for larger institutions.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the researcher rebuts a counter-argument about the cost-effectiveness of the approach", "a wedding reception", "a driving lesson"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a research symposium", "a toy store", "a bus terminal"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the researcher", "Coach Anderson", "Architect Elena"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the researcher provides additional data showing long-term savings", "the door is locked", "the meeting is postponed"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the critic argues that the short-term cost is too high for most organisations", "the slides are missing", "the speaker forgets the topic"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["both sides agree that the approach is viable for larger institutions", "the debate ends in deadlock", "the proposal is rejected entirely"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a research symposium", "a gossip column", "a fitness blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Strong evidence is the best answer to any counter-argument.", "Ignore all criticism.", "Opinions need no support."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9460 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9460 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9460 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9460 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9460 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9460 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9460 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9460 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9460,'en','reading','academic','Answering Cost Concerns

In a research symposium, the focus is on how the researcher rebuts a counter-argument about the cost-effectiveness of the approach. The researcher presents supporting evidence and addresses the criticism with detailed analysis.

The text explains that the researcher provides additional data showing long-term savings. It also notes that the critic argues that the short-term cost is too high for most organisations, which makes the situation more nuanced and requires balanced discussion.

In the end, the text shows that both sides agree that the approach is viable for larger institutions. The key reminder is, "Strong evidence is the best answer to any counter-argument."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','rebut counter-arguments','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','rebut counter-arguments','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
