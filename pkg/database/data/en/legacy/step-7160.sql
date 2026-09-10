-- ============================================================
-- Seed: A0 English Path – STEP 7160 – Listening – follow phone conversation about arrangements (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Marco and Eva talk about the trip to Toledo.", "p_de": "Marco and Eva talk about the trip to Toledo.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "They plan a trip to the moon.", "p_de": "They plan a trip to the moon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "The day mentioned is next Thursday.", "p_de": "The day mentioned is next Thursday.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The transport is the bus.", "p_de": "The transport is the bus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "They decide to walk for three days instead.", "p_de": "They decide to walk for three days instead.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "They meet at the station cafe.", "p_de": "They meet at the station cafe.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The request is confirm the tickets tonight.", "p_de": "The request is confirm the tickets tonight.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "The message ends with Please confirm.", "p_de": "The message ends with Please confirm.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Who talks or writes?", "p_de": "Who talks or writes?", "s": {"type": "multiple_choice", "options": ["Marco and Eva", "two strangers from a film", "a chef and a farmer"], "answer": 0}}'::jsonb,
        '{"p": "What is the destination or main plan?", "p_de": "What is the destination or main plan?", "s": {"type": "multiple_choice", "options": ["the trip to Toledo", "the moon", "a hidden cave"], "answer": 0}}'::jsonb,
        '{"p": "On which day is the plan?", "p_de": "On which day is the plan?", "s": {"type": "multiple_choice", "options": ["next Thursday", "last winter", "midnight today"], "answer": 0}}'::jsonb,
        '{"p": "At what time is the arrangement?", "p_de": "At what time is the arrangement?", "s": {"type": "multiple_choice", "options": ["09:15", "03:30", "00:05"], "answer": 0}}'::jsonb,
        '{"p": "How do they travel?", "p_de": "How do they travel?", "s": {"type": "multiple_choice", "options": ["the bus", "by helicopter only", "on foot for three days"], "answer": 0}}'::jsonb,
        '{"p": "Where do they meet?", "p_de": "Where do they meet?", "s": {"type": "multiple_choice", "options": ["the station cafe", "inside the forest", "under the bridge"], "answer": 0}}'::jsonb,
        '{"p": "What request is included?", "p_de": "What request is included?", "s": {"type": "multiple_choice", "options": ["confirm the tickets tonight", "bring a tractor", "cancel all trains"], "answer": 0}}'::jsonb,
        '{"p": "How does the note or call end?", "p_de": "How does the note or call end?", "s": {"type": "multiple_choice", "options": ["Please confirm", "No reply ever", "Please forget the plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7160 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7160 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7160 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7160 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7160 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7160 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7160 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7160 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid, step_order, source_language, type, category, transcript)
    VALUES (
    v_path_id,
    7160,
    'en',
    'listening',
    'phone_correspondence',
    $transcript$# AUDIO PROFILE
Two known people talk on the phone about simple plans.

## THE SCENE
A short personal call about the trip to Toledo.

### DIRECTOR'S NOTES
- Style: Natural and clear
- Pace: Slow
- Accent: Neutral English

### SAMPLE CONTEXT
A learner follows a personal phone conversation between Marco and Eva.

#### TRANSCRIPT
[clear] Marco: Hi Eva. I am calling about the trip to Toledo.
[warm] Eva: Great. Is the plan still for next Thursday at 09:15?
[steady] Marco: Yes. We can go by bus.
[helpful] Eva: Fine. Let us meet at the station cafe.
[clear] Marco: Please confirm the tickets tonight.
[friendly] Eva: No problem. I will do that.
[calm] Marco: Please confirm.
[warm] Eva: See you then.
$transcript$
)RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'es', 'Llamada sobre preparativos');
    INSERT INTO listening_translation (listening_uuid, language, title) VALUES (v_listening_id, 'de', 'Telefonat über Absprachen');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
