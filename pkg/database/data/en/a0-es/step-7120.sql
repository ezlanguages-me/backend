-- ============================================================
-- Seed: A0 English Path – STEP 7120 – Listening – listen to a personal email being read (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: Ana and Tom talk about last weekend and the next visit.", "p_de": "Laut dem Material, markiere wahr oder falsch: Ana and Tom talk about last weekend and the next visit.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: They plan a trip to the moon.", "p_de": "Laut dem Material, markiere wahr oder falsch: They plan a trip to the moon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The day mentioned is Sunday.", "p_de": "Laut dem Material, markiere wahr oder falsch: The day mentioned is Sunday.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The transport is the bus.", "p_de": "Laut dem Material, markiere wahr oder falsch: The transport is the bus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: They decide to walk for three days instead.", "p_de": "Laut dem Material, markiere wahr oder falsch: They decide to walk for three days instead.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: They meet at Ana''s house.", "p_de": "Laut dem Material, markiere wahr oder falsch: They meet at Ana''s house.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The request is send the photos.", "p_de": "Laut dem Material, markiere wahr oder falsch: The request is send the photos.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The message ends with See you soon.", "p_de": "Laut dem Material, markiere wahr oder falsch: The message ends with See you soon.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who talks or writes?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who talks or writes?", "s": {"type": "multiple_choice", "options": ["Ana and Tom", "two strangers from a film", "a chef and a farmer"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the destination or main plan?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the destination or main plan?", "s": {"type": "multiple_choice", "options": ["last weekend and the next visit", "the moon", "a hidden cave"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: On which day is the plan?", "p_de": "Laut dem Material, wähle die richtige Antwort: On which day is the plan?", "s": {"type": "multiple_choice", "options": ["Sunday", "last winter", "midnight today"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: At what time is the arrangement?", "p_de": "Laut dem Material, wähle die richtige Antwort: At what time is the arrangement?", "s": {"type": "multiple_choice", "options": ["18:30", "03:30", "00:05"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How do they travel?", "p_de": "Laut dem Material, wähle die richtige Antwort: How do they travel?", "s": {"type": "multiple_choice", "options": ["the bus", "by helicopter only", "on foot for three days"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where do they meet?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where do they meet?", "s": {"type": "multiple_choice", "options": ["Ana''s house", "inside the forest", "under the bridge"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What request is included?", "p_de": "Laut dem Material, wähle die richtige Antwort: What request is included?", "s": {"type": "multiple_choice", "options": ["send the photos", "bring a tractor", "cancel all trains"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How does the note or call end?", "p_de": "Laut dem Material, wähle die richtige Antwort: How does the note or call end?", "s": {"type": "multiple_choice", "options": ["See you soon", "No reply ever", "Please forget the plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7120 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7120 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7120 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7120 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7120 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7120 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7120 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7120 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
    VALUES (v_path_id,7120,'en','listening','phone_correspondence',$transcript$# AUDIO PROFILE
Two known people talk on the phone about simple plans.

## THE SCENE
A short personal call about last weekend and the next visit.

### DIRECTOR'S NOTES
- Style: Natural and clear
- Pace: Slow
- Accent: Neutral English

### SAMPLE CONTEXT
A learner follows a personal phone conversation between Ana and Tom.

#### TRANSCRIPT
[clear] Ana: Hi Tom. I am calling about last weekend and the next visit.
[warm] Tom: Great. Is the plan still for Sunday at 18:30?
[steady] Ana: Yes. We can go by bus.
[helpful] Tom: Fine. Let us meet at Ana's house.
[clear] Ana: Please send the photos.
[friendly] Tom: No problem. I will do that.
[calm] Ana: See you soon.
[warm] Tom: See you then.
$transcript$)
    RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','Lectura de un correo personal','Escucha el correo leído en voz alta y responde.');
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','Vorgelesene persönliche E-Mail','Höre die vorgelesene E-Mail und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
