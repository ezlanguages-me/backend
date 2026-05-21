-- ============================================================
-- Seed: A0 English Path – STEP 9220 – Reading – use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The main focus is that the caller manages a difficult phone call about a delayed delivery.", "p_de": "The main focus is that the caller manages a difficult phone call about a delayed delivery.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The setting is a beach café.", "p_de": "The setting is a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the caller is mentioned.", "p_de": "the caller is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One key detail is that the line is noisy but the caller asks the speaker to repeat key details.", "p_de": "One key detail is that the line is noisy but the caller asks the speaker to repeat key details.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The counterpoint is that the customer has a non-standard accent and speaks quickly.", "p_de": "The counterpoint is that the customer has a non-standard accent and speaks quickly.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The text says that nobody offers any evidence.", "p_de": "The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source is a professional phone call and logistics office.", "p_de": "The source is a professional phone call and logistics office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that they clarify all the missing details and agree on a new delivery date.", "p_de": "The conclusion is that they clarify all the missing details and agree on a new delivery date.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["the caller manages a difficult phone call about a delayed delivery", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Where does the material take place?", "p_de": "Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a professional phone call and logistics office", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Who is named in the material?", "p_de": "Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the caller", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "What key detail is included?", "p_de": "What key detail is included?", "s": {"type": "multiple_choice", "options": ["the line is noisy but the caller asks the speaker to repeat key details", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint appears?", "p_de": "What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the customer has a non-standard accent and speaks quickly", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "What is the result?", "p_de": "What is the result?", "s": {"type": "multiple_choice", "options": ["they clarify all the missing details and agree on a new delivery date", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a professional phone call and logistics office", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Which quotation fits the material?", "p_de": "Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Patience and clarity solve even the most difficult phone call.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9220 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9220 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9220 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9220 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9220 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9220 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9220 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9220 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (
    v_path_id,
    9220,
    'en',
    'reading',
    'professional',
    'A Difficult Delivery Call

In a professional phone call and logistics office, the focus is on how the caller manages a difficult phone call about a delayed delivery. The caller stays calm, asks for repetition, and checks the practical details before replying.

The text explains that the line is noisy but the caller asks the speaker to repeat key details. It also notes that the customer has a non-standard accent and speaks quickly, which makes the situation more nuanced and requires clear language.

In the end, the text shows that they clarify all the missing details and agree on a new delivery date. The key reminder is, "Patience and clarity solve even the most difficult phone call."'
)RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Standard accent');
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Standard accent');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
