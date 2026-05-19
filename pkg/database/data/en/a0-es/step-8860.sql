-- ============================================================
-- Seed: A0 English Path – STEP 8860 – Listening – understand a tenancy agreement in detail, e.g. technical details and their legal implications (Alquileres)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about the agent explains that subletting is not permitted without written consent.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about the agent explains that subletting is not permitted without written consent.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the agent is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the agent is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the break clause allows early termination with two months'' notice.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the break clause allows early termination with two months'' notice.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says the tenant questions whether the inventory list is legally binding.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the tenant questions whether the inventory list is legally binding.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is the a letting agency office.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is the a letting agency office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that both parties sign the agreement once the disputed clause is amended.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that both parties sign the agreement once the disputed clause is amended.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the agent explains that subletting is not permitted without written consent", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a letting agency office", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the agent", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the break clause allows early termination with two months'' notice", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the tenant questions whether the inventory list is legally binding", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["both parties sign the agreement once the disputed clause is amended", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a letting agency office", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Read every clause before you sign.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8860 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8860 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8860 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8860 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8860 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8860 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8860 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8860 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,8860,'en','listening','rental',$transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly and professionally.

## THE SCENE
A short exchange about the agent explains that subletting is not permitted without written consent.

### DIRECTOR'S NOTES
- Style: Professional and direct
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on this issue: the agent explains that subletting is not permitted without written consent.
[steady] Speaker: The setting is a letting agency office.
[thoughtful] Listener: the agent is part of the discussion.
[clear] Speaker: One important detail is that the break clause allows early termination with two months' notice.
[measured] Listener: A different view is that the tenant questions whether the inventory list is legally binding.
[calm] Speaker: We compare both sides before deciding what is most practical.
[clear] Listener: In the end, the conclusion is that both parties sign the agreement once the disputed clause is amended.
[warm] Speaker: As the speaker says, "Read every clause before you sign."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','understand a tenancy agreement in detail, e.g. technical details and their legal implications','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','understand a tenancy agreement in detail, e.g. technical details and their legal implications','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
