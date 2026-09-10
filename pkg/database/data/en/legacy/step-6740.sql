-- ============================================================
-- Seed: A0 English Path – STEP 6740 – Reading – read a regional tourism leaflet (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Silver Coast is in the western coast.", "p_de": "Silver Coast is in the western coast.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at 18:00.", "p_de": "The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Visitors can see Cliff Walk.", "p_de": "Visitors can see Cliff Walk.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says Harbour Street is not included.", "p_de": "The material says Harbour Street is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The price is 12 euros for the weekend bus.", "p_de": "The price is 12 euros for the weekend bus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says to arrive by helicopter.", "p_de": "The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The visit lasts a full weekend.", "p_de": "The visit lasts a full weekend.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at the airport instead of the visitor centre.", "p_de": "The visit starts at the airport instead of the visitor centre.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Where is Silver Coast?", "p_de": "Where is Silver Coast?", "s": {"type": "multiple_choice", "options": ["the western coast", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "What time does the visit start?", "p_de": "What time does the visit start?", "s": {"type": "multiple_choice", "options": ["10:30", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Which highlight is included?", "p_de": "Which highlight is included?", "s": {"type": "multiple_choice", "options": ["Cliff Walk", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "How much does it cost?", "p_de": "How much does it cost?", "s": {"type": "multiple_choice", "options": ["12 euros for the weekend bus", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "What is a useful tip?", "p_de": "What is a useful tip?", "s": {"type": "multiple_choice", "options": ["bring a light jacket", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "What is near the end of the visit?", "p_de": "What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the fish market", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Which second highlight is mentioned?", "p_de": "Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["Harbour Street", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "What type of activity or place is described for Silver Coast?", "p_de": "What type of activity or place is described for Silver Coast?", "s": {"type": "multiple_choice", "options": ["a regional leaflet", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6740 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6740 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6740 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6740 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6740 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6740 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6740 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6740 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6740, 'en', 'reading', 'tourism', 'Silver Coast Regional Leaflet\n\nSilver Coast Regional Leaflet is in the western coast. The visit starts at the visitor centre at 10:30.\n\nVisitors see Cliff Walk and Harbour Street. The activity lasts a full weekend and costs 12 euros for the weekend bus.\n\nA useful tip is to bring a light jacket. The fish market is near the end of the visit.')RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Folleto de Silver Coast');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Flyer zur Silver Coast');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
