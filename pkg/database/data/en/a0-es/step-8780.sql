-- ============================================================
-- Seed: A0 English Path – STEP 8780 – Listening – handle a complex transaction conversation (Compras y Transacciones)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about arranging the export of an antique map.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about arranging the export of an antique map.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the export agent is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the export agent is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the item needs a permit, insurance and a customs declaration.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the item needs a permit, insurance and a customs declaration.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says the buyer asks about delay risk and fragile packaging.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the buyer asks about delay risk and fragile packaging.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is the export guidance note.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is the export guidance note.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the transaction moves forward after the documents are checked.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the transaction moves forward after the documents are checked.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["arranging the export of an antique map", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a specialist antiques shop and shipping office", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the export agent", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the item needs a permit, insurance and a customs declaration", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the buyer asks about delay risk and fragile packaging", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the transaction moves forward after the documents are checked", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["the export guidance note", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Sensitive transactions depend on precise paperwork.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8780 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8780 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8780 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8780 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8780 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8780 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8780 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8780 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,8780,'en','listening','shopping',$transcript$# AUDIO PROFILE
A customer and a clerk speak clearly but politely.

## THE SCENE
A short exchange about arranging the export of an antique map.

### DIRECTOR'S NOTES
- Style: Polite and transactional
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Clerk: Today we are focusing on arranging the export of an antique map.
[steady] Clerk: The setting is a specialist antiques shop and shipping office.
[thoughtful] Customer: the export agent is part of the discussion.
[clear] Customer: One important detail is that the item needs a permit, insurance and a customs declaration.
[measured] Clerk: A different view is that the buyer asks about delay risk and fragile packaging.
[calm] Customer: We compare both sides before deciding what is most practical.
[clear] Clerk: In the end, the conclusion is that the transaction moves forward after the documents are checked.
[warm] Customer: As the speaker says, "Sensitive transactions depend on precise paperwork."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','handle a complex transaction conversation','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','handle a complex transaction conversation','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
