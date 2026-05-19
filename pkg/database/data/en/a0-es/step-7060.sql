-- ============================================================
-- Seed: A0 English Path – STEP 7060 – Reading – read the media for information quickly and with good understanding (Medios de Comunicación)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID; v_reading_id UUID; v_ex_id UUID; ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Según el material, marca verdadero o falso: The news topic is a quick media round-up.", "p_de": "Laut dem Material, markiere wahr oder falsch: The news topic is a quick media round-up.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The report is about a lost camel in a desert hotel.", "p_de": "Laut dem Material, markiere wahr oder falsch: The report is about a lost camel in a desert hotel.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The story happens in the morning media page.", "p_de": "Laut dem Material, markiere wahr oder falsch: The story happens in the morning media page.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: busy readers are mentioned in the report.", "p_de": "Laut dem Material, markiere wahr oder falsch: busy readers are mentioned in the report.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The result is that they find key facts fast.", "p_de": "Laut dem Material, markiere wahr oder falsch: The result is that they find key facts fast.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The report says nothing happened in the end.", "p_de": "Laut dem Material, markiere wahr oder falsch: The report says nothing happened in the end.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The source is the home page.", "p_de": "Laut dem Material, markiere wahr oder falsch: The source is the home page.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, marca verdadero o falso: The detail says headlines are grouped by topic.", "p_de": "Laut dem Material, markiere wahr oder falsch: The detail says headlines are grouped by topic.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What is the main topic?", "p_de": "Laut dem Material, wähle die richtige Antwort: What is the main topic?", "s": {"type": "multiple_choice", "options": ["a quick media round-up", "a cooking class", "a hotel fire drill"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Where does the story happen?", "p_de": "Laut dem Material, wähle die richtige Antwort: Where does the story happen?", "s": {"type": "multiple_choice", "options": ["the morning media page", "the desert airport", "a forest camp"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: When is it reported?", "p_de": "Laut dem Material, wähle die richtige Antwort: When is it reported?", "s": {"type": "multiple_choice", "options": ["at breakfast", "last winter only", "at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Who is mentioned?", "p_de": "Laut dem Material, wähle die richtige Antwort: Who is mentioned?", "s": {"type": "multiple_choice", "options": ["busy readers", "two pilots", "a football team only"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What happens in the end?", "p_de": "Laut dem Material, wähle die richtige Antwort: What happens in the end?", "s": {"type": "multiple_choice", "options": ["they find key facts fast", "everyone goes home with no news", "the programme stops forever"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which source reports it?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which source reports it?", "s": {"type": "multiple_choice", "options": ["the home page", "Kitchen TV", "Mountain FM"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: What extra detail is given?", "p_de": "Laut dem Material, wähle die richtige Antwort: What extra detail is given?", "s": {"type": "multiple_choice", "options": ["headlines are grouped by topic", "there is a new camel farm", "the city closes all schools"], "answer": 0}}'::jsonb,
        '{"p": "Según el material, elige la respuesta correcta: Which quote fits the story?", "p_de": "Laut dem Material, wähle die richtige Antwort: Which quote fits the story?", "s": {"type": "multiple_choice", "options": ["Fast reading saves time", "No one can find the moon", "The airport is under the sea"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=7060 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=7060 AND path_uuid=v_path_id);
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=7060 AND path_uuid=v_path_id);
    DELETE FROM reading WHERE step_order=7060 AND path_uuid=v_path_id;
    DELETE FROM listening WHERE step_order=7060 AND path_uuid=v_path_id;
    DELETE FROM dialogue WHERE step_order=7060 AND path_uuid=v_path_id;
    DELETE FROM speaking WHERE step_order=7060 AND path_uuid=v_path_id;
    DELETE FROM writing WHERE step_order=7060 AND path_uuid=v_path_id;
    INSERT INTO reading (path_uuid,step_order,source_language,type,category,content)
    VALUES (v_path_id,7060,'en','reading','media','Quick Media Round-Up\n\nthe home page reports a story about a quick media round-up in the morning media page at breakfast.\n\nThe report mentions busy readers, and the result is that they find key facts fast.\n\nOne key detail is that headlines are grouped by topic. A speaker says, "Fast reading saves time."')
    RETURNING uuid INTO v_reading_id;
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'es','Lectura rápida de medios','Lee la página rápida y responde.');
    INSERT INTO reading_translation (reading_uuid,language,title,description) VALUES (v_reading_id,'de','Schnelles Lesen von Medien','Lies die Übersichtsseite und antworte.');
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_reading_id,NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
        INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
    END LOOP;
END; $seed$;
