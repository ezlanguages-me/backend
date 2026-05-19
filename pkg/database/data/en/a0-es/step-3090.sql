-- ============================================================
-- Seed: A0 English Path – STEP 3090 – Dialogue – ask for and give driving directions
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
        '{"character": "Local", "text": "Hello. You look lost.", "es": "Hola. Parece perdido.", "de": "Hallo. Sie sehen verloren aus."}'::jsonb,
        '{"character": "Driver", "text": "Yes. How do I get to the museum car park?", "es": "Sí. ¿Cómo llego al aparcamiento del museo?", "de": "Ja. Wie komme ich zum Museumsparkplatz?"}'::jsonb,
        '{"character": "Local", "text": "Drive straight to the traffic lights.", "es": "Siga recto hasta los semáforos.", "de": "Fahren Sie geradeaus bis zur Ampel."}'::jsonb,
        '{"character": "Driver", "text": "Do I turn there?", "es": "¿Giro allí?", "de": "Biege ich dort ab?"}'::jsonb,
        '{"character": "Local", "text": "Yes, turn right at the lights.", "es": "Sí, gire a la derecha en los semáforos.", "de": "Ja, biegen Sie an der Ampel rechts ab."}'::jsonb,
        '{"character": "Driver", "text": "Is it near the hospital?", "es": "¿Está cerca del hospital?", "de": "Ist es in der Nähe des Krankenhauses?"}'::jsonb,
        '{"character": "Local", "text": "Yes. Go past the hospital and take the next left.", "es": "Sí. Pase el hospital y tome la siguiente a la izquierda.", "de": "Ja. Fahren Sie am Krankenhaus vorbei und nehmen Sie die nächste links."}'::jsonb,
        '{"character": "Driver", "text": "Where is the car park?", "es": "¿Dónde está el aparcamiento?", "de": "Wo ist der Parkplatz?"}'::jsonb,
        '{"character": "Local", "text": "It is behind the museum, next to the river.", "es": "Está detrás del museo, al lado del río.", "de": "Er ist hinter dem Museum, neben dem Fluss."}'::jsonb,
        '{"character": "Driver", "text": "Perfect. Thank you very much.", "es": "Perfecto. Muchas gracias.", "de": "Perfekt. Vielen Dank."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El conductor pregunta por el aparcamiento del museo.", "de": "Der Fahrer fragt nach dem Museumsparkplatz.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Primero debe girar a la izquierda en los semáforos.", "de": "Zuerst soll er an der Ampel links abbiegen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El aparcamiento está cerca del hospital.", "de": "Der Parkplatz ist in der Nähe des Krankenhauses.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "Después del hospital debe tomar la siguiente calle a la izquierda.", "de": "Nach dem Krankenhaus soll er die nächste Straße links nehmen.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El aparcamiento está delante del museo.", "de": "Der Parkplatz ist vor dem Museum.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "¿Adónde quiere llegar el conductor?", "de": "Wohin möchte der Fahrer kommen?", "s_es": {"type": "multiple_choice", "options": ["To the museum car park", "To the cinema", "To the station"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zum Museumsparkplatz", "Zum Kino", "Zum Bahnhof"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué hace en los semáforos?", "de": "Was macht er an der Ampel?", "s_es": {"type": "multiple_choice", "options": ["He turns right", "He turns left", "He stops the car for the night"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Er biegt rechts ab", "Er biegt links ab", "Er stellt das Auto für die Nacht ab"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué edificio pasa antes de girar a la izquierda?", "de": "An welchem Gebäude fährt er vorbei, bevor er links abbiegt?", "s_es": {"type": "multiple_choice", "options": ["The hospital", "The school", "The bank"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Am Krankenhaus", "An der Schule", "An der Bank"], "answer": 0}}'::jsonb,
        '{"es": "¿Dónde está el aparcamiento?", "de": "Wo ist der Parkplatz?", "s_es": {"type": "multiple_choice", "options": ["Behind the museum", "Inside the hospital", "Under the bridge"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hinter dem Museum", "Im Krankenhaus", "Unter der Brücke"], "answer": 0}}'::jsonb,
        '{"es": "¿Junto a qué está el aparcamiento?", "de": "Neben was ist der Parkplatz?", "s_es": {"type": "multiple_choice", "options": ["The river", "The airport", "The tunnel"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Dem Fluss", "Dem Flughafen", "Dem Tunnel"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 3090 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 3090 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3090, 'en', 'dialogue', 'transport', '[{"name": "Local", "gender": "female", "avatarURL": "https://example.com/avatars/local.png"}, {"name": "Driver", "gender": "male", "avatarURL": "https://example.com/avatars/driver.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pide y da indicaciones para llegar en coche', 'Lee un diálogo corto con indicaciones para llegar al aparcamiento de un museo.'),
        (v_dialogue_id, 'de', 'Bitte um Wegbeschreibung und gib Fahranweisungen', 'Lies einen kurzen Dialog mit Fahrtrichtung zum Parkplatz eines Museums.');

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
