    -- ============================================================
    -- Seed: A0 English Path – STEP 9730 – Listening – understand jokes, colloquial asides and cultural allusions (Conferencias, Seminarios y Clases)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el audio, marca verdadero o falso: The audio is about a foreign student catches a dry humour joke in a British TV comedy.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The audio is about a foreign student catches a dry humour joke in a British TV comedy.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conversation happens in a beach café.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conversation happens in a beach café.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: the student is mentioned.", "p_de": "Laut dem Audio, markiere wahr oder falsch: the student is mentioned.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: One detail is that the joke relies on a double meaning of the word ''right'' — correct versus a tag question.", "p_de": "Laut dem Audio, markiere wahr oder falsch: One detail is that the joke relies on a double meaning of the word ''right'' — correct versus a tag question.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The other side says a friend explains that the same joke would not translate directly into other languages.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The other side says a friend explains that the same joke would not translate directly into other languages.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The speakers refuse to give any conclusion.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The speakers refuse to give any conclusion.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The source named is a student common room.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The source named is a student common room.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, marca verdadero o falso: The conclusion is that the student writes down the phrase as an example of British colloquial English.", "p_de": "Laut dem Audio, markiere wahr oder falsch: The conclusion is that the student writes down the phrase as an example of British colloquial English.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What is the audio mainly about?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What is the audio mainly about?", "s": {"type": "multiple_choice", "options": ["a foreign student catches a dry humour joke in a British TV comedy", "a missing passport", "a mountain rescue"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Where is the scene set?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Where is the scene set?", "s": {"type": "multiple_choice", "options": ["a student common room", "a beach party", "a football tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the student", "Officer Patel", "Driver Emma"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What detail is highlighted?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What detail is highlighted?", "s": {"type": "multiple_choice", "options": ["the joke relies on a double meaning of the word ''right'' — correct versus a tag question", "the bus breaks down", "the window stays closed"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What counterpoint is raised?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What counterpoint is raised?", "s": {"type": "multiple_choice", "options": ["a friend explains that the same joke would not translate directly into other languages", "the speaker misses lunch", "the lights turn off"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: What result do the speakers reach?", "p_de": "Laut dem Audio, wähle die richtige Antwort: What result do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the student writes down the phrase as an example of British colloquial English", "they cancel the topic", "they stay completely silent"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which source is named?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which source is named?", "s": {"type": "multiple_choice", "options": ["a student common room", "a ticket machine", "a travel blog"], "answer": 0}}'::jsonb,
        '{"p": "Según el audio, elige la respuesta correcta: Which quote fits best?", "p_de": "Laut dem Audio, wähle die richtige Antwort: Which quote fits best?", "s": {"type": "multiple_choice", "options": ["Understanding humour in a second language is a sign of true fluency.", "The weather decides the argument.", "We never need documents."], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9730 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9730 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9730 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9730 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9730 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9730 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9730 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9730 AND path_uuid=v_path_id;
        INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
        VALUES (v_path_id,9730,'en','listening','social',$transcript$
    # AUDIO PROFILE
Two students unpack a dry joke from a British TV comedy and explain why it works.

## THE SCENE
A student common room.

### DIRECTOR'S NOTES
- Style: Informal, reflective and humorous
- Pace: Medium
- Accent: British English

### SAMPLE CONTEXT
The speakers connect humour to colloquial English and cultural familiarity.

#### TRANSCRIPT
[amused] Speaker A: You laughed before anyone else at that line in the comedy.
[bright] Speaker B: Yes, because the joke used “right” in two ways at once: correct and a tag question.
[curious] Speaker A: I saw our friend pause for a moment.
[explaining] Speaker B: She said the same joke would not translate directly into other languages.
[thoughtful] Speaker A: So understanding it depends on more than vocabulary.
[steady] Speaker B: Exactly. You need rhythm, context and the habit of hearing that kind of aside.
[warm] Speaker A: It sounds like a real fluency milestone.
[smiling] Speaker B: Understanding humour in a second language is a sign of true fluency.
    $transcript$)
        RETURNING uuid INTO v_listening_id;
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','understand jokes, colloquial asides and cultural allusions','Escucha el audio y responde.');
        INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','understand jokes, colloquial asides and cultural allusions','Höre das Audio und beantworte die Fragen.');
        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END; $seed$;
