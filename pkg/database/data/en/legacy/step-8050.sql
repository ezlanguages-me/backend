-- ============================================================
-- Seed: A0 English Path – STEP 8050 – Listening – follow analytical presentation (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about an analysis of library usage data after new quiet zones were created.", "p_de": "The audio is about an analysis of library usage data after new quiet zones were created.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Rosa is mentioned.", "p_de": "Rosa is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that charts from three weeks show longer visits in the quiet zone.", "p_de": "One detail is that charts from three weeks show longer visits in the quiet zone.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says students also need bookable tutor desks for group questions.", "p_de": "The other side says students also need bookable tutor desks for group questions.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the analytical report.", "p_de": "The source named is the analytical report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the presenter recommends keeping the quiet zones and adding a booking system.", "p_de": "The conclusion is that the presenter recommends keeping the quiet zones and adding a booking system.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["an analysis of library usage data after new quiet zones were created", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a study skills course", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["Rosa", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["charts from three weeks show longer visits in the quiet zone", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["students also need bookable tutor desks for group questions", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the presenter recommends keeping the quiet zones and adding a booking system", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the analytical report", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Analysis is useful when each claim is tied to evidence.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8050 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8050 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8050 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8050 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8050 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8050 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8050 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8050 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    8050,
    'en',
    'listening',
    'academic',
    $transcript$# AUDIO PROFILE
A presenter and a respondent explain the material clearly.

## THE SCENE
A short exchange about an analysis of library usage data after new quiet zones were created.

### DIRECTOR'S NOTES
- Style: Academic and clear
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Host: Today we are focusing on an analysis of library usage data after new quiet zones were created.
[steady] Host: The setting is a study skills course.
[thoughtful] Guest: Rosa is part of the discussion.
[clear] Guest: One important detail is that charts from three weeks show longer visits in the quiet zone.
[measured] Host: A different view is that students also need bookable tutor desks for group questions.
[calm] Guest: We compare both sides before deciding what is most practical.
[clear] Host: In the end, the conclusion is that the presenter recommends keeping the quiet zones and adding a booking system.
[warm] Guest: As the speaker says, "Analysis is useful when each claim is tied to evidence."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Presentación analítica');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Analytischer Vortrag');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
