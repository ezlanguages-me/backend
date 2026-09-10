-- ============================================================
-- Seed: A0 English Path – STEP 8730 – Reading – bargain for what you want and reach an agreement (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "The main focus is negotiating the price of a second-hand bicycle.", "p_de": "The main focus is negotiating the price of a second-hand bicycle.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The setting is a hotel breakfast room.", "p_de": "The setting is a hotel breakfast room.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "the seller is mentioned.", "p_de": "the seller is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "One key detail is that the bike has new brakes but a scratched frame.", "p_de": "One key detail is that the bike has new brakes but a scratched frame.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The counterpoint is that the buyer points out the missing light and the worn seat.", "p_de": "The counterpoint is that the buyer points out the missing light and the worn seat.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The text says that nobody offers any evidence.", "p_de": "The text says that nobody offers any evidence.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "The source is the market listing.", "p_de": "The source is the market listing.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "The conclusion is that they agree on a lower price with a lock included.", "p_de": "The conclusion is that they agree on a lower price with a lock included.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "What is the main focus?", "p_de": "What is the main focus?", "s": {"type": "multiple_choice", "options": ["negotiating the price of a second-hand bicycle", "a train delay report", "a sports injury update"], "answer": 0}}'::jsonb,
            '{"p": "Where does the material take place?", "p_de": "Where does the material take place?", "s": {"type": "multiple_choice", "options": ["a weekend market", "a seaside hotel lobby", "a music rehearsal room"], "answer": 0}}'::jsonb,
            '{"p": "Who is named in the material?", "p_de": "Who is named in the material?", "s": {"type": "multiple_choice", "options": ["the seller", "Captain Lewis", "Chef Marta"], "answer": 0}}'::jsonb,
            '{"p": "What key detail is included?", "p_de": "What key detail is included?", "s": {"type": "multiple_choice", "options": ["the bike has new brakes but a scratched frame", "the group cancels the event", "the students miss the train"], "answer": 0}}'::jsonb,
            '{"p": "What counterpoint appears?", "p_de": "What counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the buyer points out the missing light and the worn seat", "the room has no chairs", "the speaker loses the notes"], "answer": 0}}'::jsonb,
            '{"p": "What is the result?", "p_de": "What is the result?", "s": {"type": "multiple_choice", "options": ["they agree on a lower price with a lock included", "the project is abandoned immediately", "the discussion ends without any point"], "answer": 0}}'::jsonb,
            '{"p": "Which source is named?", "p_de": "Which source is named?", "s": {"type": "multiple_choice", "options": ["the market listing", "a weather app", "a tourist postcard"], "answer": 0}}'::jsonb,
            '{"p": "Which quotation fits the material?", "p_de": "Which quotation fits the material?", "s": {"type": "multiple_choice", "options": ["A good bargain ends with both sides clear.", "No evidence means no problem.", "Fast food solves every issue."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8730 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8730 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8730 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8730 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8730 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8730 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8730 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8730 AND path_uuid=v_path_id;
        INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
        VALUES (
    v_path_id,
    8730,
    'en',
    'reading',
    'shopping',
    'Bargain For What You Want And Reach An Agreement

In the market listing, a customer deals with negotiating the price of a second-hand bicycle at a weekend market. the seller listens to the request and checks the practical details before replying.

The text explains that the bike has new brakes but a scratched frame. It also notes that the buyer points out the missing light and the worn seat, which makes the transaction more sensitive and requires clear language.

In the end, the text shows that they agree on a lower price with a lock included. The key reminder is, "A good bargain ends with both sides clear."'
)RETURNING uuid INTO v_reading_id;
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'es', 'Negociar lo que quieres');
        INSERT INTO reading_translation (reading_uuid, language, title) VALUES (v_reading_id, 'de', 'Verhandeln, was man will');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
