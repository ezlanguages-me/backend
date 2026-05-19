-- ============================================================
-- Seed: A0 English Path – STEP 6450 – Listening – follow audio guide commentary (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: Harbor Museum is in the river district.", "p_de": "Laut dem Material, markiere wahr oder falsch: Harbor Museum is in the river district.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The visit starts at 18:00.", "p_de": "Laut dem Material, markiere wahr oder falsch: The visit starts at 18:00.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: Visitors can see the ship model.", "p_de": "Laut dem Material, markiere wahr oder falsch: Visitors can see the ship model.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The material says the old map is not included.", "p_de": "Laut dem Material, markiere wahr oder falsch: The material says the old map is not included.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The price is free with the ticket.", "p_de": "Laut dem Material, markiere wahr oder falsch: The price is free with the ticket.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The material says to arrive by helicopter.", "p_de": "Laut dem Material, markiere wahr oder falsch: The material says to arrive by helicopter.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The visit lasts 20 minutes.", "p_de": "Laut dem Material, markiere wahr oder falsch: The visit lasts 20 minutes.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The visit starts at the airport instead of room 2.", "p_de": "Laut dem Material, markiere wahr oder falsch: The visit starts at the airport instead of room 2.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where is Harbor Museum?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where is Harbor Museum?", "s": {"type": "multiple_choice", "options": ["the river district", "the airport zone", "the industrial park"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What time does the visit start?", "p_de": "Laut dem Material, wähle die richtige Antwort: What time does the visit start?", "s": {"type": "multiple_choice", "options": ["11:00", "18:00", "06:30"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which highlight is included?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which highlight is included?", "s": {"type": "multiple_choice", "options": ["the ship model", "a supermarket", "a football pitch"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How much does it cost?", "p_de": "Laut dem Material, wähle die richtige Antwort: How much does it cost?", "s": {"type": "multiple_choice", "options": ["free with the ticket", "20 euros", "50 euros"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is a useful tip?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is a useful tip?", "s": {"type": "multiple_choice", "options": ["move slowly and look left", "sleep during the visit", "arrive by helicopter"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is near the end of the visit?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is near the end of the visit?", "s": {"type": "multiple_choice", "options": ["the gift shop", "a factory gate", "a ski lift"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which second highlight is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which second highlight is mentioned?", "s": {"type": "multiple_choice", "options": ["the old map", "a cinema hall", "a farm field"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What type of activity or place is described for Harbor Museum?", "p_de": "Laut dem Material, wähle die richtige Antwort: What type of activity or place is described for Harbor Museum?", "s": {"type": "multiple_choice", "options": ["an audio guide stop", "a hospital", "a school bus"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6450 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6450 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6450 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6450 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6450 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6450 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6450 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6450 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
    VALUES (v_path_id,6450,'en','listening','tourism',$transcript$# AUDIO PROFILE
One guide speaks clearly to a small group of visitors.

## THE SCENE
A short visit connected to Harbor Museum.

### DIRECTOR'S NOTES
- Style: Friendly and informative
- Pace: Slow
- Accent: Neutral British English

### SAMPLE CONTEXT
A visitor listens to practical information about Harbor Museum.

#### TRANSCRIPT
[warm] Guide: Welcome to Harbor Museum in the river district.
[clear] Guide: We start at room 2 at 11:00.
[calm] Guide: First, you can see the ship model.
[informative] Guide: Later, we continue to the old map.
[steady] Guide: The visit lasts 20 minutes.
[helpful] Guide: The price is free with the ticket.
[friendly] Guide: Please move slowly and look left.
[calm] Guide: At the end, the gift shop is nearby.
$transcript$)
    RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','Comentario de audioguía del Harbor Museum','Escucha el comentario y responde.');
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','Audioguide-Kommentar des Harbor Museum','Höre den Kommentar und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
