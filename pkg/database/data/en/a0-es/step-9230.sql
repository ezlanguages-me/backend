-- ============================================================
-- Seed: A0 English Path – STEP 9230 – Listening – use the telephone confidently, even if the line is bad or the caller has a non-standard accent (Teléfono Profesional)
-- Source language: Spanish
-- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about how the caller manages a difficult phone call about a delayed delivery.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about how the caller manages a difficult phone call about a delayed delivery.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: the caller is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the caller is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: One detail is that the line is noisy but the caller asks the speaker to repeat key details.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the line is noisy but the caller asks the speaker to repeat key details.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The other side says the customer has a non-standard accent and speaks quickly.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the customer has a non-standard accent and speaks quickly.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The source named is a professional phone call and logistics office.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a professional phone call and logistics office.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, marca verdadero o falso: The conclusion is that they clarify all the missing details and agree on a new delivery date.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that they clarify all the missing details and agree on a new delivery date.", "s": {"type": "true_false", "answer": true}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["the caller manages a difficult phone call about a delayed delivery", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a professional phone call and logistics office", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the caller", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the line is noisy but the caller asks the speaker to repeat key details", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the customer has a non-standard accent and speaks quickly", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["they clarify all the missing details and agree on a new delivery date", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a professional phone call and logistics office", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
            '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Patience and clarity solve even the most difficult phone call.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9230 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9230 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9230 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9230 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9230 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9230 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9230 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9230 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9230,'en','listening','professional',$transcript$# AUDIO PROFILE
A speaker and a listener communicate clearly.

## THE SCENE
A short exchange about how the caller manages a difficult phone call about a delayed delivery.

### DIRECTOR'S NOTES
- Style: Professional and clear
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the key idea and the conclusion.

#### TRANSCRIPT
[clear] Speaker: Today we are focusing on how the caller manages a difficult phone call about a delayed delivery.
[steady] Speaker: The setting is a professional phone call and logistics office.
[thoughtful] Listener: the caller is part of the discussion.
[clear] Listener: One important detail is that the line is noisy but the caller asks the speaker to repeat key details.
[measured] Speaker: A different view is that the customer has a non-standard accent and speaks quickly.
[calm] Listener: We compare both sides before deciding what is most practical.
[clear] Speaker: In the end, the conclusion is that they clarify all the missing details and agree on a new delivery date.
[warm] Listener: As the speaker says, "Patience and clarity solve even the most difficult phone call."$transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','use the telephone confidently, even if the line is bad or the caller has a non-standard accent','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','use the telephone confidently, even if the line is bad or the caller has a non-standard accent','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
