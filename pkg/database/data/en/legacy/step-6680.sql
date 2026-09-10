-- ============================================================
-- Seed: A0 English Path – STEP 6680 – Reading – understand tourist attraction visitor reviews (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Green Hill Park is in Luna City.", "p_de": "Green Hill Park is in Luna City.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at 18:00.", "p_de": "The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Visitors can see the lake boats.", "p_de": "Visitors can see the lake boats.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says the flower bridge is not included.", "p_de": "The material says the flower bridge is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The price is free.", "p_de": "The price is free.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says to arrive by helicopter.", "p_de": "The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The visit lasts two hours.", "p_de": "The visit lasts two hours.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at the airport instead of the north gate.", "p_de": "The visit starts at the airport instead of the north gate.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Where is Green Hill Park?", "p_de": "Where is Green Hill Park?", "s": {"type": "multiple_choice", "options": ["Luna City", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "What time does the visit start?", "p_de": "What time does the visit start?", "s": {"type": "multiple_choice", "options": ["09:00", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Which highlight is included?", "p_de": "Which highlight is included?", "s": {"type": "multiple_choice", "options": ["the lake boats", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "How much does it cost?", "p_de": "How much does it cost?", "s": {"type": "multiple_choice", "options": ["free", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "What is a useful tip?", "p_de": "What is a useful tip?", "s": {"type": "multiple_choice", "options": ["go in the morning", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "What is near the end of the visit?", "p_de": "What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the tea kiosk", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Which second highlight is mentioned?", "p_de": "Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["the flower bridge", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "What type of activity or place is described for Green Hill Park?", "p_de": "What type of activity or place is described for Green Hill Park?", "s": {"type": "multiple_choice", "options": ["an attraction", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6680 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6680 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6680 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6680 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6680 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6680 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6680 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6680 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6680, 'en', 'reading', 'tourism', 'Visitor Reviews: Green Hill Park\n\nMaria says the place in Luna City starts smoothly at the north gate at 09:00.\n\nJon liked the lake boats and the flower bridge. He wrote that the visit lasted two hours and the ticket was free.\n\nMany reviews say it is smart to go in the morning. Several visitors also mention The tea kiosk.')RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Reseñas de Green Hill Park');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Besucherbewertungen zu Green');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
