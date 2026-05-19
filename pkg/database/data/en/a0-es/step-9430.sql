-- ============================================================
-- Seed: A0 English Path – STEP 9430 – Listening – get and hold on to his/her turn to speak (Conferencias, Seminarios y Clases)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about how the participant interrupts politely to add a point before the floor closes.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about how the participant interrupts politely to add a point before the floor closes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a car wash.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a car wash.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the participant is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the participant is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the participant signals with a raised hand and waits for the chair to acknowledge them.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the participant signals with a raised hand and waits for the chair to acknowledge them.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says another speaker tries to continue before the point is made.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says another speaker tries to continue before the point is made.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is a panel discussion session.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a panel discussion session.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the chair gives the floor to the participant who makes a concise and relevant contribution.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the chair gives the floor to the participant who makes a concise and relevant contribution.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the participant interrupts politely to add a point before the floor closes", "a lunch break", "a video game tournament"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a panel discussion session", "a flower shop", "a subway platform"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the participant", "Nurse Thompson", "Designer Carlos"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the participant signals with a raised hand and waits for the chair to acknowledge them", "the window is broken", "the coffee is cold"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["another speaker tries to continue before the point is made", "the room is empty", "the time runs out"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the chair gives the floor to the participant who makes a concise and relevant contribution", "the session is cancelled", "everyone leaves immediately"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a panel discussion session", "a comic book", "a radio jingle"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Knowing when and how to speak is as important as what you say.", "Never interrupt anyone.", "Speak first, think later."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9430 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9430 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9430 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9430 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9430 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9430 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9430 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9430 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9430,'en','listening','academic',$transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how the participant interrupts politely to add a point before the floor closes.

### DIRECTOR'S NOTES
- Style: Academic and measured
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how the participant interrupts politely to add a point before the floor closes.
[steady] Speaker: The setting is a panel discussion session.
[thoughtful] Listener: the participant is part of the discussion.
[clear] Listener: One important detail is that the participant signals with a raised hand and waits for the chair to acknowledge them.
[measured] Speaker: A different view is that another speaker tries to continue before the point is made.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that the chair gives the floor to the participant who makes a concise and relevant contribution.
[warm] Listener: As the speaker says, "Knowing when and how to speak is as important as what you say."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','get and hold on to his/her turn to speak','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','get and hold on to his/her turn to speak','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
