-- ============================================================
-- Seed: A0 English Path – STEP 8890 – Reading – put her/his point across persuasively when talking, for example about a familiar product (Servicios Laborales)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The main focus is the sales consultant presents the updated software package to the client.", "p_de": "The main focus is the sales consultant presents the updated software package to the client.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The setting is a beach café.", "p_de": "The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the consultant is mentioned.", "p_de": "the consultant is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One key detail is that the package includes a one-year support contract and free upgrades.", "p_de": "One key detail is that the package includes a one-year support contract and free upgrades.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The counterpoint is that the client asks whether the system can integrate with existing tools.", "p_de": "The counterpoint is that the client asks whether the system can integrate with existing tools.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The text says that nobody offers any evidence.", "p_de": "The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source is the a sales meeting room.", "p_de": "The source is the a sales meeting room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the client agrees to a three-month trial after a live demonstration.", "p_de": "The conclusion is that the client agrees to a three-month trial after a live demonstration.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["the sales consultant presents the updated software package to the client", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Where does the material take place?", "p_de": "Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a sales meeting room", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Who is named in the material?", "p_de": "Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the consultant", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "What key detail is included?", "p_de": "What key detail is included?", "s": {"type": "multiple_choice", "options": ["the package includes a one-year support contract and free upgrades", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint appears?", "p_de": "What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the client asks whether the system can integrate with existing tools", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "What is the result?", "p_de": "What is the result?", "s": {"type": "multiple_choice", "options": ["the client agrees to a three-month trial after a live demonstration", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a sales meeting room", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Which quotation fits the material?", "p_de": "Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["The best product speaks for itself when the evidence is clear.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8890 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8890 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8890 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8890 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8890 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8890 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8890 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8890 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (
    v_path_id,
    8890,
    'en',
    'reading',
    'professional',
    'Put Her/His Point Across Persuasively When Talking, for Example About a Familiar Product

In the a sales meeting room, the sales consultant presents the updated software package to the client. the consultant listens to the request and checks the practical details before replying.

The text explains that the package includes a one-year support contract and free upgrades. It also notes that the client asks whether the system can integrate with existing tools, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that the client agrees to a three-month trial after a live demonstration. The key reminder is, "The best product speaks for itself when the evidence is clear."'
)RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Comunicación persuasiva');
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Überzeugend kommunizieren');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
