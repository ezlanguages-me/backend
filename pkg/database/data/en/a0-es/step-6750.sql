-- ============================================================
-- Seed: A0 English Path – STEP 6750 – Listening – listen to tourism promotion audio (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: Silver Coast is in the western coast.", "p_de": "Laut dem Material, markiere wahr oder falsch: Silver Coast is in the western coast.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The visit starts at 18:00.", "p_de": "Laut dem Material, markiere wahr oder falsch: The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: Visitors can see Cliff Walk.", "p_de": "Laut dem Material, markiere wahr oder falsch: Visitors can see Cliff Walk.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The material says Harbour Street is not included.", "p_de": "Laut dem Material, markiere wahr oder falsch: The material says Harbour Street is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The price is 12 euros for the weekend bus.", "p_de": "Laut dem Material, markiere wahr oder falsch: The price is 12 euros for the weekend bus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The material says to arrive by helicopter.", "p_de": "Laut dem Material, markiere wahr oder falsch: The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The visit lasts a full weekend.", "p_de": "Laut dem Material, markiere wahr oder falsch: The visit lasts a full weekend.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The visit starts at the airport instead of the visitor centre.", "p_de": "Laut dem Material, markiere wahr oder falsch: The visit starts at the airport instead of the visitor centre.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where is Silver Coast?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where is Silver Coast?", "s": {"type": "multiple_choice", "options": ["the western coast", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What time does the visit start?", "p_de": "Laut dem Material, wähle die richtige Antwort: What time does the visit start?", "s": {"type": "multiple_choice", "options": ["10:30", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which highlight is included?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which highlight is included?", "s": {"type": "multiple_choice", "options": ["Cliff Walk", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How much does it cost?", "p_de": "Laut dem Material, wähle die richtige Antwort: How much does it cost?", "s": {"type": "multiple_choice", "options": ["12 euros for the weekend bus", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is a useful tip?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is a useful tip?", "s": {"type": "multiple_choice", "options": ["bring a light jacket", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is near the end of the visit?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the fish market", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which second highlight is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["Harbour Street", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What type of activity or place is described for Silver Coast?", "p_de": "Laut dem Material, wähle die richtige Antwort: What type of activity or place is described for Silver Coast?", "s": {"type": "multiple_choice", "options": ["a regional leaflet", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6750 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6750 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6750 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6750 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6750 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6750 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6750 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6750 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
    VALUES (v_path_id,6750,'en','listening','tourism',$transcript$# AUDIO PROFILE
One guide speaks clearly to a small group of visitors.

## THE SCENE
A short visit connected to Silver Coast.

### DIRECTOR'S NOTES
- Style: Friendly and informative
- Pace: Slow
- Accent: Neutral British English

### SAMPLE CONTEXT
A visitor listens to practical information about Silver Coast.

#### TRANSCRIPT
[warm] Guide: Welcome to Silver Coast in the western coast.
[clear] Guide: We start at the visitor centre at 10:30.
[calm] Guide: First, you can see Cliff Walk.
[informative] Guide: Later, we continue to Harbour Street.
[steady] Guide: The visit lasts a full weekend.
[helpful] Guide: The price is 12 euros for the weekend bus.
[friendly] Guide: Please bring a light jacket.
[calm] Guide: At the end, the fish market is nearby.
$transcript$)
    RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','Promoción turística de Silver Coast','Escucha la promoción y responde.');
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','Tourismuswerbung für Silver Coast','Höre die Werbung und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
