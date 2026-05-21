-- ============================================================
-- Seed: A0 English Path – STEP 7080 – Listening – handle a personal phone conversation (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Marta and Luis talk about Seville.", "p_de": "Marta and Luis talk about Seville.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "They plan a trip to the moon.", "p_de": "They plan a trip to the moon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The day mentioned is Friday.", "p_de": "The day mentioned is Friday.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The transport is the train.", "p_de": "The transport is the train.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "They decide to walk for three days instead.", "p_de": "They decide to walk for three days instead.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "They meet at platform 3.", "p_de": "They meet at platform 3.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The request is bring the mobile tickets.", "p_de": "The request is bring the mobile tickets.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The message ends with Please call again at 15:00.", "p_de": "The message ends with Please call again at 15:00.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Who talks or writes?", "p_de": "Who talks or writes?", "s": {"type": "multiple_choice", "options": ["Marta and Luis", "two strangers from a film", "a chef and a farmer"], "answer": 0}}'::jsonb,
        '{"p": "What is the destination or main plan?", "p_de": "What is the destination or main plan?", "s": {"type": "multiple_choice", "options": ["Seville", "the moon", "a hidden cave"], "answer": 0}}'::jsonb,
        '{"p": "On which day is the plan?", "p_de": "On which day is the plan?", "s": {"type": "multiple_choice", "options": ["Friday", "last winter", "midnight today"], "answer": 0}}'::jsonb,
        '{"p": "At what time is the arrangement?", "p_de": "At what time is the arrangement?", "s": {"type": "multiple_choice", "options": ["16:00", "03:30", "00:05"], "answer": 0}}'::jsonb,
        '{"p": "How do they travel?", "p_de": "How do they travel?", "s": {"type": "multiple_choice", "options": ["the train", "by helicopter only", "on foot for three days"], "answer": 0}}'::jsonb,
        '{"p": "Where do they meet?", "p_de": "Where do they meet?", "s": {"type": "multiple_choice", "options": ["platform 3", "inside the forest", "under the bridge"], "answer": 0}}'::jsonb,
        '{"p": "What request is included?", "p_de": "What request is included?", "s": {"type": "multiple_choice", "options": ["bring the mobile tickets", "bring a tractor", "cancel all trains"], "answer": 0}}'::jsonb,
        '{"p": "How does the note or call end?", "p_de": "How does the note or call end?", "s": {"type": "multiple_choice", "options": ["Please call again at 15:00", "No reply ever", "Please forget the plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7080 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7080 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7080 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7080 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7080 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7080 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7080 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7080 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    7080,
    'en',
    'listening',
    'phone_correspondence',
    $transcript$# AUDIO PROFILE
Two known people talk on the phone about simple plans.

## THE SCENE
A short personal call about Seville.

### DIRECTOR'S NOTES
- Style: Natural and clear
- Pace: Slow
- Accent: Neutral English

### SAMPLE CONTEXT
A learner follows a personal phone conversation between Marta and Luis.

#### TRANSCRIPT
[clear] Marta: Hi Luis. I am calling about Seville.
[warm] Luis: Great. Is the plan still for Friday at 16:00?
[steady] Marta: Yes. We can go by train.
[helpful] Luis: Fine. Let us meet at platform 3.
[clear] Marta: Please bring the mobile tickets.
[friendly] Luis: No problem. I will do that.
[calm] Marta: Please call again at 15:00.
[warm] Luis: See you then.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Llamada personal sobre Sevilla');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Persönliches Telefonat');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
