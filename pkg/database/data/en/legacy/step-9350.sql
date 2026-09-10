-- ============================================================
-- Seed: A0 English Path – STEP 9350 – Listening – take an active part in most kinds of seminars or tutorials (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about how the student takes an active role in a seminar on environmental policy.", "p_de": "The audio is about how the student takes an active role in a seminar on environmental policy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach resort.", "p_de": "The conversation happens in a beach resort.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the student is mentioned.", "p_de": "the student is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the student asks a clarifying question about carbon offset programmes.", "p_de": "One detail is that the student asks a clarifying question about carbon offset programmes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says another participant challenges the student''s interpretation of the data.", "p_de": "The other side says another participant challenges the student''s interpretation of the data.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is a university seminar room.", "p_de": "The source named is a university seminar room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the tutor summarises both positions and sets a follow-up reading.", "p_de": "The conclusion is that the tutor summarises both positions and sets a follow-up reading.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the student takes an active role in a seminar on environmental policy", "a birthday party", "a museum tour"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a university seminar room", "a shopping center", "a train station"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the student", "Captain Roberts", "Chef Antonio"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the student asks a clarifying question about carbon offset programmes", "the bus arrives late", "the weather changes"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["another participant challenges the student''s interpretation of the data", "the room is cold", "the coffee runs out"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the tutor summarises both positions and sets a follow-up reading", "the seminar is cancelled", "everyone leaves early"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a university seminar room", "a movie theater", "a sports field"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Active participation transforms a seminar into a learning community.", "Silent listening is best.", "Quick answers need no thought."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9350 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9350 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9350 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9350 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9350 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9350 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9350 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9350 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    9350,
    'en',
    'listening',
    'academic',
    $transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how the student takes an active role in a seminar on environmental policy.

### DIRECTOR'S NOTES
- Style: Academic and measured
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how the student takes an active role in a seminar on environmental policy.
[steady] Speaker: The setting is a university seminar room.
[thoughtful] Listener: the student is part of the discussion.
[clear] Listener: One important detail is that the student asks a clarifying question about carbon offset programmes.
[measured] Speaker: A different view is that another participant challenges the student's interpretation of the data.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that the tutor summarises both positions and sets a follow-up reading.
[warm] Listener: As the speaker says, "Active participation transforms a seminar into a learning community."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Audio de seminario');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Seminar-Audio');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
