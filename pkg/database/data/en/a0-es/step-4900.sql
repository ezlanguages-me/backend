-- ============================================================
-- Seed: A0 English Path – STEP 4900 – Dialogue – ask very simple questions for information, such as What is this? (Conferencias, Seminarios y Clases)
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
        '{"character": "Student", "text": "Excuse me, what is this line for?", "es": "Perdón, ¿para qué es esta fila?", "de": "Entschuldigung, wofür ist diese Schlange?"}'::jsonb,
        '{"character": "Desk assistant", "text": "It is for registration.", "es": "Es para el registro.", "de": "Sie ist für die Anmeldung."}'::jsonb,
        '{"character": "Student", "text": "Thank you. Where is Room C?", "es": "Gracias. ¿Dónde está la sala C?", "de": "Danke. Wo ist Raum C?"}'::jsonb,
        '{"character": "Desk assistant", "text": "Room C is on the first floor next to the cafe.", "es": "La sala C está en la primera planta, junto a la cafetería.", "de": "Raum C ist im ersten Stock neben dem Café."}'::jsonb,
        '{"character": "Student", "text": "What time is the coffee break?", "es": "¿A qué hora es la pausa del café?", "de": "Um wie viel Uhr ist die Kaffeepause?"}'::jsonb,
        '{"character": "Desk assistant", "text": "The coffee break is at eleven o''clock.", "es": "La pausa del café es a las once.", "de": "Die Kaffeepause ist um elf Uhr."}'::jsonb,
        '{"character": "Student", "text": "Is this my speaker badge?", "es": "¿Es esta mi acreditación de ponente?", "de": "Ist das mein Vortragenden-Ausweis?"}'::jsonb,
        '{"character": "Desk assistant", "text": "Yes, your name is on the card.", "es": "Sí, tu nombre está en la tarjeta.", "de": "Ja, dein Name steht auf der Karte."}'::jsonb,
        '{"character": "Student", "text": "Perfect. Thank you for your help.", "es": "Perfecto. Gracias por tu ayuda.", "de": "Perfekt. Danke für deine Hilfe."}'::jsonb,
        '{"character": "Desk assistant", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La fila es para el registro.", "p_de": "Die Schlange ist für die Anmeldung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sala C está en la planta baja.", "p_de": "Raum C ist im Erdgeschoss.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La pausa del café es a las once.", "p_de": "Die Kaffeepause ist um elf Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La estudiante pregunta por una acreditación.", "p_de": "Die Studentin fragt nach einem Ausweis.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El asistente dice que el nombre está en la tarjeta.", "p_de": "Der Mitarbeiter sagt, dass der Name auf der Karte steht.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Para qué es la fila?", "p_de": "Wofür ist die Schlange?", "s": {"type": "multiple_choice", "options": ["For registration", "For lunch tickets", "For the bus stop"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde está la sala C?", "p_de": "Wo ist Raum C?", "s": {"type": "multiple_choice", "options": ["On the first floor next to the cafe", "In the basement near the lab", "Outside by the garden"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es la pausa del café?", "p_de": "Um wie viel Uhr ist die Kaffeepause?", "s": {"type": "multiple_choice", "options": ["At eleven o''clock", "At ten thirty", "At one o''clock"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué comprueba la estudiante al final?", "p_de": "Was prüft die Studentin am Ende?", "s": {"type": "multiple_choice", "options": ["Her speaker badge", "Her train ticket", "Her hotel key"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede ver en la tarjeta?", "p_de": "Was kann man auf der Karte sehen?", "s": {"type": "multiple_choice", "options": ["Her name", "The room price", "The Wi-Fi password"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4900 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 4900 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4900, 'en', 'dialogue', 'academic', '[{"name": "Student", "gender": "female", "avatarURL": "https://example.com/avatars/student.png"}, {"name": "Desk assistant", "gender": "male", "avatarURL": "https://example.com/avatars/desk-assistant.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'es', 'Preguntas simples en el mostrador de la conferencia', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES (v_dialogue_id, 'de', 'Einfache Fragen am Konferenztisch', '');

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
