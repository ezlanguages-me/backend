-- ============================================================
-- Seed: A0 English Path – STEP 4820 – Dialogue – take a message over the phone (Teléfono Profesional)
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
        '{"character": "Caller", "text": "Hello, this is Laura Stein from North Clinic. May I speak to Ben Carter?", "es": "Hola, soy Laura Stein de North Clinic. ¿Puedo hablar con Ben Carter?", "de": "Hallo, hier ist Laura Stein von North Clinic. Kann ich mit Ben Carter sprechen?"}'::jsonb,
        '{"character": "Assistant", "text": "He is in a meeting at the moment. Can I take a message?", "es": "Ahora está en una reunión. ¿Puedo tomar un recado?", "de": "Er ist gerade in einer Besprechung. Kann ich eine Nachricht aufnehmen?"}'::jsonb,
        '{"character": "Caller", "text": "Yes, please. Tomorrow''s meeting is now on Thursday at eleven.", "es": "Sí, por favor. La reunión de mañana pasa al jueves a las once.", "de": "Ja, bitte. Das Treffen morgen ist jetzt am Donnerstag um elf Uhr."}'::jsonb,
        '{"character": "Assistant", "text": "Thursday at eleven. Thank you. Is there anything else?", "es": "Jueves a las once. Gracias. ¿Algo más?", "de": "Donnerstag um elf Uhr. Danke. Gibt es noch etwas?"}'::jsonb,
        '{"character": "Caller", "text": "Yes. Ben needs to send the visitor list before noon today.", "es": "Sí. Ben debe enviar la lista de visitantes antes de las doce de hoy.", "de": "Ja. Ben muss die Besucherliste heute vor zwölf Uhr schicken."}'::jsonb,
        '{"character": "Assistant", "text": "Before noon today. I have that.", "es": "Antes de las doce de hoy. Lo anoto.", "de": "Heute vor zwölf Uhr. Das habe ich notiert."}'::jsonb,
        '{"character": "Caller", "text": "Please ask him to call me back on 555-0146.", "es": "Pídale que me devuelva la llamada al 555-0146.", "de": "Bitte sagen Sie ihm, dass er mich unter 555-0146 zurückrufen soll."}'::jsonb,
        '{"character": "Assistant", "text": "Could you repeat the number, please?", "es": "¿Puede repetir el número, por favor?", "de": "Könnten Sie die Nummer bitte wiederholen?"}'::jsonb,
        '{"character": "Caller", "text": "Of course: 555-0146. My email is laura@northclinic.com.", "es": "Claro: 555-0146. Mi correo es laura@northclinic.com.", "de": "Natürlich: 555-0146. Meine E-Mail ist laura@northclinic.com."}'::jsonb,
        '{"character": "Assistant", "text": "Perfect. I will give Ben the message as soon as he is free.", "es": "Perfecto. Le daré el recado a Ben en cuanto esté libre.", "de": "Perfekt. Ich gebe Ben die Nachricht, sobald er frei ist."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "Laura Stein llama desde North Clinic.", "p_de": "Laura Stein ruft von North Clinic an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ben Carter está libre para hablar ahora.", "p_de": "Ben Carter ist jetzt frei zum Sprechen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La reunión cambia al jueves a las once.", "p_de": "Das Meeting wird auf Donnerstag um elf Uhr verschoben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ben debe enviar la lista de visitantes mañana.", "p_de": "Ben soll die Besucherliste morgen schicken.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La persona que llama deja un número y un correo.", "p_de": "Die Anruferin hinterlässt eine Nummer und eine E-Mail.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Por qué no puede hablar Ben?", "p_de": "Warum kann Ben nicht sprechen?", "s": {"type": "multiple_choice", "options": ["He is in a meeting", "He is driving home", "He is on holiday"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo será la reunión?", "p_de": "Wann findet das Treffen statt?", "s": {"type": "multiple_choice", "options": ["On Thursday at eleven", "On Tuesday at ten", "On Friday at noon"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué debe enviar Ben?", "p_de": "Was soll Ben schicken?", "s": {"type": "multiple_choice", "options": ["The visitor list", "A parking pass", "A new invoice"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué número debe usar Ben?", "p_de": "Welche Nummer soll Ben benutzen?", "s": {"type": "multiple_choice", "options": ["555-0146", "555-0416", "555-1046"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué promete hacer el asistente?", "p_de": "Was verspricht der Assistent?", "s": {"type": "multiple_choice", "options": ["Give Ben the message quickly", "Cancel the meeting", "Send a taxi to the clinic"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4820 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 4820 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4820, 'en', 'dialogue', 'professional', '[{"name": "Caller", "gender": "female", "avatarURL": "https://example.com/avatars/caller.png"}, {"name": "Assistant", "gender": "male", "avatarURL": "https://example.com/avatars/assistant.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Tomar un recado para una reunión', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Eine Nachricht zu einem Meeting aufnehmen', '');

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
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
