-- ============================================================
-- Seed: A0 English Path – STEP 9020 – Listening – engage in an extended conversation with a visitor on matters within her/his authority/competence (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about the host guides the visitor through the company''s main departments.", "p_de": "The audio is about the host guides the visitor through the company''s main departments.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a beach café.", "p_de": "The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the host is mentioned.", "p_de": "the host is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the visitor is particularly interested in the production and quality control team.", "p_de": "One detail is that the visitor is particularly interested in the production and quality control team.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says the visitor raises a concern about the delivery timeline for the next order.", "p_de": "The other side says the visitor raises a concern about the delivery timeline for the next order.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is the a company head office.", "p_de": "The source named is the a company head office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the host arranges a follow-up call and provides a detailed schedule.", "p_de": "The conclusion is that the host arranges a follow-up call and provides a detailed schedule.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the host guides the visitor through the company''s main departments", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a company head office", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the host", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the visitor is particularly interested in the production and quality control team", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the visitor raises a concern about the delivery timeline for the next order", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the host arranges a follow-up call and provides a detailed schedule", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a company head office", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A well-prepared visit builds lasting professional relationships.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9020 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9020 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9020 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9020 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9020 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9020 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9020 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9020 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    9020,
    'en',
    'listening',
    'professional',
    $transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly and professionally.

## THE SCENE
A short exchange about the host guides the visitor through the company's main departments.

### DIRECTOR'S NOTES
- Style: Professional and direct
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on the host guides the visitor through the company's main departments.
[steady] Speaker: The setting is a company head office.
[thoughtful] Listener: the host is part of the discussion.
[clear] Listener: One important detail is that the visitor is particularly interested in the production and quality control team.
[measured] Speaker: A different view is that the visitor raises a concern about the delivery timeline for the next order.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that the host arranges a follow-up call and provides a detailed schedule.
[warm] Listener: As the speaker says, "A well-prepared visit builds lasting professional relationships."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Audio con un visitante');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Audio mit einem Besucher');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
