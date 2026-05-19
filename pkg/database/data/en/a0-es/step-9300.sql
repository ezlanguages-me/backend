-- ============================================================
-- Seed: A0 English Path – STEP 9300 – Reading – make critical remarks / express disagreement without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is that a delegate politely challenges a claim made in the keynote address.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is that a delegate politely challenges a claim made in the keynote address.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a mountain resort.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a mountain resort.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the delegate is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the delegate is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the delegate cites a conflicting study published in the same year.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the delegate cites a conflicting study published in the same year.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the speaker acknowledges the point and offers a nuanced explanation.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the speaker acknowledges the point and offers a nuanced explanation.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is a conference hall.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is a conference hall.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the session chair proposes that both perspectives appear in the published proceedings.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the session chair proposes that both perspectives appear in the published proceedings.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a delegate politely challenges a claim made in the keynote address", "a cooking competition", "a sports training session"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a conference hall", "a bakery", "a swimming pool"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the delegate", "Doctor Williams", "Artist Maria"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the delegate cites a conflicting study published in the same year", "the screen is broken", "the audience leaves early"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the speaker acknowledges the point and offers a nuanced explanation", "the chairs are uncomfortable", "the microphone stops working"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the session chair proposes that both perspectives appear in the published proceedings", "the discussion is abandoned", "the event is postponed"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a conference hall", "a fashion blog", "a sports magazine"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Respectful disagreement advances knowledge further than silence.", "Never question authority.", "Speed matters more than accuracy."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9300 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9300 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9300 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9300 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9300 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9300 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9300 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9300 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9300,'en','reading','academic','A Respectful Challenge

In a conference hall, the focus is on how a delegate politely challenges a claim made in the keynote address. The delegate considers the evidence and presents an alternative perspective with supporting data.

The text explains that the delegate cites a conflicting study published in the same year. It also notes that the speaker acknowledges the point and offers a nuanced explanation, which makes the situation more nuanced and requires respectful dialogue.

In the end, the text shows that the session chair proposes that both perspectives appear in the published proceedings. The key reminder is, "Respectful disagreement advances knowledge further than silence."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','make critical remarks / express disagreement without causing offence','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','make critical remarks / express disagreement without causing offence','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
