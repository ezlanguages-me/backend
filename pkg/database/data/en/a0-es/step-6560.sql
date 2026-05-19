-- ============================================================
-- Seed: A0 English Path – STEP 6560 – Listening – listen to entertainment venue announcements (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_listening_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: Summer Lights Concert is at Riverside Hall.", "p_de": "Laut dem Material, markiere wahr oder falsch: Summer Lights Concert is at Riverside Hall.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event is on Monday morning instead of Saturday.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event is on Monday morning instead of Saturday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: Mila Stone is part of the programme.", "p_de": "Laut dem Material, markiere wahr oder falsch: Mila Stone is part of the programme.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The show has no one short interval.", "p_de": "Laut dem Material, markiere wahr oder falsch: The show has no one short interval.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: Tickets cost 18 euros.", "p_de": "Laut dem Material, markiere wahr oder falsch: Tickets cost 18 euros.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event lasts only ten minutes.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event lasts only ten minutes.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: the Moon Band also appears in the event.", "p_de": "Laut dem Material, markiere wahr oder falsch: the Moon Band also appears in the event.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event starts at 19:30.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event starts at 19:30.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where is Summer Lights Concert?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where is Summer Lights Concert?", "s": {"type": "multiple_choice", "options": ["Riverside Hall", "at the airport", "in a library"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: When does the event start?", "p_de": "Laut dem Material, wähle die richtige Antwort: When does the event start?", "s": {"type": "multiple_choice", "options": ["19:30", "06:00", "23:45"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who performs first?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who performs first?", "s": {"type": "multiple_choice", "options": ["Mila Stone", "the bus driver", "the hotel chef"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How much is one ticket?", "p_de": "Laut dem Material, wähle die richtige Antwort: How much is one ticket?", "s": {"type": "multiple_choice", "options": ["18 euros", "2 euros", "70 euros"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How long does it last?", "p_de": "Laut dem Material, wähle die richtige Antwort: How long does it last?", "s": {"type": "multiple_choice", "options": ["two hours", "ten minutes", "five hours"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What special feature is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What special feature is mentioned?", "s": {"type": "multiple_choice", "options": ["one short interval", "a swimming lesson", "a science test"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: On which day is the event?", "p_de": "Laut dem Material, wähle die richtige Antwort: On which day is the event?", "s": {"type": "multiple_choice", "options": ["Saturday", "Monday morning", "Wednesday dawn"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who else appears?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who else appears?", "s": {"type": "multiple_choice", "options": ["the Moon Band", "the town baker", "the stadium guard"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6560 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6560 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6560 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6560 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6560 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6560 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6560 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6560 AND path_uuid=v_path_id;
    INSERT INTO listening (path_uuid,step_order,source_language,type,category,transcript)
    VALUES (v_path_id,6560,'en','listening','tourism',$transcript$# AUDIO PROFILE
A venue announcer gives clear event information.

## THE SCENE
Visitors have just entered Riverside Hall.

### DIRECTOR'S NOTES
- Style: Helpful and upbeat
- Pace: Medium-slow
- Accent: Neutral British English

### SAMPLE CONTEXT
An audience member listens before Summer Lights Concert.

#### TRANSCRIPT
[bright] Announcer: Good evening. Welcome to Summer Lights Concert at Riverside Hall.
[clear] Announcer: The event is on Saturday and starts at 19:30.
[warm] Announcer: The programme begins with Mila Stone.
[steady] Announcer: Later, you can hear the Moon Band.
[clear] Announcer: Tickets cost 18 euros.
[calm] Announcer: The full event lasts two hours.
[helpful] Announcer: There is one short interval.
[friendly] Announcer: Please keep your ticket ready.
$transcript$)
    RETURNING uuid INTO v_listening_id;
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'es','Anuncios de Riverside Hall','Escucha los anuncios y responde.');
    INSERT INTO listening_translation (listening_uuid,language,title,description) VALUES (v_listening_id,'de','Ansagen in Riverside Hall','Höre die Ansagen und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_listening_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
