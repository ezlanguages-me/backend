-- ============================================================
-- Seed: A0 English Path – STEP 6900 – Listening – identify the main topic of a news broadcast on TV where there is a strong visual element (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The news topic is a new bike bridge.", "p_de": "Laut dem Material, markiere wahr oder falsch: The news topic is a new bike bridge.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The report is about a lost camel in a desert hotel.", "p_de": "Laut dem Material, markiere wahr oder falsch: The report is about a lost camel in a desert hotel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The story happens in River City.", "p_de": "Laut dem Material, markiere wahr oder falsch: The story happens in River City.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: the mayor and local students are mentioned in the report.", "p_de": "Laut dem Material, markiere wahr oder falsch: the mayor and local students are mentioned in the report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The result is that the bridge opened.", "p_de": "Laut dem Material, markiere wahr oder falsch: The result is that the bridge opened.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The report says nothing happened in the end.", "p_de": "Laut dem Material, markiere wahr oder falsch: The report says nothing happened in the end.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The source is Channel 6.", "p_de": "Laut dem Material, markiere wahr oder falsch: The source is Channel 6.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The detail says the bridge connects two parks.", "p_de": "Laut dem Material, markiere wahr oder falsch: The detail says the bridge connects two parks.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the main topic?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the main topic?", "s": {"type": "multiple_choice", "options": ["a new bike bridge", "a cooking class", "a hotel fire drill"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where does the story happen?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where does the story happen?", "s": {"type": "multiple_choice", "options": ["River City", "the desert airport", "a forest camp"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: When is it reported?", "p_de": "Laut dem Material, wähle die richtige Antwort: When is it reported?", "s": {"type": "multiple_choice", "options": ["this morning", "last winter only", "at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["the mayor and local students", "two pilots", "a football team only"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What happens in the end?", "p_de": "Laut dem Material, wähle die richtige Antwort: What happens in the end?", "s": {"type": "multiple_choice", "options": ["the bridge opened", "everyone goes home with no news", "the programme stops forever"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which source reports it?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which source reports it?", "s": {"type": "multiple_choice", "options": ["Channel 6", "Kitchen TV", "Mountain FM"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What extra detail is given?", "p_de": "Laut dem Material, wähle die richtige Antwort: What extra detail is given?", "s": {"type": "multiple_choice", "options": ["the bridge connects two parks", "there is a new camel farm", "the city closes all schools"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which quote fits the story?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which quote fits the story?", "s": {"type": "multiple_choice", "options": ["It is safe and fast", "No one can find the moon", "The airport is under the sea"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6900 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6900 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6900 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6900 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6900 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6900 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6900 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6900 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
    VALUES (v_path_id,6900,'en','listening','media',$transcript$# AUDIO PROFILE
A TV or radio presenter reports short factual news.

## THE SCENE
A broadcast item about a new bike bridge.

### DIRECTOR'S NOTES
- Style: Neutral and informative
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A viewer or listener follows the main points of a report from River City.

#### TRANSCRIPT
[formal] Presenter: This is Channel 6 with a report about a new bike bridge.
[clear] Presenter: The story comes from River City this morning.
[steady] Presenter: The report mentions the mayor and local students.
[neutral] Presenter: The result is that the bridge opened.
[clear] Reporter: One important detail is that the bridge connects two parks.
[measured] Reporter: One speaker says, It is safe and fast.
[formal] Presenter: More details are available online.
[neutral] Presenter: That is the main story for now.
$transcript$)
    RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','Noticia televisiva sobre el puente','Escucha la noticia y responde.');
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','TV-Nachricht über die Brücke','Höre die Nachricht und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
