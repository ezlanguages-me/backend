-- ============================================================
-- Seed: A0 English Path – STEP 8770 – Reading – deal with complex or sensitive transactions (e.g. export of an antique) (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The main focus is arranging the export of an antique map.", "p_de": "The main focus is arranging the export of an antique map.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The setting is a hotel breakfast room.", "p_de": "The setting is a hotel breakfast room.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the export agent is mentioned.", "p_de": "the export agent is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One key detail is that the item needs a permit, insurance and a customs declaration.", "p_de": "One key detail is that the item needs a permit, insurance and a customs declaration.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The counterpoint is that the buyer asks about delay risk and fragile packaging.", "p_de": "The counterpoint is that the buyer asks about delay risk and fragile packaging.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The text says that nobody offers any evidence.", "p_de": "The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source is the export guidance note.", "p_de": "The source is the export guidance note.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that the transaction moves forward after the documents are checked.", "p_de": "The conclusion is that the transaction moves forward after the documents are checked.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["arranging the export of an antique map", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Where does the material take place?", "p_de": "Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a specialist antiques shop and shipping office", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Who is named in the material?", "p_de": "Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the export agent", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "What key detail is included?", "p_de": "What key detail is included?", "s": {"type": "multiple_choice", "options": ["the item needs a permit, insurance and a customs declaration", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint appears?", "p_de": "What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the buyer asks about delay risk and fragile packaging", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "What is the result?", "p_de": "What is the result?", "s": {"type": "multiple_choice", "options": ["the transaction moves forward after the documents are checked", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the export guidance note", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Which quotation fits the material?", "p_de": "Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["Sensitive transactions depend on precise paperwork.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8770 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8770 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8770 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8770 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8770 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8770 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8770 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8770 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (
    v_path_id,
    8770,
    'en',
    'reading',
    'shopping',
    'Deal With Complex Or Sensitive Transactions (E.G. Export Of An Antique)

In the export guidance note, a customer deals with arranging the export of an antique map at a specialist antiques shop and shipping office. the export agent listens to the request and checks the practical details before replying.

The text explains that the item needs a permit, insurance and a customs declaration. It also notes that the buyer asks about delay risk and fragile packaging, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that the transaction moves forward after the documents are checked. The key reminder is, "Sensitive transactions depend on precise paperwork."'
)RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Situaciones complejas');
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Komplexe Situationen');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
