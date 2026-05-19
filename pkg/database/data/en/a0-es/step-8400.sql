-- ============================================================
-- Seed: A0 English Path – STEP 8400 – Listening – follow up questions by probing for more detail (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about a presentation on recycled packaging for campus cafés.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about a presentation on recycled packaging for campus cafés.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: Priya is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: Priya is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that questions ask about cost, supplier reliability and student feedback.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that questions ask about cost, supplier reliability and student feedback.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says one audience member worries about moisture resistance.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says one audience member worries about moisture resistance.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is the follow-up sheet.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is the follow-up sheet.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the speaker promises a short pilot with extra data.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the speaker promises a short pilot with extra data.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a presentation on recycled packaging for campus cafés", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a sustainability conference", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["Priya", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["questions ask about cost, supplier reliability and student feedback", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["one audience member worries about moisture resistance", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the speaker promises a short pilot with extra data", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["the follow-up sheet", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A good follow-up question opens the next layer of detail.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=8400 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=8400 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=8400 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=8400 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=8400 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=8400 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=8400 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=8400 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,8400,'en','listening','academic',$transcript$# AUDIO PROFILE
A presenter and a respondent explain the material clearly.

## THE SCENE
A short exchange about a presentation on recycled packaging for campus cafés.

### DIRECTOR'S NOTES
- Style: Academic and clear
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Host: Today we are focusing on a presentation on recycled packaging for campus cafés.
[steady] Host: The setting is a sustainability conference.
[thoughtful] Guest: Priya is part of the discussion.
[clear] Guest: One important detail is that questions ask about cost, supplier reliability and student feedback.
[measured] Host: A different view is that one audience member worries about moisture resistance.
[calm] Guest: We compare both sides before deciding what is most practical.
[clear] Host: In the end, the conclusion is that the speaker promises a short pilot with extra data.
[warm] Guest: As the speaker says, "A good follow-up question opens the next layer of detail."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','follow up questions by probing for more detail','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','follow up questions by probing for more detail','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
