-- ============================================================
-- Seed: A0 English Path – STEP 7190 – Reading – read a personal text message exchange (Comunicación Telefónica y Correspondencia Personal)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: Lia and Ben talk about meeting after class.", "p_de": "Laut dem Material, markiere wahr oder falsch: Lia and Ben talk about meeting after class.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: They plan a trip to the moon.", "p_de": "Laut dem Material, markiere wahr oder falsch: They plan a trip to the moon.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The day mentioned is today.", "p_de": "Laut dem Material, markiere wahr oder falsch: The day mentioned is today.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The transport is on foot.", "p_de": "Laut dem Material, markiere wahr oder falsch: The transport is on foot.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: They decide to walk for three days instead.", "p_de": "Laut dem Material, markiere wahr oder falsch: They decide to walk for three days instead.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: They meet at the cafe on King Street.", "p_de": "Laut dem Material, markiere wahr oder falsch: They meet at the cafe on King Street.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The request is bring the map.", "p_de": "Laut dem Material, markiere wahr oder falsch: The request is bring the map.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The message ends with See you there.", "p_de": "Laut dem Material, markiere wahr oder falsch: The message ends with See you there.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who talks or writes?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who talks or writes?", "s": {"type": "multiple_choice", "options": ["Lia and Ben", "two strangers from a film", "a chef and a farmer"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the destination or main plan?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the destination or main plan?", "s": {"type": "multiple_choice", "options": ["meeting after class", "the moon", "a hidden cave"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: On which day is the plan?", "p_de": "Laut dem Material, wähle die richtige Antwort: On which day is the plan?", "s": {"type": "multiple_choice", "options": ["today", "last winter", "midnight today"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: At what time is the arrangement?", "p_de": "Laut dem Material, wähle die richtige Antwort: At what time is the arrangement?", "s": {"type": "multiple_choice", "options": ["18:00", "03:30", "00:05"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How do they travel?", "p_de": "Laut dem Material, wähle die richtige Antwort: How do they travel?", "s": {"type": "multiple_choice", "options": ["on foot", "by helicopter only", "on foot for three days"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where do they meet?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where do they meet?", "s": {"type": "multiple_choice", "options": ["the cafe on King Street", "inside the forest", "under the bridge"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What request is included?", "p_de": "Laut dem Material, wähle die richtige Antwort: What request is included?", "s": {"type": "multiple_choice", "options": ["bring the map", "bring a tractor", "cancel all trains"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: How does the note or call end?", "p_de": "Laut dem Material, wähle die richtige Antwort: How does the note or call end?", "s": {"type": "multiple_choice", "options": ["See you there", "No reply ever", "Please forget the plan"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7190 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7190 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7190 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7190 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7190 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7190 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7190 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7190 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
    VALUES (v_path_id,7190,'en','reading','phone_correspondence','Lia: Hi! About meeting after class, are we still on for today?\n\nBen: Yes. Let us meet at the cafe on King Street at 18:00. We can go on foot.\n\nLia: Great. I will bring the map.\n\nBen: Perfect. See you there.')
    RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','Mensajes entre Lia y Ben','Lee los mensajes y responde.');
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','Nachrichten zwischen Lia und Ben','Lies die Nachrichten und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
