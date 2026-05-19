-- ============================================================
-- Seed: A0 English Path – STEP 6550 – Reading – read a theatre or concert programme (Turismo y Entretenimiento)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
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
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6550 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6550 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6550 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6550 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6550 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6550 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6550 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6550 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
    VALUES (v_path_id,6550,'en','reading','tourism','Programme: Summer Lights Concert\n\nSummer Lights Concert is at Riverside Hall on Saturday at 19:30.\n\nThe programme includes Mila Stone and the Moon Band. The event lasts two hours and tickets cost 18 euros.\n\nThere is one short interval. Visitors should arrive ten minutes early.')
    RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','Programa de Summer Lights Concert','Lee el programa y responde.');
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','Programm von Summer Lights Concert','Lies das Programm und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
