-- ============================================================
-- Seed: A0 English Path – STEP 6890 – Reading – read a newspaper headline and intro (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "The news topic is a new bike bridge.", "p_de": "The news topic is a new bike bridge.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The report is about a lost camel in a desert hotel.", "p_de": "The report is about a lost camel in a desert hotel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The story happens in River City.", "p_de": "The story happens in River City.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "the mayor and local students are mentioned in the report.", "p_de": "the mayor and local students are mentioned in the report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The result is that the bridge opened.", "p_de": "The result is that the bridge opened.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The report says nothing happened in the end.", "p_de": "The report says nothing happened in the end.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The source is Channel 6.", "p_de": "The source is Channel 6.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The detail says the bridge connects two parks.", "p_de": "The detail says the bridge connects two parks.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "What is the main topic?", "p_de": "What is the main topic?", "s": {"type": "multiple_choice", "options": ["a new bike bridge", "a cooking class", "a hotel fire drill"], "answer": 0}}'::jsonb,
        '{"p": "Where does the story happen?", "p_de": "Where does the story happen?", "s": {"type": "multiple_choice", "options": ["River City", "the desert airport", "a forest camp"], "answer": 0}}'::jsonb,
        '{"p": "When is it reported?", "p_de": "When is it reported?", "s": {"type": "multiple_choice", "options": ["this morning", "last winter only", "at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the mayor and local students", "two pilots", "a football team only"], "answer": 0}}'::jsonb,
        '{"p": "What happens in the end?", "p_de": "What happens in the end?", "s": {"type": "multiple_choice", "options": ["the bridge opened", "everyone goes home with no news", "the programme stops forever"], "answer": 0}}'::jsonb,
        '{"p": "Which source reports it?", "p_de": "Which source reports it?", "s": {"type": "multiple_choice", "options": ["Channel 6", "Kitchen TV", "Mountain FM"], "answer": 0}}'::jsonb,
        '{"p": "What extra detail is given?", "p_de": "What extra detail is given?", "s": {"type": "multiple_choice", "options": ["the bridge connects two parks", "there is a new camel farm", "the city closes all schools"], "answer": 0}}'::jsonb,
        '{"p": "Which quote fits the story?", "p_de": "Which quote fits the story?", "s": {"type": "multiple_choice", "options": ["It is safe and fast", "No one can find the moon", "The airport is under the sea"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6890 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6890 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6890 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6890 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6890 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6890 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6890 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6890 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6890, 'en', 'reading', 'media', 'Headline: New Bike Bridge Opens\n\nChannel 6 reports a story about a new bike bridge in River City this morning.\n\nThe report mentions the mayor and local students, and the result is that the bridge opened.\n\nOne key detail is that the bridge connects two parks. A speaker says, "It is safe and fast."')RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Titular sobre un nuevo puente');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Schlagzeile über eine neue');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
