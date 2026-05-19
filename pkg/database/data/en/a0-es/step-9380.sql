-- ============================================================
-- Seed: A0 English Path – STEP 9380 – Reading – deal with hostile questioning confidently (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is that the speaker handles an aggressive question about the cost of the project.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is that the speaker handles an aggressive question about the cost of the project.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a grocery store.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a grocery store.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the speaker is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the speaker is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the questioner demands to know why the budget exceeded the original estimate.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the questioner demands to know why the budget exceeded the original estimate.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the speaker explains that unforeseen supply chain issues caused the increase.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the speaker explains that unforeseen supply chain issues caused the increase.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is a project presentation room.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is a project presentation room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the questioner accepts the explanation and asks for a written breakdown.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the questioner accepts the explanation and asks for a written breakdown.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the speaker handles an aggressive question about the cost of the project", "a holiday celebration", "a dance performance"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a project presentation room", "a park bench", "a library corner"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the speaker", "Professor Johnson", "Pilot Garcia"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the questioner demands to know why the budget exceeded the original estimate", "the lights go out", "the presentation file is lost"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the speaker explains that unforeseen supply chain issues caused the increase", "the room is too loud", "the projector fails"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the questioner accepts the explanation and asks for a written breakdown", "the meeting ends in confusion", "the speaker walks out"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a project presentation room", "a music store", "a clothing boutique"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["A confident and honest answer disarms even the most hostile questioner.", "Avoid all difficult questions.", "Anger solves every problem."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9380 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9380 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9380 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9380 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9380 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9380 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9380 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9380 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9380,'en','reading','academic','Handling a Tough Budget Question

In a project presentation room, the focus is on how the speaker handles an aggressive question about the cost of the project. The speaker remains calm and addresses the concerns with clear and factual responses.

The text explains that the questioner demands to know why the budget exceeded the original estimate. It also notes that the speaker explains that unforeseen supply chain issues caused the increase, which makes the situation more nuanced and requires transparency.

In the end, the text shows that the questioner accepts the explanation and asks for a written breakdown. The key reminder is, "A confident and honest answer disarms even the most hostile questioner."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','deal with hostile questioning confidently','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','deal with hostile questioning confidently','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
