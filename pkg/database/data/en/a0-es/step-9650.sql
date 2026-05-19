    -- ============================================================
    -- Seed: A0 English Path – STEP 9650 – Listening – pick up nuances of meaning/opinion (Socialización)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about a delegate notices the subtle irony in a speaker''s closing remarks at a conference.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about a delegate notices the subtle irony in a speaker''s closing remarks at a conference.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: the delegate is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the delegate is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: One detail is that the speaker says ''that was quite interesting'' but her tone implies strong disagreement.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the speaker says ''that was quite interesting'' but her tone implies strong disagreement.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The other side says another attendee interprets the remark as a sincere compliment.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says another attendee interprets the remark as a sincere compliment.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The source named is a conference reception area.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a conference reception area.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the delegate explains that British understatement often means the opposite of what is said.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the delegate explains that British understatement often means the opposite of what is said.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a delegate notices the subtle irony in a speaker''s closing remarks at a conference", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a conference reception area", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the delegate", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the speaker says ''that was quite interesting'' but her tone implies strong disagreement", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["another attendee interprets the remark as a sincere compliment", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the delegate explains that British understatement often means the opposite of what is said", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a conference reception area", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["In English, what is left unsaid often carries more meaning than the words themselves.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9650 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9650 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9650 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9650 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9650 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9650 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9650 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9650 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9650,'en','listening','social',$transcript$
    # AUDIO PROFILE
Two conference attendees analyse tone, irony and understatement in a polite but nuanced exchange.

## THE SCENE
A conference reception area.

### DIRECTOR'S NOTES
- Style: Subtle, reflective and socially aware
- Pace: Medium
- Accent: British English

### SAMPLE CONTEXT
The speakers focus on how tone changes the meaning of apparently polite words.

#### TRANSCRIPT
[thoughtful] Speaker A: Did you hear the speaker say, “that was quite interesting” at the end?
[measured] Speaker B: Yes, but her tone clearly suggested strong disagreement.
[curious] Speaker A: Another attendee seemed to take it as a genuine compliment.
[calm] Speaker B: That is the tricky part. British understatement often says the opposite in a very polite way.
[reflective] Speaker A: So the real message is hidden in the tone.
[steady] Speaker B: Exactly. You have to listen for attitude, not just for vocabulary.
[warm] Speaker A: That makes the social nuance much clearer.
[quiet emphasis] Speaker B: In English, what is left unsaid often carries more meaning than the words themselves.
    $transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','pick up nuances of meaning/opinion','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','pick up nuances of meaning/opinion','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
