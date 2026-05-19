    -- ============================================================
    -- Seed: A0 English Path – STEP 9610 – Listening – participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about two colleagues discuss an ironic situation at work with British humour.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about two colleagues discuss an ironic situation at work with British humour.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: the colleague is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the colleague is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: One detail is that the manager who always complained about meetings has now scheduled three extra ones.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the manager who always complained about meetings has now scheduled three extra ones.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The other side says one colleague jokes that the manager probably ran out of emails to ignore.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says one colleague jokes that the manager probably ran out of emails to ignore.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The source named is an office kitchen during a coffee break.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is an office kitchen during a coffee break.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conclusion is that they laugh and agree the situation is a perfect example of British workplace irony.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that they laugh and agree the situation is a perfect example of British workplace irony.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["two colleagues discuss an ironic situation at work with British humour", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["an office kitchen during a coffee break", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the colleague", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the manager who always complained about meetings has now scheduled three extra ones", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["one colleague jokes that the manager probably ran out of emails to ignore", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["they laugh and agree the situation is a perfect example of British workplace irony", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["an office kitchen during a coffee break", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Sometimes the best response to absurdity is a well-timed smile.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9610 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9610 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9610 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9610 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9610 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9610 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9610 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9610 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9610,'en','listening','social',$transcript$
    # AUDIO PROFILE
Two colleagues exchange dry observations and react with understated British humour.

## THE SCENE
An office kitchen during a coffee break.

### DIRECTOR'S NOTES
- Style: Casual, ironic and conversational
- Pace: Medium
- Accent: British English

### SAMPLE CONTEXT
The speakers use humour to comment on an obviously absurd workplace situation.

#### TRANSCRIPT
[lightly amused] Speaker A: Have you seen the new calendar? Martin has added three extra meetings this week.
[wry] Speaker B: The same Martin who spent months complaining that meetings waste everyone’s time.
[steady] Speaker A: That contradiction is why the whole thing sounds so British.
[dry] Speaker B: Exactly. Maybe he finally ran out of emails to ignore.
[quiet laugh] Speaker A: That line says everything without sounding openly rude.
[reflective] Speaker B: Yes, the joke works because everyone understands the irony immediately.
[warm] Speaker A: In the end, we just smile and accept the absurdity for what it is.
[smiling] Speaker B: Sometimes the best response to absurdity is a well-timed smile.
    $transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
