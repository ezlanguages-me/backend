-- ============================================================
-- Seed: A0 English Path – STEP 9390 – Listening – deal with hostile questioning confidently (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about how the speaker handles an aggressive question about the cost of the project.", "p_de": "The audio is about how the speaker handles an aggressive question about the cost of the project.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a grocery store.", "p_de": "The conversation happens in a grocery store.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the speaker is mentioned.", "p_de": "the speaker is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the questioner demands to know why the budget exceeded the original estimate.", "p_de": "One detail is that the questioner demands to know why the budget exceeded the original estimate.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says the speaker explains that unforeseen supply chain issues caused the increase.", "p_de": "The other side says the speaker explains that unforeseen supply chain issues caused the increase.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is a project presentation room.", "p_de": "The source named is a project presentation room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the questioner accepts the explanation and asks for a written breakdown.", "p_de": "The conclusion is that the questioner accepts the explanation and asks for a written breakdown.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the speaker handles an aggressive question about the cost of the project", "a holiday celebration", "a dance performance"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a project presentation room", "a park bench", "a library corner"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the speaker", "Professor Johnson", "Pilot Garcia"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the questioner demands to know why the budget exceeded the original estimate", "the lights go out", "the file is lost"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the speaker explains that unforeseen supply chain issues caused the increase", "the room is loud", "the projector fails"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the questioner accepts the explanation and asks for a written breakdown", "the meeting ends confused", "the speaker walks out"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a project presentation room", "a music store", "a clothing boutique"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A confident and honest answer disarms even the most hostile questioner.", "Avoid difficult questions.", "Anger solves problems."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9390 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9390 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9390 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9390 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9390 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9390 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9390 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9390 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    9390,
    'en',
    'listening',
    'academic',
    $transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how the speaker handles an aggressive question about the cost of the project.

### DIRECTOR'S NOTES
- Style: Academic and measured
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how the speaker handles an aggressive question about the cost of the project.
[steady] Speaker: The setting is a project presentation room.
[thoughtful] Listener: the speaker is part of the discussion.
[clear] Listener: One important detail is that the questioner demands to know why the budget exceeded the original estimate.
[measured] Speaker: A different view is that the speaker explains that unforeseen supply chain issues caused the increase.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that the questioner accepts the explanation and asks for a written breakdown.
[warm] Listener: As the speaker says, "A confident and honest answer disarms even the most hostile questioner."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Deal with hostile questioning');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Deal with hostile questioning');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
