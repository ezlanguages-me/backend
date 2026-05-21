-- ============================================================
-- Seed: A0 English Path – STEP 8150 – Reading – read a seminar preparation guide (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The main focus is a seminar article about urban gardens and local health.", "p_de": "The main focus is a seminar article about urban gardens and local health.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The setting is a hotel breakfast room.", "p_de": "The setting is a hotel breakfast room.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Nadia is mentioned.", "p_de": "Nadia is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One key detail is that the article links nearby gardens with more shared activity.", "p_de": "One key detail is that the article links nearby gardens with more shared activity.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The counterpoint is that the evidence is strongest in neighbourhoods with active volunteers.", "p_de": "The counterpoint is that the evidence is strongest in neighbourhoods with active volunteers.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The text says that nobody offers any evidence.", "p_de": "The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source is the preparation guide.", "p_de": "The source is the preparation guide.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the discussion ends with a qualified positive opinion.", "p_de": "The conclusion is that the discussion ends with a qualified positive opinion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["a seminar article about urban gardens and local health", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Where does the material take place?", "p_de": "Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a community studies seminar", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Who is named in the material?", "p_de": "Who is named in the material?", "s": {"type": "multiple_choice", "options": ["Nadia", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "What key detail is included?", "p_de": "What key detail is included?", "s": {"type": "multiple_choice", "options": ["the article links nearby gardens with more shared activity", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint appears?", "p_de": "What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the evidence is strongest in neighbourhoods with active volunteers", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "What is the result?", "p_de": "What is the result?", "s": {"type": "multiple_choice", "options": ["the discussion ends with a qualified positive opinion", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the preparation guide", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Which quotation fits the material?", "p_de": "Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Opinion becomes stronger when it names the evidence.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8150 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8150 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8150 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8150 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8150 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8150 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8150 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8150 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (
    v_path_id,
    8150,
    'en',
    'reading',
    'academic',
    'Read A Seminar Preparation Guide

In the preparation guide, the writer examines a seminar article about urban gardens and local health during a community studies seminar. Nadia frames the issue carefully and explains why the question matters before the group moves to a conclusion.

The text highlights that the article links nearby gardens with more shared activity. At the same time, it recognises that the evidence is strongest in neighbourhoods with active volunteers, so the reader can follow both the supporting argument and the objection.

In the end, the writer argues that the discussion ends with a qualified positive opinion. The closing line states, "Opinion becomes stronger when it names the evidence."'
)RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Preparación de seminario');
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Seminarvorbereitung');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
