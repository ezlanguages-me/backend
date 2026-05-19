    -- ============================================================
    -- Seed: A0 English Path – STEP 9690 – Listening – get the point of jokes or allusions with cultural content (Conferencias, Seminarios y Clases)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about a guest at a dinner party misses a Shakespeare allusion in the host''s anecdote.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about a guest at a dinner party misses a Shakespeare allusion in the host''s anecdote.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: the host is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the host is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: One detail is that the host quotes ''all that glitters is not gold'' when describing a failed investment.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the host quotes ''all that glitters is not gold'' when describing a failed investment.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The other side says the guest initially thinks the host is talking about jewellery.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says the guest initially thinks the host is talking about jewellery.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The source named is a dinner party in a private home.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a dinner party in a private home.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the host explains the cultural reference and its common use in everyday English.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the host explains the cultural reference and its common use in everyday English.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a guest at a dinner party misses a Shakespeare allusion in the host''s anecdote", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a dinner party in a private home", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the host", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the host quotes ''all that glitters is not gold'' when describing a failed investment", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["the guest initially thinks the host is talking about jewellery", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the host explains the cultural reference and its common use in everyday English", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a dinner party in a private home", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Cultural literacy opens the door to a deeper understanding of the language.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9690 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9690 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9690 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9690 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9690 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9690 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9690 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9690 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9690,'en','listening','social',$transcript$
    # AUDIO PROFILE
A host and a guest clarify a literary allusion in a friendly social setting.

## THE SCENE
A dinner party in a private home.

### DIRECTOR'S NOTES
- Style: Warm, explanatory and culturally rich
- Pace: Medium
- Accent: British English

### SAMPLE CONTEXT
The conversation turns a misunderstanding into a short lesson about shared cultural references.

#### TRANSCRIPT
[pleasant] Speaker A: When you said the investment glittered, I thought you were talking about jewellery.
[gentle laugh] Speaker B: No, I was quoting “all that glitters is not gold” about the failed investment.
[curious] Speaker A: I missed the Shakespeare reference completely.
[patient] Speaker B: That happens often. It is a famous line people still use in everyday English.
[reflective] Speaker A: So the point is that something attractive can still be deceptive.
[steady] Speaker B: Exactly. The cultural allusion carries the warning very efficiently.
[warm] Speaker A: It makes more sense once you know the source.
[clear] Speaker B: Cultural literacy opens the door to a deeper understanding of the language.
    $transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','get the point of jokes or allusions with cultural content','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','get the point of jokes or allusions with cultural content','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
