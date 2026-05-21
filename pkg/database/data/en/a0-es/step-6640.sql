-- ============================================================
-- Seed: A0 English Path – STEP 6640 – Reading – read tourist FAQ sheet (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Old Quarter Visitor Info is in the central station area.", "p_de": "Old Quarter Visitor Info is in the central station area.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at 18:00.", "p_de": "The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Visitors can see the walking map.", "p_de": "Visitors can see the walking map.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says the bus pass desk is not included.", "p_de": "The material says the bus pass desk is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The price is free.", "p_de": "The price is free.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says to arrive by helicopter.", "p_de": "The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The visit lasts 15 minutes.", "p_de": "The visit lasts 15 minutes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at the airport instead of the information desk.", "p_de": "The visit starts at the airport instead of the information desk.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Where is Old Quarter Visitor Info?", "p_de": "Where is Old Quarter Visitor Info?", "s": {"type": "multiple_choice", "options": ["the central station area", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "What time does the visit start?", "p_de": "What time does the visit start?", "s": {"type": "multiple_choice", "options": ["08:30", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Which highlight is included?", "p_de": "Which highlight is included?", "s": {"type": "multiple_choice", "options": ["the walking map", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "How much does it cost?", "p_de": "How much does it cost?", "s": {"type": "multiple_choice", "options": ["free", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "What is a useful tip?", "p_de": "What is a useful tip?", "s": {"type": "multiple_choice", "options": ["check the colour of your map", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "What is near the end of the visit?", "p_de": "What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the tram stop", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Which second highlight is mentioned?", "p_de": "Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["the bus pass desk", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "What type of activity or place is described for Old Quarter Visitor Info?", "p_de": "What type of activity or place is described for Old Quarter Visitor Info?", "s": {"type": "multiple_choice", "options": ["a visitor information point", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6640 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6640 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6640 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6640 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6640 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6640 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6640 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6640 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6640, 'en', 'reading', 'tourism', 'FAQ: Old Quarter Visitor Info\n\nQ: Where does the visit begin? A: It begins at the information desk at 08:30 in the central station area.\n\nQ: What can people see? A: They can see the walking map and the bus pass desk. The visit lasts 15 minutes and costs free.\n\nQ: What is a good tip? A: check the colour of your map. The tram stop is close after the visit.')RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'FAQ del Old Quarter');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'FAQ zum Old Quarter');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
