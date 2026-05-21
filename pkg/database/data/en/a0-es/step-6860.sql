-- ============================================================
-- Seed: A0 English Path – STEP 6860 – Listening – listen to social plans being made (Socialización)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "The social event is at Central Park.", "p_de": "The social event is at Central Park.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The event starts at 05:00 in the morning.", "p_de": "The event starts at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The host is Leo.", "p_de": "The host is Leo.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "People do not meet for a picnic.", "p_de": "People do not meet for a picnic.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The suggested clothes are a light jacket.", "p_de": "The suggested clothes are a light jacket.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The text says to wear a heavy coat and boots.", "p_de": "The text says to wear a heavy coat and boots.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "sandwiches is mentioned.", "p_de": "sandwiches is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The phrase \"Can you come?\" is useful.", "p_de": "The phrase \"Can you come?\" is useful.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Where is the social event?", "p_de": "Where is the social event?", "s": {"type": "multiple_choice", "options": ["Central Park", "at the dentist", "in a train tunnel"], "answer": 0}}'::jsonb,
        '{"p": "When does it begin?", "p_de": "When does it begin?", "s": {"type": "multiple_choice", "options": ["13:00", "05:00", "23:55"], "answer": 0}}'::jsonb,
        '{"p": "Who is the host?", "p_de": "Who is the host?", "s": {"type": "multiple_choice", "options": ["Leo", "the bus driver", "the mayor"], "answer": 0}}'::jsonb,
        '{"p": "What do people do there?", "p_de": "What do people do there?", "s": {"type": "multiple_choice", "options": ["meet for a picnic", "paint a bridge", "fix a tractor"], "answer": 0}}'::jsonb,
        '{"p": "What clothes are suggested?", "p_de": "What clothes are suggested?", "s": {"type": "multiple_choice", "options": ["a light jacket", "a ski suit", "a rain uniform"], "answer": 0}}'::jsonb,
        '{"p": "What food or drink is mentioned?", "p_de": "What food or drink is mentioned?", "s": {"type": "multiple_choice", "options": ["sandwiches", "hot soup for breakfast", "airport coffee only"], "answer": 0}}'::jsonb,
        '{"p": "Which phrase is useful?", "p_de": "Which phrase is useful?", "s": {"type": "multiple_choice", "options": ["Can you come?", "Close the factory gate", "Drive the truck now"], "answer": 0}}'::jsonb,
        '{"p": "What extra social tip is given?", "p_de": "What extra social tip is given?", "s": {"type": "multiple_choice", "options": ["text before noon", "run to the exit", "do not speak to anyone"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6860 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6860 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6860 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6860 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6860 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6860 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6860 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6860 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    6860,
    'en',
    'listening',
    'socializing',
    $transcript$# AUDIO PROFILE
Two people talk in a relaxed social setting.

## THE SCENE
A short social exchange at Central Park.

### DIRECTOR'S NOTES
- Style: Casual and friendly
- Pace: Slow
- Accent: Neutral English

### SAMPLE CONTEXT
A learner hears a basic social conversation before joining in.

#### TRANSCRIPT
[light] Host: Hi everyone. Welcome to Central Park.
[friendly] Host: We start at 13:00, and I am Leo.
[warm] Guest: Great. I am ready to meet for a picnic.
[calm] Host: The dress code is a light jacket.
[helpful] Host: There is also sandwiches on the table.
[clear] Guest: I can say, Can you come?.
[warm] Host: Yes, and please text before noon.
[light] Guest: Thanks. That sounds easy.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Planes para un picnic');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Pläne für ein Picknick');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
