-- ============================================================
-- Seed: A0 English Path – STEP 8090 – Listening – listen to theoretical academic lecture (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about a model of how input, noticing and practice work together in language learning.", "p_de": "The audio is about a model of how input, noticing and practice work together in language learning.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Dr Green is mentioned.", "p_de": "Dr Green is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that noticing links new language forms to later practice.", "p_de": "One detail is that noticing links new language forms to later practice.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says practice without feedback can repeat weak patterns.", "p_de": "The other side says practice without feedback can repeat weak patterns.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the theory handout.", "p_de": "The source named is the theory handout.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the lecturer concludes that feedback turns noticing into stable use.", "p_de": "The conclusion is that the lecturer concludes that feedback turns noticing into stable use.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a model of how input, noticing and practice work together in language learning", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["an introductory linguistics lecture", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["Dr Green", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["noticing links new language forms to later practice", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["practice without feedback can repeat weak patterns", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the lecturer concludes that feedback turns noticing into stable use", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the theory handout", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A theory is helpful when it explains why the next step matters.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8090 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8090 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8090 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8090 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8090 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8090 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8090 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8090 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    8090,
    'en',
    'listening',
    'academic',
    $transcript$# AUDIO PROFILE
A presenter and a respondent explain the material clearly.

## THE SCENE
A short exchange about a model of how input, noticing and practice work together in language learning.

### DIRECTOR'S NOTES
- Style: Academic and clear
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Host: Today we are focusing on a model of how input, noticing and practice work together in language learning.
[steady] Host: The setting is an introductory linguistics lecture.
[thoughtful] Guest: Dr Green is part of the discussion.
[clear] Guest: One important detail is that noticing links new language forms to later practice.
[measured] Host: A different view is that practice without feedback can repeat weak patterns.
[calm] Guest: We compare both sides before deciding what is most practical.
[clear] Host: In the end, the conclusion is that the lecturer concludes that feedback turns noticing into stable use.
[warm] Guest: As the speaker says, "A theory is helpful when it explains why the next step matters."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Audio académico teórico');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Theoretischer Fachvortrag');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
