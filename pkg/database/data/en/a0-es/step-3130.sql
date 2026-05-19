-- ============================================================
-- Seed: A0 English Path – STEP 3130 – Dialogue – deal with a car breakdown situation (Viajes y Transporte)
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
        '{"character": "Agent", "text": "Road Help. What is the problem?", "es": "Road Help. ¿Cuál es el problema?", "de": "Road Help. Was ist das Problem?"}'::jsonb,
        '{"character": "Driver", "text": "My rental car has a flat tyre.", "es": "Mi coche de alquiler tiene una rueda pinchada.", "de": "Mein Mietwagen hat einen platten Reifen."}'::jsonb,
        '{"character": "Agent", "text": "Are you safe now?", "es": "¿Está seguro ahora?", "de": "Sind Sie jetzt in Sicherheit?"}'::jsonb,
        '{"character": "Driver", "text": "Yes. I am in a car park near Green Farm Café.", "es": "Sí. Estoy en un aparcamiento cerca del Green Farm Café.", "de": "Ja. Ich bin auf einem Parkplatz beim Green Farm Café."}'::jsonb,
        '{"character": "Agent", "text": "Good. What is the car number?", "es": "Bien. ¿Cuál es el número del coche?", "de": "Gut. Wie ist die Autonummer?"}'::jsonb,
        '{"character": "Driver", "text": "It is BK21 LMO.", "es": "Es BK21 LMO.", "de": "Sie ist BK21 LMO."}'::jsonb,
        '{"character": "Agent", "text": "A mechanic can come in about thirty minutes.", "es": "Un mecánico puede venir en unos treinta minutos.", "de": "Ein Mechaniker kann in etwa dreißig Minuten kommen."}'::jsonb,
        '{"character": "Driver", "text": "Thank you. Do I stay with the car?", "es": "Gracias. ¿Me quedo con el coche?", "de": "Danke. Bleibe ich beim Auto?"}'::jsonb,
        '{"character": "Agent", "text": "Yes, please wait by the cafe and keep your phone on.", "es": "Sí, por favor espere junto al café y mantenga el teléfono encendido.", "de": "Ja, bitte warten Sie beim Café und lassen Sie Ihr Telefon an."}'::jsonb,
        '{"character": "Driver", "text": "Okay. I will wait there.", "es": "De acuerdo. Esperaré allí.", "de": "Okay. Ich werde dort warten."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El coche de alquiler tiene una rueda pinchada.", "de": "Der Mietwagen hat einen platten Reifen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El conductor está en una carretera muy concurrida.", "de": "Der Fahrer ist auf einer sehr belebten Straße.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La matrícula del coche es BK21 LMO.", "de": "Die Autonummer ist BK21 LMO.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El mecánico llega en diez minutos.", "de": "Der Mechaniker kommt in zehn Minuten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El conductor debe mantener el teléfono encendido.", "de": "Der Fahrer soll das Telefon eingeschaltet lassen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Con quién habla el conductor?", "de": "Mit wem spricht der Fahrer?", "s_es": {"type": "multiple_choice", "options": ["A Road Help agent", "A hotel cook", "A train driver"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mit einem Road Help Mitarbeiter", "Mit einem Hotelkoch", "Mit einem Zugfahrer"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el conductor?", "de": "Wo ist der Fahrer?", "s_es": {"type": "multiple_choice", "options": ["In a car park near Green Farm Café", "At the airport gate", "On a bus to town"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf einem Parkplatz beim Green Farm Café", "Am Flughafengate", "In einem Bus in die Stadt"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es la matrícula del coche?", "de": "Wie lautet die Autonummer?", "s_es": {"type": "multiple_choice", "options": ["BK21 LMO", "BK12 OLM", "LM21 BKO"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["BK21 LMO", "BK12 OLM", "LM21 BKO"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto tiempo debe esperar?", "de": "Wie lange soll er warten?", "s_es": {"type": "multiple_choice", "options": ["About thirty minutes", "About five minutes", "About two hours"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Etwa dreißig Minuten", "Etwa fünf Minuten", "Etwa zwei Stunden"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde debe esperar el conductor?", "de": "Wo soll der Fahrer warten?", "s_es": {"type": "multiple_choice", "options": ["By the cafe", "In the river", "At the ticket office"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Beim Café", "Im Fluss", "Am Ticketschalter"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3130 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3130 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (
        v_path_id,
        3130,
        'en',
        'dialogue',
        'transport',
        '[{"name": "Agent", "gender": "male", "avatarURL": "https://example.com/avatars/agent.png"}, {"name": "Driver", "gender": "female", "avatarURL": "https://example.com/avatars/driver.png"}]'::jsonb
    )
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre una avería del coche', 'Lee un diálogo simple entre un conductor y la asistencia en carretera por una rueda pinchada.'),
        (v_dialogue_id, 'de', 'Sprich über eine Autopanne', 'Lies einen einfachen Dialog zwischen einem Fahrer und der Pannenhilfe wegen eines platten Reifens.');

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
