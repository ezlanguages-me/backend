-- ============================================================
-- Seed: A0 English Path – STEP 9060 – Listening – give detailed information and deal with most routine problems that are likely to arise (Servicios Laborales (Petición y Prestación))
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about the team leader explains the system backup procedure step by step.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about the team leader explains the system backup procedure step by step.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the team leader is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the team leader is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the backup must run every Friday at midnight on the main server.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the backup must run every Friday at midnight on the main server.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says the colleague asks what to do if the system fails to respond.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the colleague asks what to do if the system fails to respond.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is the a server room and IT office.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is the a server room and IT office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the leader provides a written checklist and emergency contact details.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the leader provides a written checklist and emergency contact details.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the team leader explains the system backup procedure step by step", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a server room and IT office", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the team leader", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the backup must run every Friday at midnight on the main server", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the colleague asks what to do if the system fails to respond", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the leader provides a written checklist and emergency contact details", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a server room and IT office", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["A clear procedure prevents costly mistakes.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9060 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9060 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9060 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9060 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9060 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9060 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9060 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9060 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9060,'en','listening','professional',$transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly and professionally.

## THE SCENE
A short exchange about the team leader explains the system backup procedure step by step.

### DIRECTOR'S NOTES
- Style: Professional and direct
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on the team leader explains the system backup procedure step by step.
[steady] Speaker: The setting is a server room and IT office.
[thoughtful] Listener: the team leader is part of the discussion.
[clear] Listener: One important detail is that the backup must run every Friday at midnight on the main server.
[measured] Speaker: A different view is that the colleague asks what to do if the system fails to respond.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that the leader provides a written checklist and emergency contact details.
[warm] Listener: As the speaker says, "A clear procedure prevents costly mistakes."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','give detailed information and deal with most routine problems that are likely to arise','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','give detailed information and deal with most routine problems that are likely to arise','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
