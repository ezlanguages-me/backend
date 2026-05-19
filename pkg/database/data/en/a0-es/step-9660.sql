    -- ============================================================
    -- Seed: A0 English Path – STEP 9660 – Dialogue – pick up nuances of meaning/opinion (Socialización)
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
            '{"character": "Speaker A", "text": "Did you notice the speaker’s final comment at the reception?", "es": "¿Notaste el comentario final de la ponente en la recepción?", "de": "Hast du den letzten Kommentar der Rednerin beim Empfang bemerkt?"}'::jsonb,
        '{"character": "Delegate", "text": "Yes. She said “that was quite interesting”, but her tone sounded strongly critical.", "es": "Sí. Dijo “that was quite interesting”, pero su tono sonaba claramente crítico.", "de": "Ja. Sie sagte „that was quite interesting“, aber ihr Ton klang deutlich kritisch."}'::jsonb,
        '{"character": "Speaker A", "text": "I thought one of the other attendees took it as a compliment.", "es": "Me pareció que otro asistente lo tomó como un cumplido.", "de": "Ich glaube, einer der anderen Teilnehmenden hielt es für ein Kompliment."}'::jsonb,
        '{"character": "Delegate", "text": "He did, but British understatement often means the opposite of the literal words.", "es": "Así fue, pero el understatement británico a menudo significa lo contrario de las palabras literales.", "de": "Genau, aber britisches Understatement bedeutet oft das Gegenteil der wörtlichen Worte."}'::jsonb,
        '{"character": "Speaker A", "text": "So the meaning is really carried by tone and context.", "es": "Entonces el significado lo llevan realmente el tono y el contexto.", "de": "Dann wird die Bedeutung eigentlich von Ton und Kontext getragen."}'::jsonb,
        '{"character": "Delegate", "text": "Exactly. If you miss the nuance, you miss the opinion.", "es": "Exacto. Si se te escapa el matiz, se te escapa la opinión.", "de": "Genau. Wenn dir die Nuance entgeht, entgeht dir auch die Meinung."}'::jsonb,
        '{"character": "Speaker A", "text": "That makes conference English more delicate than it seems.", "es": "Eso hace que el inglés de los congresos sea más delicado de lo que parece.", "de": "Das macht Konferenzenglisch feiner, als es scheint."}'::jsonb,
        '{"character": "Delegate", "text": "Yes, because what is left unsaid often says the most.", "es": "Sí, porque lo que no se dice a menudo dice más que todo lo demás.", "de": "Ja, denn das Ungesagte sagt oft am meisten."}'::jsonb
        ];
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a delegate notices the subtle irony in a speaker''s closing remarks at a conference.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a delegate notices the subtle irony in a speaker''s closing remarks at a conference.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: Delegate explains that the speaker says ''that was quite interesting'' but her tone implies strong disagreement.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Delegate explains that the speaker says ''that was quite interesting'' but her tone implies strong disagreement.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that another attendee interprets the remark as a sincere compliment.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that another attendee interprets the remark as a sincere compliment.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the delegate explains that British understatement often means the opposite of what is said.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the delegate explains that British understatement often means the opposite of what is said.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a delegate notices the subtle irony in a speaker''s closing remarks at a conference", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Delegate", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the speaker says ''that was quite interesting'' but her tone implies strong disagreement", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["another attendee interprets the remark as a sincere compliment", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the delegate explains that British understatement often means the opposite of what is said", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9660 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9660 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9660 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9660 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9660 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9660 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9660 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9660 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9660,'en','dialogue','social','[{"name": "Speaker A", "gender": "neutral", "avatarURL": "https://example.com/avatars/speaker-a.png"}, {"name": "Delegate", "gender": "neutral", "avatarURL": "https://example.com/avatars/delegate.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;

        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','pick up nuances of meaning/opinion','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','pick up nuances of meaning/opinion','Lies den Dialog und beantworte die Fragen.');

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
