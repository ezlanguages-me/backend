-- ============================================================
-- Seed: A0 English Path – STEP 6980 – Listening – listen to media commentary (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The Night Train is on TV Plus.", "p_de": "Laut dem Material, markiere wahr oder falsch: The Night Train is on TV Plus.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The programme starts at 03:00 at night.", "p_de": "Laut dem Material, markiere wahr oder falsch: The programme starts at 03:00 at night.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The host is Omar.", "p_de": "Laut dem Material, markiere wahr oder falsch: The host is Omar.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The topic is a debate about phones in schools.", "p_de": "Laut dem Material, markiere wahr oder falsch: The topic is a debate about phones in schools.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: two teachers appears in the programme.", "p_de": "Laut dem Material, markiere wahr oder falsch: two teachers appears in the programme.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The programme is only about silent weather maps.", "p_de": "Laut dem Material, markiere wahr oder falsch: The programme is only about silent weather maps.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The format is a studio discussion.", "p_de": "Laut dem Material, markiere wahr oder falsch: The format is a studio discussion.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: People may like it because of clear arguments from both sides.", "p_de": "Laut dem Material, markiere wahr oder falsch: People may like it because of clear arguments from both sides.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the programme name?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the programme name?", "s": {"type": "multiple_choice", "options": ["The Night Train", "Late Taxi", "Blue Tunnel"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where can people follow it?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where can people follow it?", "s": {"type": "multiple_choice", "options": ["TV Plus", "the station cafe", "the school gate"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: When does it begin?", "p_de": "Laut dem Material, wähle die richtige Antwort: When does it begin?", "s": {"type": "multiple_choice", "options": ["21:00", "03:00", "00:15"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who is the host?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who is the host?", "s": {"type": "multiple_choice", "options": ["Omar", "the train driver", "the hotel doctor"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What topic does it cover?", "p_de": "Laut dem Material, wähle die richtige Antwort: What topic does it cover?", "s": {"type": "multiple_choice", "options": ["a debate about phones in schools", "shoe repair", "factory alarms"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who is the guest?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who is the guest?", "s": {"type": "multiple_choice", "options": ["two teachers", "the postman", "the airport pilot"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What format does it use?", "p_de": "Laut dem Material, wähle die richtige Antwort: What format does it use?", "s": {"type": "multiple_choice", "options": ["a studio discussion", "silent homework only", "bus tickets and maps"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Why is it interesting?", "p_de": "Laut dem Material, wähle die richtige Antwort: Why is it interesting?", "s": {"type": "multiple_choice", "options": ["clear arguments from both sides", "because there is no sound", "because it never starts"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6980 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6980 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6980 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6980 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6980 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
    VALUES (v_path_id,6980,'en','listening','media',$transcript$# AUDIO PROFILE
A media host introduces a programme clearly.

## THE SCENE
The opening of The Night Train.

### DIRECTOR'S NOTES
- Style: Smooth and broadcast-like
- Pace: Medium
- Accent: Neutral English

### SAMPLE CONTEXT
A listener follows the introduction to The Night Train.

#### TRANSCRIPT
[bright] Host: Welcome to The Night Train on TV Plus.
[clear] Host: Today we begin at 21:00 with a debate about phones in schools.
[friendly] Host: I am Omar, and our guest is two teachers.
[steady] Guest: This programme uses a studio discussion.
[warm] Host: People like it because of clear arguments from both sides.
[calm] Guest: We will share simple ideas and examples.
[clear] Host: Stay with us after the break.
[bright] Host: The programme starts now.
$transcript$)
    RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','Comentario sobre The Night Train','Escucha el comentario y responde.');
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','Kommentar zu The Night Train','Höre den Kommentar und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
