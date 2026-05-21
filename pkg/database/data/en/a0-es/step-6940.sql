-- ============================================================
-- Seed: A0 English Path – STEP 6940 – Listening – listen to a radio programme introduction (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Morning Mix is on Radio 8.", "p_de": "Morning Mix is on Radio 8.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The programme starts at 03:00 at night.", "p_de": "The programme starts at 03:00 at night.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The host is Nina.", "p_de": "The host is Nina.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The topic is weekend events.", "p_de": "The topic is weekend events.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "a film critic appears in the programme.", "p_de": "a film critic appears in the programme.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The programme is only about silent weather maps.", "p_de": "The programme is only about silent weather maps.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The format is music and short interviews.", "p_de": "The format is music and short interviews.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "People may like it because of easy ideas for the weekend.", "p_de": "People may like it because of easy ideas for the weekend.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "What is the programme name?", "p_de": "What is the programme name?", "s": {"type": "multiple_choice", "options": ["Morning Mix", "Late Taxi", "Blue Tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Where can people follow it?", "p_de": "Where can people follow it?", "s": {"type": "multiple_choice", "options": ["Radio 8", "the station cafe", "the school gate"], "answer": 0}}'::jsonb,
        '{"p": "When does it begin?", "p_de": "When does it begin?", "s": {"type": "multiple_choice", "options": ["07:00", "03:00", "00:15"], "answer": 0}}'::jsonb,
        '{"p": "Who is the host?", "p_de": "Who is the host?", "s": {"type": "multiple_choice", "options": ["Nina", "the train driver", "the hotel doctor"], "answer": 0}}'::jsonb,
        '{"p": "What topic does it cover?", "p_de": "What topic does it cover?", "s": {"type": "multiple_choice", "options": ["weekend events", "shoe repair", "factory alarms"], "answer": 0}}'::jsonb,
        '{"p": "Who is the guest?", "p_de": "Who is the guest?", "s": {"type": "multiple_choice", "options": ["a film critic", "the postman", "the airport pilot"], "answer": 0}}'::jsonb,
        '{"p": "What format does it use?", "p_de": "What format does it use?", "s": {"type": "multiple_choice", "options": ["music and short interviews", "silent homework only", "bus tickets and maps"], "answer": 0}}'::jsonb,
        '{"p": "Why is it interesting?", "p_de": "Why is it interesting?", "s": {"type": "multiple_choice", "options": ["easy ideas for the weekend", "because there is no sound", "because it never starts"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6940 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6940 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6940 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6940 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6940 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6940 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6940 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6940 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    6940,
    'en',
    'listening',
    'media',
    $transcript$# AUDIO PROFILE
A media host introduces a programme clearly.

## THE SCENE
The opening of Morning Mix.

### DIRECTOR'S NOTES
- Style: Smooth and broadcast-like
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the introduction to Morning Mix.

#### TRANSCRIPT
[bright] Host: Welcome to Morning Mix on Radio 8.
[clear] Host: Today we begin at 07:00 with weekend events.
[friendly] Host: I am Nina, and our guest is a film critic.
[steady] Guest: This programme uses music and short interviews.
[warm] Host: People like it because of easy ideas for the weekend.
[calm] Guest: We will share simple ideas and examples.
[clear] Host: Stay with us after the break.
[bright] Host: The programme starts now.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Introducción de Morning Mix');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Einführung zu Morning Mix');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
