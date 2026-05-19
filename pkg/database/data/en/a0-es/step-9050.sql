-- ============================================================
-- Seed: A0 English Path – STEP 9050 – Reading – give detailed information and deal with most routine problems that are likely to arise (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el texto, marca verdadero o falso: The main focus is the team leader explains the system backup procedure step by step.", "p_de": "Laut dem Text, markiere wahr oder falsch: The main focus is the team leader explains the system backup procedure step by step.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The setting is a beach café.", "p_de": "Laut dem Text, markiere wahr oder falsch: The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: the team leader is mentioned.", "p_de": "Laut dem Text, markiere wahr oder falsch: the team leader is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: One key detail is that the backup must run every Friday at midnight on the main server.", "p_de": "Laut dem Text, markiere wahr oder falsch: One key detail is that the backup must run every Friday at midnight on the main server.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The counterpoint is that the colleague asks what to do if the system fails to respond.", "p_de": "Laut dem Text, markiere wahr oder falsch: The counterpoint is that the colleague asks what to do if the system fails to respond.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The text says that nobody offers any evidence.", "p_de": "Laut dem Text, markiere wahr oder falsch: The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The source is the a server room and IT office.", "p_de": "Laut dem Text, markiere wahr oder falsch: The source is the a server room and IT office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, marca verdadero o falso: The conclusion is that the leader provides a written checklist and emergency contact details.", "p_de": "Laut dem Text, markiere wahr oder falsch: The conclusion is that the leader provides a written checklist and emergency contact details.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["the team leader explains the system backup procedure step by step", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Where does the material take place?", "p_de": "Laut dem Text, wähle die richtige Antwort: Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a server room and IT office", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Who is named in the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the team leader", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What key detail is included?", "p_de": "Laut dem Text, wähle die richtige Antwort: What key detail is included?", "s": {"type": "multiple_choice", "options": ["the backup must run every Friday at midnight on the main server", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What counterpoint appears?", "p_de": "Laut dem Text, wähle die richtige Antwort: What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the colleague asks what to do if the system fails to respond", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: What is the result?", "p_de": "Laut dem Text, wähle die richtige Antwort: What is the result?", "s": {"type": "multiple_choice", "options": ["the leader provides a written checklist and emergency contact details", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a server room and IT office", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Según el texto, elige la respuesta correcta: Which quotation fits the material?", "p_de": "Laut dem Text, wähle die richtige Antwort: Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["A clear procedure prevents costly mistakes.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9050 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9050 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9050 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9050 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9050 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9050 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9050 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9050 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
        VALUES (v_path_id,9050,'en','reading','professional','Weekly Backup Procedure

In the a server room and IT office, the team leader explains the system backup procedure step by step. the team leader listens to the request and checks the practical details before replying.

The text explains that the backup must run every Friday at midnight on the main server. It also notes that the colleague asks what to do if the system fails to respond, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that the leader provides a written checklist and emergency contact details. The key reminder is, "A clear procedure prevents costly mistakes."')
        RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','give detailed information and deal with most routine problems that are likely to arise','Lee el texto y responde.');
        INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','give detailed information and deal with most routine problems that are likely to arise','Lies den Text und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
