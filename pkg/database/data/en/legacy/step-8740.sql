-- ============================================================
-- Seed: A0 English Path – STEP 8740 – Listening – listen to a bargaining conversation (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about negotiating the price of a second-hand bicycle.", "p_de": "The audio is about negotiating the price of a second-hand bicycle.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the seller is mentioned.", "p_de": "the seller is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the bike has new brakes but a scratched frame.", "p_de": "One detail is that the bike has new brakes but a scratched frame.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says the buyer points out the missing light and the worn seat.", "p_de": "The other side says the buyer points out the missing light and the worn seat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the market listing.", "p_de": "The source named is the market listing.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that they agree on a lower price with a lock included.", "p_de": "The conclusion is that they agree on a lower price with a lock included.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["negotiating the price of a second-hand bicycle", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a weekend market", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the seller", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the bike has new brakes but a scratched frame", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the buyer points out the missing light and the worn seat", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["they agree on a lower price with a lock included", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the market listing", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A good bargain ends with both sides clear.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8740 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8740 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8740 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8740 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8740 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8740 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8740 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8740 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    8740,
    'en',
    'listening',
    'shopping',
    $transcript$# AUDIO PROFILE
A customer and a clerk speak clearly but politely.

## THE SCENE
A short exchange about negotiating the price of a second-hand bicycle.

### DIRECTOR'S NOTES
- Style: Polite and transactional
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Clerk: Today we are focusing on negotiating the price of a second-hand bicycle.
[steady] Clerk: The setting is a weekend market.
[thoughtful] Customer: the seller is part of the discussion.
[clear] Customer: One important detail is that the bike has new brakes but a scratched frame.
[measured] Clerk: A different view is that the buyer points out the missing light and the worn seat.
[calm] Customer: We compare both sides before deciding what is most practical.
[clear] Clerk: In the end, the conclusion is that they agree on a lower price with a lock included.
[warm] Customer: As the speaker says, "A good bargain ends with both sides clear."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'To a bargaining conversation');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'To a bargaining conversation');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
