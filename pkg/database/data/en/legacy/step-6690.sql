-- ============================================================
-- Seed: A0 English Path – STEP 6690 – Listening – listen to visitor feedback about attractions (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
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
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6690 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6690 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6690 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6690 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6690 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6690 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6690 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6690 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    6690,
    'en',
    'listening',
    'tourism',
    $transcript$# AUDIO PROFILE
One guide speaks clearly to a small group of visitors.

## THE SCENE
A short visit connected to Green Hill Park.

### DIRECTOR'S NOTES
- Style: Friendly and informative
- Pace: Slow
- Accent: Neutral British English

### SAMPLE CONTEXT
A visitor listens to practical information about Green Hill Park.

#### TRANSCRIPT
[warm] Guide: Welcome to Green Hill Park in Luna City.
[clear] Guide: We start at the north gate at 09:00.
[calm] Guide: First, you can see the lake boats.
[informative] Guide: Later, we continue to the flower bridge.
[steady] Guide: The visit lasts two hours.
[helpful] Guide: The price is free.
[friendly] Guide: Please go in the morning.
[calm] Guide: At the end, the tea kiosk is nearby.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Opiniones sobre Green Hill');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Besuchermeinungen zu Green');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
