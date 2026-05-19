    -- ============================================================
    -- Seed: A0 English Path – STEP 9700 – Dialogue – get the point of jokes or allusions with cultural content (Conferencias, Seminarios y Clases)
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
            '{"character": "Speaker A", "text": "When you mentioned glitter, I thought you were talking about jewellery.", "es": "Cuando hablaste de brillo, pensé que estabas hablando de joyas.", "de": "Als du von Glanz gesprochen hast, dachte ich, du redest über Schmuck."}'::jsonb,
        '{"character": "Host", "text": "No, I was quoting “all that glitters is not gold” about a failed investment.", "es": "No, estaba citando “all that glitters is not gold” al hablar de una inversión fallida.", "de": "Nein, ich zitierte „all that glitters is not gold“, als ich über eine gescheiterte Investition sprach."}'::jsonb,
        '{"character": "Speaker A", "text": "I completely missed the Shakespeare allusion.", "es": "Se me escapó por completo la alusión a Shakespeare.", "de": "Ich habe die Shakespeare-Anspielung völlig übersehen."}'::jsonb,
        '{"character": "Host", "text": "That is normal if you do not know the cultural reference yet.", "es": "Eso es normal si todavía no conoces la referencia cultural.", "de": "Das ist normal, wenn man die kulturelle Anspielung noch nicht kennt."}'::jsonb,
        '{"character": "Speaker A", "text": "So the idea is that something attractive can still be deceptive.", "es": "Entonces la idea es que algo atractivo puede ser engañoso.", "de": "Also ist die Idee, dass etwas Attraktives trotzdem trügerisch sein kann."}'::jsonb,
        '{"character": "Host", "text": "Exactly, and that is why people still use the line in everyday English.", "es": "Exacto, y por eso la gente sigue usando esa frase en el inglés cotidiano.", "de": "Genau, und deshalb benutzen Menschen diese Zeile noch heute im Alltagsenglisch."}'::jsonb,
        '{"character": "Speaker A", "text": "That kind of allusion adds a lot of meaning in very few words.", "es": "Ese tipo de alusión añade mucho significado en muy pocas palabras.", "de": "So eine Anspielung bringt in sehr wenigen Worten viel Bedeutung mit."}'::jsonb,
        '{"character": "Host", "text": "Yes. Cultural literacy opens the door to a deeper understanding of the language.", "es": "Sí. La alfabetización cultural abre la puerta a una comprensión más profunda de la lengua.", "de": "Ja. Kulturelle Bildung öffnet die Tür zu einem tieferen Verständnis der Sprache."}'::jsonb
        ];
        v_exercises JSONB[] := ARRAY[
            '{"p": "Según el diálogo, marca verdadero o falso: The dialogue is about a guest at a dinner party misses a Shakespeare allusion in the host''s anecdote.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The dialogue is about a guest at a dinner party misses a Shakespeare allusion in the host''s anecdote.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The speakers are planning a beach holiday.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The speakers are planning a beach holiday.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: Host explains that the host quotes ''all that glitters is not gold'' when describing a failed investment.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: Host explains that the host quotes ''all that glitters is not gold'' when describing a failed investment.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: A counterpoint is that the guest initially thinks the host is talking about jewellery.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: A counterpoint is that the guest initially thinks the host is talking about jewellery.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, marca verdadero o falso: The conclusion is that the host explains the cultural reference and its common use in everyday English.", "p_de": "Laut dem Dialog, markiere wahr oder falsch: The conclusion is that the host explains the cultural reference and its common use in everyday English.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What is the main focus?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What is the main focus?", "s": {"type": "multiple_choice", "options": ["a guest at a dinner party misses a Shakespeare allusion in the host''s anecdote", "a broken bus stop", "a lost suitcase"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Who gives the main explanation?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Who gives the main explanation?", "s": {"type": "multiple_choice", "options": ["Host", "the cleaner", "the taxi driver"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which detail is named?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which detail is named?", "s": {"type": "multiple_choice", "options": ["the host quotes ''all that glitters is not gold'' when describing a failed investment", "the door is painted blue", "the train leaves at midnight"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: Which counterpoint appears?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: Which counterpoint appears?", "s": {"type": "multiple_choice", "options": ["the guest initially thinks the host is talking about jewellery", "nobody has a notebook", "the lesson is cancelled"], "answer": 0}}'::jsonb,
        '{"p": "Según el diálogo, elige la respuesta correcta: What conclusion do the speakers reach?", "p_de": "Laut dem Dialog, wähle die richtige Antwort: What conclusion do the speakers reach?", "s": {"type": "multiple_choice", "options": ["the host explains the cultural reference and its common use in everyday English", "they forget the topic completely", "they decide to leave the room"], "answer": 0}}'::jsonb
        ];
    BEGIN
        SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order=9700 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM listening WHERE step_order=9700 AND path_uuid=v_path_id);
DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order=9700 AND path_uuid=v_path_id);
DELETE FROM reading WHERE step_order=9700 AND path_uuid=v_path_id;
DELETE FROM listening WHERE step_order=9700 AND path_uuid=v_path_id;
DELETE FROM dialogue WHERE step_order=9700 AND path_uuid=v_path_id;
DELETE FROM speaking WHERE step_order=9700 AND path_uuid=v_path_id;
DELETE FROM writing WHERE step_order=9700 AND path_uuid=v_path_id;
        INSERT INTO dialogue (path_uuid,step_order,source_language,type,category,characters)
        VALUES (v_path_id,9700,'en','dialogue','social','[{"name": "Speaker A", "gender": "neutral", "avatarURL": "https://example.com/avatars/speaker-a.png"}, {"name": "Host", "gender": "neutral", "avatarURL": "https://example.com/avatars/host.png"}]'::jsonb)
        RETURNING uuid INTO v_dialogue_id;

        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'es','get the point of jokes or allusions with cultural content','Lee el diálogo y responde.');
        INSERT INTO dialogue_translation (dialogue_uuid,language,title,description) VALUES (v_dialogue_id,'de','get the point of jokes or allusions with cultural content','Lies den Dialog und beantworte die Fragen.');

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
