-- ============================================================
-- Seed: A0 English Path – STEP 9010 – Reading – engage in an extended conversation with a visitor on matters within her/his authority/competence (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is the host guides the visitor through the company''s main departments.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is the host guides the visitor through the company''s main departments.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the host is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the host is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the visitor is particularly interested in the production and quality control team.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the visitor is particularly interested in the production and quality control team.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the visitor raises a concern about the delivery timeline for the next order.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the visitor raises a concern about the delivery timeline for the next order.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is the a company head office.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is the a company head office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the host arranges a follow-up call and provides a detailed schedule.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the host arranges a follow-up call and provides a detailed schedule.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the host guides the visitor through the company''s main departments", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a company head office", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the host", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the visitor is particularly interested in the production and quality control team", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the visitor raises a concern about the delivery timeline for the next order", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the host arranges a follow-up call and provides a detailed schedule", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a company head office", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["A well-prepared visit builds lasting professional relationships.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9010 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9010 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9010 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9010 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9010 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9010 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9010 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9010 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9010,'en','reading','professional','Visitor Tour of the Head Office

In the a company head office, the host guides the visitor through the company''s main departments. the host listens to the request and checks the practical details before replying.

The text explains that the visitor is particularly interested in the production and quality control team. It also notes that the visitor raises a concern about the delivery timeline for the next order, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that the host arranges a follow-up call and provides a detailed schedule. The key reminder is, "A well-prepared visit builds lasting professional relationships."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','engage in an extended conversation with a visitor on matters within her/his authority/competence','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','engage in an extended conversation with a visitor on matters within her/his authority/competence','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
