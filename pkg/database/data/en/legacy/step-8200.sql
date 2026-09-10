-- ============================================================
-- Seed: A0 English Path – STEP 8200 – Listening – take a limited part in a seminar or tutorial, provided that this is conducted sympathetically (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about whether remote lab sessions should stay after the pilot year.", "p_de": "The audio is about whether remote lab sessions should stay after the pilot year.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Dr Chen is mentioned.", "p_de": "Dr Chen is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that supporters say recordings help students review procedures.", "p_de": "One detail is that supporters say recordings help students review procedures.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says critics worry about weaker teamwork and slower troubleshooting.", "p_de": "The other side says critics worry about weaker teamwork and slower troubleshooting.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the tutorial handout.", "p_de": "The source named is the tutorial handout.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the tutorial group supports blended labs rather than fully remote labs.", "p_de": "The conclusion is that the tutorial group supports blended labs rather than fully remote labs.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["whether remote lab sessions should stay after the pilot year", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a tutorial on science teaching", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["Dr Chen", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["supporters say recordings help students review procedures", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["critics worry about weaker teamwork and slower troubleshooting", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the tutorial group supports blended labs rather than fully remote labs", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the tutorial handout", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A defendable position responds to the other side.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8200 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8200 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8200 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8200 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8200 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8200 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8200 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8200 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    8200,
    'en',
    'listening',
    'academic',
    $transcript$# AUDIO PROFILE
A presenter and a respondent explain the material clearly.

## THE SCENE
A short exchange about whether remote lab sessions should stay after the pilot year.

### DIRECTOR'S NOTES
- Style: Academic and clear
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Host: Today we are focusing on whether remote lab sessions should stay after the pilot year.
[steady] Host: The setting is a tutorial on science teaching.
[thoughtful] Guest: Dr Chen is part of the discussion.
[clear] Guest: One important detail is that supporters say recordings help students review procedures.
[measured] Host: A different view is that critics worry about weaker teamwork and slower troubleshooting.
[calm] Guest: We compare both sides before deciding what is most practical.
[clear] Host: In the end, the conclusion is that the tutorial group supports blended labs rather than fully remote labs.
[warm] Guest: As the speaker says, "A defendable position responds to the other side."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Audio de debate académico');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Akademische Debatte');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
