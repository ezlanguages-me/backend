-- ============================================================
-- Seed: A0 English Path – STEP 6490 – Listening – listen to tourist information broadcast (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Port Vista is in the sunny coast.", "p_de": "Port Vista is in the sunny coast.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at 18:00.", "p_de": "The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Visitors can see Sun Square.", "p_de": "Visitors can see Sun Square.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says Blue Market is not included.", "p_de": "The material says Blue Market is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The price is 6 euros for the day pass.", "p_de": "The price is 6 euros for the day pass.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The material says to arrive by helicopter.", "p_de": "The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The visit lasts one day.", "p_de": "The visit lasts one day.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The visit starts at the airport instead of the main square.", "p_de": "The visit starts at the airport instead of the main square.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Where is Port Vista?", "p_de": "Where is Port Vista?", "s": {"type": "multiple_choice", "options": ["the sunny coast", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "What time does the visit start?", "p_de": "What time does the visit start?", "s": {"type": "multiple_choice", "options": ["09:30", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Which highlight is included?", "p_de": "Which highlight is included?", "s": {"type": "multiple_choice", "options": ["Sun Square", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "How much does it cost?", "p_de": "How much does it cost?", "s": {"type": "multiple_choice", "options": ["6 euros for the day pass", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "What is a useful tip?", "p_de": "What is a useful tip?", "s": {"type": "multiple_choice", "options": ["buy the pass at the station", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "What is near the end of the visit?", "p_de": "What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the sea wall", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Which second highlight is mentioned?", "p_de": "Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["Blue Market", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "What type of activity or place is described for Port Vista?", "p_de": "What type of activity or place is described for Port Vista?", "s": {"type": "multiple_choice", "options": ["a city guide", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6490 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6490 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6490 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6490 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6490 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6490 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6490 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6490 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    6490,
    'en',
    'listening',
    'tourism',
    $transcript$# AUDIO PROFILE
One guide speaks clearly to a small group of visitors.

## THE SCENE
A short visit connected to Port Vista.

### DIRECTOR'S NOTES
- Style: Friendly and informative
- Pace: Slow
- Accent: Neutral British English

### SAMPLE CONTEXT
A visitor listens to practical information about Port Vista.

#### TRANSCRIPT
[warm] Guide: Welcome to Port Vista in the sunny coast.
[clear] Guide: We start at the main square at 09:30.
[calm] Guide: First, you can see Sun Square.
[informative] Guide: Later, we continue to Blue Market.
[steady] Guide: The visit lasts one day.
[helpful] Guide: The price is 6 euros for the day pass.
[friendly] Guide: Please buy the pass at the station.
[calm] Guide: At the end, the sea wall is nearby.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Turística sobre Port Vista');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Touristeninformation zu Port');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
