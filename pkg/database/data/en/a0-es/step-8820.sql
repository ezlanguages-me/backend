-- ============================================================
-- Seed: A0 English Path – STEP 8820 – Listening – argue/complain effectively about most problem areas that are likely to occur (Alquileres)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about the landlord refuses to return the deposit after the tenant leaves the flat.", "p_de": "The audio is about the landlord refuses to return the deposit after the tenant leaves the flat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the tenant is mentioned.", "p_de": "the tenant is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the tenant has documented all damage with photos and a written report.", "p_de": "One detail is that the tenant has documented all damage with photos and a written report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says the landlord claims the carpet and windows are damaged beyond normal wear.", "p_de": "The other side says the landlord claims the carpet and windows are damaged beyond normal wear.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the a flat rental office and phone call.", "p_de": "The source named is the a flat rental office and phone call.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that they agree to a partial refund pending the landlord''s written response.", "p_de": "The conclusion is that they agree to a partial refund pending the landlord''s written response.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the landlord refuses to return the deposit after the tenant leaves the flat", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a flat rental office and phone call", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the tenant", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the tenant has documented all damage with photos and a written report", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the landlord claims the carpet and windows are damaged beyond normal wear", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["they agree to a partial refund pending the landlord''s written response", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a flat rental office and phone call", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A clear record protects both landlord and tenant.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8820 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8820 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8820 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8820 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8820 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8820 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8820 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8820 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    8820,
    'en',
    'listening',
    'rental',
    $transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly and professionally.

## THE SCENE
A short exchange about the landlord refuses to return the deposit after the tenant leaves the flat.

### DIRECTOR'S NOTES
- Style: Professional and direct
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on this issue: the landlord refuses to return the deposit after the tenant leaves the flat.
[steady] Speaker: The setting is a flat rental office and phone call.
[thoughtful] Listener: the tenant is part of the discussion.
[clear] Speaker: One important detail is that the tenant has documented all damage with photos and a written report.
[measured] Listener: A different view is that the landlord claims the carpet and windows are damaged beyond normal wear.
[calm] Speaker: We compare both sides before deciding what is most practical.
[clear] Listener: In the end, the conclusion is that they agree to a partial refund pending the landlord's written response.
[warm] Speaker: As the speaker says, "A clear record protects both landlord and tenant."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Audio sobre alquileres');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Audio zu Mietfragen');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
