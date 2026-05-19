-- ============================================================
-- Seed: A0 English Path – STEP 6810 – Reading – read tips for socializing in English (Socialización)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The social event is at a student party.", "p_de": "Laut dem Material, markiere wahr oder falsch: The social event is at a student party.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event starts at 05:00 in the morning.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event starts at 05:00 in the morning.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The host is Clara.", "p_de": "Laut dem Material, markiere wahr oder falsch: The host is Clara.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: People do not talk about music and study.", "p_de": "Laut dem Material, markiere wahr oder falsch: People do not talk about music and study.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The suggested clothes are jeans and a clean shirt.", "p_de": "Laut dem Material, markiere wahr oder falsch: The suggested clothes are jeans and a clean shirt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The text says to wear a heavy coat and boots.", "p_de": "Laut dem Material, markiere wahr oder falsch: The text says to wear a heavy coat and boots.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: pizza and juice is mentioned.", "p_de": "Laut dem Material, markiere wahr oder falsch: pizza and juice is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The phrase \"Where are you from?\" is useful.", "p_de": "Laut dem Material, markiere wahr oder falsch: The phrase \"Where are you from?\" is useful.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where is the social event?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where is the social event?", "s": {"type": "multiple_choice", "options": ["a student party", "at the dentist", "in a train tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: When does it begin?", "p_de": "Laut dem Material, wähle die richtige Antwort: When does it begin?", "s": {"type": "multiple_choice", "options": ["20:30", "05:00", "23:55"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who is the host?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who is the host?", "s": {"type": "multiple_choice", "options": ["Clara", "the bus driver", "the mayor"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What do people do there?", "p_de": "Laut dem Material, wähle die richtige Antwort: What do people do there?", "s": {"type": "multiple_choice", "options": ["talk about music and study", "paint a bridge", "fix a tractor"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What clothes are suggested?", "p_de": "Laut dem Material, wähle die richtige Antwort: What clothes are suggested?", "s": {"type": "multiple_choice", "options": ["jeans and a clean shirt", "a ski suit", "a rain uniform"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What food or drink is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What food or drink is mentioned?", "s": {"type": "multiple_choice", "options": ["pizza and juice", "hot soup for breakfast", "airport coffee only"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which phrase is useful?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which phrase is useful?", "s": {"type": "multiple_choice", "options": ["Where are you from?", "Close the factory gate", "Drive the truck now"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What extra social tip is given?", "p_de": "Laut dem Material, wähle die richtige Antwort: What extra social tip is given?", "s": {"type": "multiple_choice", "options": ["bring a small drink", "run to the exit", "do not speak to anyone"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6810 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6810 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6810 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6810 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6810 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6810 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6810 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6810 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
    VALUES (v_path_id,6810,'en','reading','socializing','Tips for Socializing in English\n\nThe event is at a student party at 20:30, and the host is Clara.\n\nPeople usually talk about music and study. The suggested clothes are jeans and a clean shirt, and pizza and juice is available.\n\nA useful phrase is "Where are you from?". Another good tip is to bring a small drink.')
    RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','Consejos para socializar en inglés','Lee los consejos y responde.');
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','Tipps zum Kontakteknüpfen auf Englisch','Lies die Tipps und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
