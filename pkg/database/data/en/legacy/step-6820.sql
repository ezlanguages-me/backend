-- ============================================================
-- Seed: A0 English Path – STEP 6820 – Listening – follow casual conversation (Socialización)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "The social event is at a student party.", "p_de": "The social event is at a student party.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The event starts at 05:00 in the morning.", "p_de": "The event starts at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The host is Clara.", "p_de": "The host is Clara.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "People do not talk about music and study.", "p_de": "People do not talk about music and study.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The suggested clothes are jeans and a clean shirt.", "p_de": "The suggested clothes are jeans and a clean shirt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The text says to wear a heavy coat and boots.", "p_de": "The text says to wear a heavy coat and boots.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "pizza and juice is mentioned.", "p_de": "pizza and juice is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The phrase \"Where are you from?\" is useful.", "p_de": "The phrase \"Where are you from?\" is useful.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Where is the social event?", "p_de": "Where is the social event?", "s": {"type": "multiple_choice", "options": ["a student party", "at the dentist", "in a train tunnel"], "answer": 0}}'::jsonb,
        '{"p": "When does it begin?", "p_de": "When does it begin?", "s": {"type": "multiple_choice", "options": ["20:30", "05:00", "23:55"], "answer": 0}}'::jsonb,
        '{"p": "Who is the host?", "p_de": "Who is the host?", "s": {"type": "multiple_choice", "options": ["Clara", "the bus driver", "the mayor"], "answer": 0}}'::jsonb,
        '{"p": "What do people do there?", "p_de": "What do people do there?", "s": {"type": "multiple_choice", "options": ["talk about music and study", "paint a bridge", "fix a tractor"], "answer": 0}}'::jsonb,
        '{"p": "What clothes are suggested?", "p_de": "What clothes are suggested?", "s": {"type": "multiple_choice", "options": ["jeans and a clean shirt", "a ski suit", "a rain uniform"], "answer": 0}}'::jsonb,
        '{"p": "What food or drink is mentioned?", "p_de": "What food or drink is mentioned?", "s": {"type": "multiple_choice", "options": ["pizza and juice", "hot soup for breakfast", "airport coffee only"], "answer": 0}}'::jsonb,
        '{"p": "Which phrase is useful?", "p_de": "Which phrase is useful?", "s": {"type": "multiple_choice", "options": ["Where are you from?", "Close the factory gate", "Drive the truck now"], "answer": 0}}'::jsonb,
        '{"p": "What extra social tip is given?", "p_de": "What extra social tip is given?", "s": {"type": "multiple_choice", "options": ["bring a small drink", "run to the exit", "do not speak to anyone"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6820 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6820 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6820 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6820 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6820 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6820 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6820 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6820 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    6820,
    'en',
    'listening',
    'socializing',
    $transcript$# AUDIO PROFILE
Two people talk in a relaxed social setting.

## THE SCENE
A short social exchange at a student party.

### DIRECTOR'S NOTES
- Style: Casual and friendly
- Pace: Slow
- Accent: Neutral English

### SAMPLE CONTEXT
A learner hears a basic social conversation before joining in.

#### TRANSCRIPT
[light] Host: Hi everyone. Welcome to a student party.
[friendly] Host: We start at 20:30, and I am Clara.
[warm] Guest: Great. I am ready to talk about music and study.
[calm] Host: The dress code is jeans and a clean shirt.
[helpful] Host: There is also pizza and juice on the table.
[clear] Guest: I can say, Where are you from?.
[warm] Host: Yes, and please bring a small drink.
[light] Guest: Thanks. That sounds easy.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Informal en una fiesta');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Gespräch auf einer Party');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
