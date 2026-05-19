    -- ============================================================
    -- Seed: A0 English Path – STEP 9620 – Dialogue – participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references (Socialización)
    -- Source language: Spanish
    -- ============================================================
    DO $seed$
    DECLARE
        v_path_id UUID;
        v_dialogue_id UUID;
        v_line_id UUID;
        v_ex_id UUID;
        v_line_order SMALLINT := 0;
        line JSONB;
        ex JSONB;
        v_lines JSONB[] := ARRAY[
            '{"character": "Speaker A", "text": "Did you see Martin’s new meeting schedule this morning?", "es": "¿Has visto esta mañana el nuevo calendario de reuniones de Martin?", "de": "Hast du heute Morgen Martins neuen Besprechungsplan gesehen?"}'::jsonb,
        '{"character": "Colleague", "text": "Yes, and it is funny because he always complained about meetings.", "es": "Sí, y tiene gracia porque siempre se quejaba de las reuniones.", "de": "Ja, und es ist komisch, weil er sich immer über Besprechungen beschwert hat."}'::jsonb,
        '{"character": "Speaker A", "text": "Now he has arranged three extra ones before Friday.", "es": "Ahora ha programado tres más antes del viernes.", "de": "Jetzt hat er drei zusätzliche vor Freitag angesetzt."}'::jsonb,
        '{"character": "Colleague", "text": "Maybe he finally ran out of emails to ignore.", "es": "Quizá por fin se quedó sin correos electrónicos que ignorar.", "de": "Vielleicht sind ihm endlich die E-Mails ausgegangen, die er ignorieren konnte."}'::jsonb,
        '{"character": "Speaker A", "text": "That is exactly the kind of joke people make in this office.", "es": "Ese es exactamente el tipo de broma que se hace en esta oficina.", "de": "Genau so einen Witz macht man in diesem Büro."}'::jsonb,
        '{"character": "Colleague", "text": "It sounds sharp, but it is still very British.", "es": "Suena mordaz, pero sigue siendo muy británico.", "de": "Es klingt spitz, aber immer noch sehr britisch."}'::jsonb,
        '{"character": "Speaker A", "text": "At least we can smile about the absurdity over coffee.", "es": "Al menos podemos sonreír ante lo absurdo mientras tomamos café.", "de": "Wenigstens können wir bei einem Kaffee über die Absurdität lächeln."}'::jsonb,
        '{"character": "Colleague", "text": "Yes, it is a perfect example of British workplace irony.", "es": "Sí, es un ejemplo perfecto de ironía laboral británica.", "de": "Ja, es ein perfektes Beispiel für britische Ironie am Arbeitsplatz."}'::jsonb
        ];
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about two colleagues discuss an ironic situation at work with British humour.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about two colleagues discuss an ironic situation at work with British humour.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: Colleague explains that the manager who always complained about meetings has now scheduled three extra ones.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Colleague explains that the manager who always complained about meetings has now scheduled three extra ones.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that one colleague jokes that the manager probably ran out of emails to ignore.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that one colleague jokes that the manager probably ran out of emails to ignore.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that they laugh and agree the situation is a perfect example of British workplace irony.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that they laugh and agree the situation is a perfect example of British workplace irony.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["two colleagues discuss an ironic situation at work with British humour", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Colleague", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the manager who always complained about meetings has now scheduled three extra ones", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["one colleague jokes that the manager probably ran out of emails to ignore", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["they laugh and agree the situation is a perfect example of British workplace irony", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9620 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9620 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9620 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9620 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9620 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9620 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9620 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9620 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9620,'en','dialogue','social','[{"name": "Speaker A", "gender": "neutral", "avatarURL": "https://example.com/avatars/speaker-a.png"}, {"name": "Colleague", "gender": "neutral", "avatarURL": "https://example.com/avatars/colleague.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;

        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','participate in casual conversations with appropriacy and good understanding of humour, irony and implicit cultural references','Lies den Dialog und beantworte die Fragen.');

        FOREACH line IN ARRAY v_lines LOOP
            INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
            VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
            RETURNING uuid INTO v_line_id;

            INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
            VALUES (v_line_id, 'es', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'es', 'translation', line->>'es')))));
            INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
            VALUES (v_line_id, 'de', jsonb_build_array(jsonb_build_object('translations', jsonb_build_array(jsonb_build_object('languageCode', 'de', 'translation', line->>'de')))));
            v_line_order := v_line_order + 1;
        END LOOP;

        FOREACH ex IN ARRAY v_exercises LOOP
            INSERT INTO exercise (target_uuid,grammar_rule_uuid) VALUES (v_dialogue_id,NULL) RETURNING uuid INTO v_ex_id;
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'es',ex->>'p',ex->'s');
            INSERT INTO exercise_translation (exercise_uuid,language,prompt,specifics) VALUES (v_ex_id,'de',ex->>'p_de',ex->'s');
        END LOOP;
    END;
    $seed$;
