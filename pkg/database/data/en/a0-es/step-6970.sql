-- ============================================================
-- Seed: A0 English Path – STEP 6970 – Reading – read a film or TV review (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The Night Train is at Cinema Star.", "p_de": "Laut dem Material, markiere wahr oder falsch: The Night Train is at Cinema Star.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event is on Monday morning instead of Friday.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event is on Monday morning instead of Friday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: the station scene is part of the programme.", "p_de": "Laut dem Material, markiere wahr oder falsch: the station scene is part of the programme.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The show has no a quiet ending.", "p_de": "Laut dem Material, markiere wahr oder falsch: The show has no a quiet ending.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: Tickets cost 11 euros.", "p_de": "Laut dem Material, markiere wahr oder falsch: Tickets cost 11 euros.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event lasts only ten minutes.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event lasts only ten minutes.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: the final train speech also appears in the event.", "p_de": "Laut dem Material, markiere wahr oder falsch: the final train speech also appears in the event.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The event starts at 21:00.", "p_de": "Laut dem Material, markiere wahr oder falsch: The event starts at 21:00.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where is The Night Train?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where is The Night Train?", "s": {"type": "multiple_choice", "options": ["Cinema Star", "at the airport", "in a library"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: When does the event start?", "p_de": "Laut dem Material, wähle die richtige Antwort: When does the event start?", "s": {"type": "multiple_choice", "options": ["21:00", "06:00", "23:45"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who performs first?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who performs first?", "s": {"type": "multiple_choice", "options": ["the station scene", "the bus driver", "the hotel chef"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How much is one ticket?", "p_de": "Laut dem Material, wähle die richtige Antwort: How much is one ticket?", "s": {"type": "multiple_choice", "options": ["11 euros", "2 euros", "70 euros"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How long does it last?", "p_de": "Laut dem Material, wähle die richtige Antwort: How long does it last?", "s": {"type": "multiple_choice", "options": ["ninety minutes", "ten minutes", "five hours"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What special feature is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: What special feature is mentioned?", "s": {"type": "multiple_choice", "options": ["a quiet ending", "a swimming lesson", "a science test"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: On which day is the event?", "p_de": "Laut dem Material, wähle die richtige Antwort: On which day is the event?", "s": {"type": "multiple_choice", "options": ["Friday", "Monday morning", "Wednesday dawn"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who else appears?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who else appears?", "s": {"type": "multiple_choice", "options": ["the final train speech", "the town baker", "the stadium guard"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=6970 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=6970 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=6970 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=6970 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=6970 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=6970 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=6970 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=6970 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
    VALUES (v_path_id,6970,'en','reading','media','Review: The Night Train\n\nThe reviewer watched The Night Train at Cinema Star on Friday. The show began at 21:00.\n\nThe strongest parts were the station scene and the final train speech. The full event lasted ninety minutes and the standard ticket was 11 euros.\n\nThe review says the audience enjoyed a quiet ending.')
    RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','Reseña de The Night Train','Lee la reseña y responde.');
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','Rezension von The Night Train','Lies die Rezension und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
