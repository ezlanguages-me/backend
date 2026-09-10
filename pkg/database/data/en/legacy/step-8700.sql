-- ============================================================
-- Seed: A0 English Path – STEP 8700 – Listening – ask effectively for refund or exchange of faulty or unwanted goods (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about a refund request for a faulty blender bought two days ago.", "p_de": "The audio is about a refund request for a faulty blender bought two days ago.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the store clerk is mentioned.", "p_de": "the store clerk is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the customer has a receipt and the blender stops after one minute.", "p_de": "One detail is that the customer has a receipt and the blender stops after one minute.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says the box is open but all parts are present.", "p_de": "The other side says the box is open but all parts are present.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the refund and exchange policy.", "p_de": "The source named is the refund and exchange policy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the store offers a full refund or an exchange.", "p_de": "The conclusion is that the store offers a full refund or an exchange.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a refund request for a faulty blender bought two days ago", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["the returns desk of a department store", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the store clerk", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the customer has a receipt and the blender stops after one minute", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the box is open but all parts are present", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the store offers a full refund or an exchange", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the refund and exchange policy", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A calm explanation makes the request clearer.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8700 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8700 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8700 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8700 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8700 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8700 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8700 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8700 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    8700,
    'en',
    'listening',
    'shopping',
    $transcript$# AUDIO PROFILE
A customer and a clerk speak clearly but politely.

## THE SCENE
A short exchange about a refund request for a faulty blender bought two days ago.

### DIRECTOR'S NOTES
- Style: Polite and transactional
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Clerk: Today we are focusing on a refund request for a faulty blender bought two days ago.
[steady] Clerk: The setting is the returns desk of a department store.
[thoughtful] Customer: the store clerk is part of the discussion.
[clear] Customer: One important detail is that the customer has a receipt and the blender stops after one minute.
[measured] Clerk: A different view is that the box is open but all parts are present.
[calm] Customer: We compare both sides before deciding what is most practical.
[clear] Clerk: In the end, the conclusion is that the store offers a full refund or an exchange.
[warm] Customer: As the speaker says, "A calm explanation makes the request clearer."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Audio de cambio de producto');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Audio zum Warenumtausch');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
