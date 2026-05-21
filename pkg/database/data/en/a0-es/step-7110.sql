-- ============================================================
-- Seed: A0 English Path – STEP 7110 – Reading – read a personal letter or email (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Ana and Tom talk about last weekend and the next visit.", "p_de": "Ana and Tom talk about last weekend and the next visit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "They plan a trip to the moon.", "p_de": "They plan a trip to the moon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The day mentioned is Sunday.", "p_de": "The day mentioned is Sunday.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The transport is the bus.", "p_de": "The transport is the bus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "They decide to walk for three days instead.", "p_de": "They decide to walk for three days instead.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "They meet at Ana''s house.", "p_de": "They meet at Ana''s house.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The request is send the photos.", "p_de": "The request is send the photos.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The message ends with See you soon.", "p_de": "The message ends with See you soon.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Who talks or writes?", "p_de": "Who talks or writes?", "s": {"type": "multiple_choice", "options": ["Ana and Tom", "two strangers from a film", "a chef and a farmer"], "answer": 0}}'::jsonb,
        '{"p": "What is the destination or main plan?", "p_de": "What is the destination or main plan?", "s": {"type": "multiple_choice", "options": ["last weekend and the next visit", "the moon", "a hidden cave"], "answer": 0}}'::jsonb,
        '{"p": "On which day is the plan?", "p_de": "On which day is the plan?", "s": {"type": "multiple_choice", "options": ["Sunday", "last winter", "midnight today"], "answer": 0}}'::jsonb,
        '{"p": "At what time is the arrangement?", "p_de": "At what time is the arrangement?", "s": {"type": "multiple_choice", "options": ["18:30", "03:30", "00:05"], "answer": 0}}'::jsonb,
        '{"p": "How do they travel?", "p_de": "How do they travel?", "s": {"type": "multiple_choice", "options": ["the bus", "by helicopter only", "on foot for three days"], "answer": 0}}'::jsonb,
        '{"p": "Where do they meet?", "p_de": "Where do they meet?", "s": {"type": "multiple_choice", "options": ["Ana''s house", "inside the forest", "under the bridge"], "answer": 0}}'::jsonb,
        '{"p": "What request is included?", "p_de": "What request is included?", "s": {"type": "multiple_choice", "options": ["send the photos", "bring a tractor", "cancel all trains"], "answer": 0}}'::jsonb,
        '{"p": "How does the note or call end?", "p_de": "How does the note or call end?", "s": {"type": "multiple_choice", "options": ["See you soon", "No reply ever", "Please forget the plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7110 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7110 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7110 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7110 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7110 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7110 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7110 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7110 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 7110, 'en', 'reading', 'phone_correspondence', 'Subject: last weekend and the next visit\n\nHi Tom,\nI am writing about last weekend and the next visit. The plan is for Sunday at 18:30.\n\nWe can travel by bus and meet at Ana''s house. Please send the photos.\n\nSee you soon,\nAna')RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Correo personal de Ana');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Persönliche E-Mail von Ana');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
