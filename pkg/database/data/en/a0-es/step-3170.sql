-- ============================================================
-- Seed: A0 English Path – STEP 3170 – Dialogue – at customs or border control (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_dialogue_id UUID;
    v_line_uuid UUID;
    v_ex_id UUID;
    v_line_order SMALLINT := 0;
    line JSONB;
    ex JSONB;
    v_lines JSONB[] := ARRAY[
        '{"character": "Officer", "text": "Good afternoon. Please put your bag on the table.", "es": "Buenas tardes. Ponga su bolsa en la mesa, por favor.", "de": "Guten Tag. Bitte stellen Sie Ihre Tasche auf den Tisch."}'::jsonb,
        '{"character": "Traveller", "text": "Of course.", "es": "Claro.", "de": "Natürlich."}'::jsonb,
        '{"character": "Officer", "text": "Do you have anything to declare?", "es": "¿Tiene algo que declarar?", "de": "Haben Sie etwas zu verzollen?"}'::jsonb,
        '{"character": "Traveller", "text": "Yes, I have one bottle of wine.", "es": "Sí, tengo una botella de vino.", "de": "Ja, ich habe eine Flasche Wein."}'::jsonb,
        '{"character": "Officer", "text": "Thank you. Any cigarettes or tobacco?", "es": "Gracias. ¿Lleva cigarrillos o tabaco?", "de": "Danke. Haben Sie Zigaretten oder Tabak dabei?"}'::jsonb,
        '{"character": "Traveller", "text": "No, none.", "es": "No, nada.", "de": "Nein, nichts."}'::jsonb,
        '{"character": "Officer", "text": "Where are you staying tonight?", "es": "¿Dónde se aloja esta noche?", "de": "Wo übernachten Sie heute Nacht?"}'::jsonb,
        '{"character": "Traveller", "text": "At the Sea View Hotel.", "es": "En el Sea View Hotel.", "de": "Im Sea View Hotel."}'::jsonb,
        '{"character": "Officer", "text": "Fine. You can go now.", "es": "Bien. Puede pasar ahora.", "de": "Gut. Sie können jetzt weitergehen."}'::jsonb,
        '{"character": "Traveller", "text": "Thank you very much.", "es": "Muchas gracias.", "de": "Vielen Dank."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El agente pide poner la bolsa en la mesa.", "de": "Der Beamte bittet darum, die Tasche auf den Tisch zu stellen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El viajero tiene dos botellas de vino.", "de": "Der Reisende hat zwei Flaschen Wein.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El viajero no lleva tabaco.", "de": "Der Reisende hat keinen Tabak dabei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El viajero duerme en el Sea View Hotel.", "de": "Der Reisende übernachtet im Sea View Hotel.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El agente se queda con el pasaporte del viajero.", "de": "Der Beamte behält den Reisepass des Reisenden.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Qué debe poner el viajero en la mesa?", "de": "Was soll der Reisende auf den Tisch stellen?", "s_es": {"type": "multiple_choice", "options": ["The bag", "The ticket machine", "The hotel bed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Tasche", "Den Fahrkartenautomaten", "Das Hotelbett"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué declara el viajero?", "de": "Was meldet der Reisende an?", "s_es": {"type": "multiple_choice", "options": ["One bottle of wine", "Three cameras", "A bicycle"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Eine Flasche Wein", "Drei Kameras", "Ein Fahrrad"], "answer": 0}}'::jsonb,
        '{"es": "¿Lleva cigarrillos o tabaco?", "de": "Hat der Reisende Zigaretten oder Tabak dabei?", "s_es": {"type": "multiple_choice", "options": ["No", "Yes, many", "Only one cigar box"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nein", "Ja, viele", "Nur eine Zigarrenschachtel"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde se aloja esta noche?", "de": "Wo übernachtet die Person heute Nacht?", "s_es": {"type": "multiple_choice", "options": ["At the Sea View Hotel", "At the River Bus Station", "At the Green School"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Sea View Hotel", "Am River Bus Station", "In der Green School"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué dice el agente al final?", "de": "Was sagt der Beamte am Ende?", "s_es": {"type": "multiple_choice", "options": ["You can go now", "Please buy a new ticket", "Wait for the next train"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie können jetzt weitergehen", "Bitte kaufen Sie ein neues Ticket", "Warten Sie auf den nächsten Zug"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3170 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3170 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        3170,
        'en',
        'dialogue',
        'transport',
        '[{"name": "Officer", "gender": "male", "avatarURL": "https://example.com/avatars/officer.png"}, {"name": "Traveller", "gender": "female", "avatarURL": "https://example.com/avatars/traveller.png"}]'::jsonb
    )
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Diálogo en aduana o frontera', 'Lee un diálogo simple en un control de aduana con preguntas sobre la bolsa y los objetos declarados.'),
        (v_dialogue_id, 'de', 'Dialog an Zoll oder Grenze', 'Lies einen einfachen Dialog an der Zollkontrolle mit Fragen zur Tasche und zu angemeldeten Gegenständen.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_uuid;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_dialogue_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
