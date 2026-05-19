-- ============================================================
-- Seed: A0 English Path – STEP 9470 – Listening – rebut counter-arguments (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about how the researcher rebuts a counter-argument about the cost-effectiveness of the approach.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about how the researcher rebuts a counter-argument about the cost-effectiveness of the approach.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a hair salon.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a hair salon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the researcher is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the researcher is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the researcher provides additional data showing long-term savings.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the researcher provides additional data showing long-term savings.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says the critic argues that the short-term cost is too high for most organisations.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the critic argues that the short-term cost is too high for most organisations.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is a research symposium.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a research symposium.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that both sides agree that the approach is viable for larger institutions.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that both sides agree that the approach is viable for larger institutions.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the researcher rebuts a counter-argument about the cost-effectiveness of the approach", "a wedding reception", "a driving lesson"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a research symposium", "a toy store", "a bus terminal"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the researcher", "Coach Anderson", "Architect Elena"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the researcher provides additional data showing long-term savings", "the door is locked", "the meeting is postponed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the critic argues that the short-term cost is too high for most organisations", "the slides are missing", "the speaker forgets the topic"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["both sides agree that the approach is viable for larger institutions", "the debate ends in deadlock", "the proposal is rejected entirely"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a research symposium", "a gossip column", "a fitness blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Strong evidence is the best answer to any counter-argument.", "Ignore all criticism.", "Opinions need no support."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9470 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9470 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9470 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9470 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9470 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9470 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9470 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9470 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9470,'en','listening','academic',$transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how the researcher rebuts a counter-argument about the cost-effectiveness of the approach.

### DIRECTOR'S NOTES
- Style: Academic and measured
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how the researcher rebuts a counter-argument about the cost-effectiveness of the approach.
[steady] Speaker: The setting is a research symposium.
[thoughtful] Listener: the researcher is part of the discussion.
[clear] Listener: One important detail is that the researcher provides additional data showing long-term savings.
[measured] Speaker: A different view is that the critic argues that the short-term cost is too high for most organisations.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that both sides agree that the approach is viable for larger institutions.
[warm] Listener: As the speaker says, "Strong evidence is the best answer to any counter-argument."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','rebut counter-arguments','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','rebut counter-arguments','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
