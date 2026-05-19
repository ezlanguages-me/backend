-- ============================================================
-- Seed: A0 English Path – STEP 8480 – Reading – read a conference proceedings excerpt (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is conference findings on bilingual note-taking and memory.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is conference findings on bilingual note-taking and memory.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a hotel breakfast room.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a hotel breakfast room.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: Dr Vega is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: Dr Vega is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that students remembered more key ideas when they summarised after listening.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that students remembered more key ideas when they summarised after listening.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that too much note-taking reduced attention during fast talks.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that too much note-taking reduced attention during fast talks.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is the conference proceedings.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is the conference proceedings.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the panel recommends shorter notes followed by reflection.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the panel recommends shorter notes followed by reflection.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["conference findings on bilingual note-taking and memory", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a small applied linguistics conference", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["Dr Vega", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["students remembered more key ideas when they summarised after listening", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["too much note-taking reduced attention during fast talks", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the panel recommends shorter notes followed by reflection", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["the conference proceedings", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Good notes are selective, not complete.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8480 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8480 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8480 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8480 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8480 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8480 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8480 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8480 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,8480,'en','reading','academic','Read A Conference Proceedings Excerpt

In the conference proceedings, the writer examines conference findings on bilingual note-taking and memory during a small applied linguistics conference. Dr Vega frames the issue carefully and explains why the question matters before the group moves to a conclusion.

The text highlights that students remembered more key ideas when they summarised after listening. At the same time, it recognises that too much note-taking reduced attention during fast talks, so the reader can follow both the supporting argument and the objection.

In the end, the writer argues that the panel recommends shorter notes followed by reflection. The closing line states, "Good notes are selective, not complete."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','read a conference proceedings excerpt','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','read a conference proceedings excerpt','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
