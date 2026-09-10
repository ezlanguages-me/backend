-- ============================================================
-- Seed: A0 English Path – STEP 6700 – Reading – understand what the principal attractions of a city are as described in a brochure or leaflet (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Luna City is in the green river area.", "p_de": "Luna City is in the green river area.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at 18:00.", "p_de": "The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Visitors can see Green Hill Park.", "p_de": "Visitors can see Green Hill Park.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says Moon Street is not included.", "p_de": "The material says Moon Street is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The price is 7 euros for the city pass.", "p_de": "The price is 7 euros for the city pass.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says to arrive by helicopter.", "p_de": "The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The visit lasts one full day.", "p_de": "The visit lasts one full day.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at the airport instead of the tourist office.", "p_de": "The visit starts at the airport instead of the tourist office.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Where is Luna City?", "p_de": "Where is Luna City?", "s": {"type": "multiple_choice", "options": ["the green river area", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "What time does the visit start?", "p_de": "What time does the visit start?", "s": {"type": "multiple_choice", "options": ["09:15", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Which highlight is included?", "p_de": "Which highlight is included?", "s": {"type": "multiple_choice", "options": ["Green Hill Park", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "How much does it cost?", "p_de": "How much does it cost?", "s": {"type": "multiple_choice", "options": ["7 euros for the city pass", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "What is a useful tip?", "p_de": "What is a useful tip?", "s": {"type": "multiple_choice", "options": ["start near the river", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "What is near the end of the visit?", "p_de": "What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the local food hall", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Which second highlight is mentioned?", "p_de": "Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["Moon Street", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "What type of activity or place is described for Luna City?", "p_de": "What type of activity or place is described for Luna City?", "s": {"type": "multiple_choice", "options": ["a city brochure", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6700 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6700 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6700 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6700 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6700 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6700 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6700 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6700 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 6700, 'en', 'reading', 'tourism', 'Luna City Brochure\n\nLuna City Brochure is in the green river area. The visit starts at the tourist office at 09:15.\n\nVisitors see Green Hill Park and Moon Street. The activity lasts one full day and costs 7 euros for the city pass.\n\nA useful tip is to start near the river. The local food hall is near the end of the visit.')RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Folleto de Luna City');
    INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Flyer zu Luna City');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
