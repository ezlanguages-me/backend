-- ============================================================
-- Seed: A0 English Path – STEP 9260 – Reading – rebut criticisms without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is that the presenter responds to a criticism of her research methodology.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is that the presenter responds to a criticism of her research methodology.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a shopping mall.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a shopping mall.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the presenter is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the presenter is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the critic questions the sample size and the validity of the conclusion.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the critic questions the sample size and the validity of the conclusion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the presenter explains that a larger study would not have been feasible.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the presenter explains that a larger study would not have been feasible.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is an academic conference session.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is an academic conference session.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that both agree that the findings are valid within the stated limitations.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that both agree that the findings are valid within the stated limitations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the presenter responds to a criticism of her research methodology", "a family dinner discussion", "a weather forecast review"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["an academic conference session", "a fitness studio", "a garden party"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the presenter", "Officer Martinez", "Chef Patricia"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the critic questions the sample size and the validity of the conclusion", "the building is under renovation", "the flight is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the presenter explains that a larger study would not have been feasible", "the audience walks out early", "the technology fails completely"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["both agree that the findings are valid within the stated limitations", "the presentation is cancelled", "the research is rejected immediately"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["an academic conference session", "a cooking magazine", "a travel brochure"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["A well-argued response turns criticism into collaboration.", "Silence is always the best policy.", "Fast results never require explanation."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9260 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9260 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9260 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9260 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9260 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9260 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9260 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9260 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9260,'en','reading','academic','Answering Criticism with Tact

In an academic conference session, the focus is on how the presenter responds to a criticism of her research methodology. The presenter listens to the concern and addresses the key points before explaining her approach.

The text explains that the critic questions the sample size and the validity of the conclusion. It also notes that the presenter explains that a larger study would not have been feasible, which makes the situation more nuanced and requires careful explanation.

In the end, the text shows that both agree that the findings are valid within the stated limitations. The key reminder is, "A well-argued response turns criticism into collaboration."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','rebut criticisms without causing offence','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','rebut criticisms without causing offence','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
