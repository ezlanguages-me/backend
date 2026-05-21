-- ============================================================
-- Seed: A0 English Path – STEP 9340 – Reading – take an active part in most kinds of seminars or tutorials (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The main focus is that the student takes an active role in a seminar on environmental policy.", "p_de": "The main focus is that the student takes an active role in a seminar on environmental policy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The setting is a beach resort.", "p_de": "The setting is a beach resort.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the student is mentioned.", "p_de": "the student is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One key detail is that the student asks a clarifying question about carbon offset programmes.", "p_de": "One key detail is that the student asks a clarifying question about carbon offset programmes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The counterpoint is that another participant challenges the student''s interpretation of the data.", "p_de": "The counterpoint is that another participant challenges the student''s interpretation of the data.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The text says that nobody offers any evidence.", "p_de": "The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source is a university seminar room.", "p_de": "The source is a university seminar room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the tutor summarises both positions and sets a follow-up reading.", "p_de": "The conclusion is that the tutor summarises both positions and sets a follow-up reading.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["the student takes an active role in a seminar on environmental policy", "a birthday party", "a museum tour"], "answer": 0}}'::jsonb,
            '{"p": "Where does the material take place?", "p_de": "Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a university seminar room", "a shopping center", "a train station"], "answer": 0}}'::jsonb,
            '{"p": "Who is named in the material?", "p_de": "Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the student", "Captain Roberts", "Chef Antonio"], "answer": 0}}'::jsonb,
            '{"p": "What key detail is included?", "p_de": "What key detail is included?", "s": {"type": "multiple_choice", "options": ["the student asks a clarifying question about carbon offset programmes", "the bus arrives late", "the weather changes suddenly"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint appears?", "p_de": "What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["another participant challenges the student''s interpretation of the data", "the room is too cold", "the coffee runs out"], "answer": 0}}'::jsonb,
            '{"p": "What is the result?", "p_de": "What is the result?", "s": {"type": "multiple_choice", "options": ["the tutor summarises both positions and sets a follow-up reading", "the seminar is cancelled", "everyone leaves early"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["a university seminar room", "a movie theater", "a sports field"], "answer": 0}}'::jsonb,
            '{"p": "Which quotation fits the material?", "p_de": "Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Active participation transforms a seminar into a learning community.", "Silent listening is always best.", "Quick answers need no thought."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9340 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9340 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9340 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9340 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9340 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9340 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9340 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9340 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (
    v_path_id,
    9340,
    'en',
    'reading',
    'academic',
    'Speaking Up in a Seminar

In a university seminar room, the focus is on how the student takes an active role in a seminar on environmental policy. The student listens to the discussion and contributes relevant ideas with supporting evidence.

The text explains that the student asks a clarifying question about carbon offset programmes. It also notes that another participant challenges the student''s interpretation of the data, which makes the situation more nuanced and requires thoughtful engagement.

In the end, the text shows that the tutor summarises both positions and sets a follow-up reading. The key reminder is, "Active participation transforms a seminar into a learning community."'
)RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Participar en seminarios');
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'An Seminaren teilnehmen');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
