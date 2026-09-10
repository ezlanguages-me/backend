-- ============================================================
-- Seed: A0 English Path – STEP 9270 – Listening – rebut criticisms without causing offence (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The audio is about how the presenter responds to a criticism of her research methodology.", "p_de": "The audio is about how the presenter responds to a criticism of her research methodology.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conversation happens in a shopping mall.", "p_de": "The conversation happens in a shopping mall.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the presenter is mentioned.", "p_de": "the presenter is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One detail is that the critic questions the sample size and the validity of the conclusion.", "p_de": "One detail is that the critic questions the sample size and the validity of the conclusion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The other side says the presenter explains that a larger study would not have been feasible.", "p_de": "The other side says the presenter explains that a larger study would not have been feasible.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The speakers refuse to give any conclusion.", "p_de": "The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source named is an academic conference session.", "p_de": "The source named is an academic conference session.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that both agree that the findings are valid within the stated limitations.", "p_de": "The conclusion is that both agree that the findings are valid within the stated limitations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the audio mainly about?", "p_de": "What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the presenter responds to a criticism of her research methodology", "a family dinner", "a weather forecast"], "answer": 0}}'::jsonb,
            '{"p": "Where is the scene set?", "p_de": "Where is the scene set?", "s": {"type": "multiple_choice", "options": ["an academic conference session", "a fitness studio", "a garden party"], "answer": 0}}'::jsonb,
            '{"p": "Who is mentioned?", "p_de": "Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the presenter", "Officer Martinez", "Chef Patricia"], "answer": 0}}'::jsonb,
            '{"p": "What detail is highlighted?", "p_de": "What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the critic questions the sample size and the validity of the conclusion", "the building is renovated", "the flight is cancelled"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint is raised?", "p_de": "What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the presenter explains that a larger study would not have been feasible", "the audience walks out", "the technology fails"], "answer": 0}}'::jsonb,
            '{"p": "What result do the speakers reach?", "p_de": "What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["both agree that the findings are valid within the stated limitations", "the presentation is cancelled", "the research is rejected"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["an academic conference session", "a cooking magazine", "a travel brochure"], "answer": 0}}'::jsonb,
            '{"p": "Which quote fits best?", "p_de": "Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A well-argued response turns criticism into collaboration.", "Silence is the best policy.", "Fast results need no explanation."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9270 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9270 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9270 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9270 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9270 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9270 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9270 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9270 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
        VALUES (
    v_path_id,
    9270,
    'en',
    'listening',
    'academic',
    $transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how the presenter responds to a criticism of her research methodology.

### DIRECTOR'S NOTES
- Style: Academic and measured
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how the presenter responds to a criticism of her research methodology.
[steady] Speaker: The setting is an academic conference session.
[thoughtful] Listener: the presenter is part of the discussion.
[clear] Listener: One important detail is that the critic questions the sample size and the validity of the conclusion.
[measured] Speaker: A different view is that the presenter explains that a larger study would not have been feasible.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that both agree that the findings are valid within the stated limitations.
[warm] Listener: As the speaker says, "A well-argued response turns criticism into collaboration."$transcript$
)RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Criticisms without causing');
        INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Criticisms without causing');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
