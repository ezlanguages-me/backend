-- ============================================================
-- Seed: A0 English Path – STEP 6980 – Listening – listen to media commentary (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "The Night Train is on TV Plus.", "p_de": "The Night Train is on TV Plus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The programme starts at 03:00 at night.", "p_de": "The programme starts at 03:00 at night.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The host is Omar.", "p_de": "The host is Omar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The topic is a debate about phones in schools.", "p_de": "The topic is a debate about phones in schools.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "two teachers appears in the programme.", "p_de": "two teachers appears in the programme.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The programme is only about silent weather maps.", "p_de": "The programme is only about silent weather maps.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The format is a studio discussion.", "p_de": "The format is a studio discussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "People may like it because of clear arguments from both sides.", "p_de": "People may like it because of clear arguments from both sides.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "What is the programme name?", "p_de": "What is the programme name?", "s": {"type": "multiple_choice", "options": ["The Night Train", "Late Taxi", "Blue Tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Where can people follow it?", "p_de": "Where can people follow it?", "s": {"type": "multiple_choice", "options": ["TV Plus", "the station cafe", "the school gate"], "answer": 0}}'::jsonb,
        '{"p": "When does it begin?", "p_de": "When does it begin?", "s": {"type": "multiple_choice", "options": ["21:00", "03:00", "00:15"], "answer": 0}}'::jsonb,
        '{"p": "Who is the host?", "p_de": "Who is the host?", "s": {"type": "multiple_choice", "options": ["Omar", "the train driver", "the hotel doctor"], "answer": 0}}'::jsonb,
        '{"p": "What topic does it cover?", "p_de": "What topic does it cover?", "s": {"type": "multiple_choice", "options": ["a debate about phones in schools", "shoe repair", "factory alarms"], "answer": 0}}'::jsonb,
        '{"p": "Who is the guest?", "p_de": "Who is the guest?", "s": {"type": "multiple_choice", "options": ["two teachers", "the postman", "the airport pilot"], "answer": 0}}'::jsonb,
        '{"p": "What format does it use?", "p_de": "What format does it use?", "s": {"type": "multiple_choice", "options": ["a studio discussion", "silent homework only", "bus tickets and maps"], "answer": 0}}'::jsonb,
        '{"p": "Why is it interesting?", "p_de": "Why is it interesting?", "s": {"type": "multiple_choice", "options": ["clear arguments from both sides", "because there is no sound", "because it never starts"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6980 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6980 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6980 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6980 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    6980,
    'en',
    'listening',
    'media',
    $transcript$# AUDIO PROFILE
A media host introduces a programme clearly.

## THE SCENE
The opening of The Night Train.

### DIRECTOR'S NOTES
- Style: Smooth and broadcast-like
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the introduction to The Night Train.

#### TRANSCRIPT
[bright] Host: Welcome to The Night Train on TV Plus.
[clear] Host: Today we begin at 21:00 with a debate about phones in schools.
[friendly] Host: I am Omar, and our guest is two teachers.
[steady] Guest: This programme uses a studio discussion.
[warm] Host: People like it because of clear arguments from both sides.
[calm] Guest: We will share simple ideas and examples.
[clear] Host: Stay with us after the break.
[bright] Host: The programme starts now.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Comentario sobre The Night');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Kommentar zu The Night Train');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
