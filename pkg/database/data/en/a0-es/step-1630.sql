-- ============================================================
-- Seed: A0 English Path – STEP 1630 – Dialogue – understand simple directions (Viajes y Transporte)
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
        '{"character": "Tourist", "text": "Excuse me, where is the pharmacy?", "es": "Perdone, ¿dónde está la farmacia?", "de": "Entschuldigung, wo ist die Apotheke?"}'::jsonb,
        '{"character": "Stranger", "text": "Go straight to the roundabout.", "es": "Siga recto hasta la rotonda.", "de": "Gehen Sie geradeaus bis zum Kreisverkehr."}'::jsonb,
        '{"character": "Tourist", "text": "Do I turn there?", "es": "¿Giro allí?", "de": "Biege ich dort ab?"}'::jsonb,
        '{"character": "Stranger", "text": "Yes. Take the second street on the right.", "es": "Sí. Tome la segunda calle a la derecha.", "de": "Ja. Nehmen Sie die zweite Straße rechts."}'::jsonb,
        '{"character": "Tourist", "text": "Is it near the bus stop?", "es": "¿Está cerca de la parada de autobús?", "de": "Ist sie in der Nähe der Bushaltestelle?"}'::jsonb,
        '{"character": "Stranger", "text": "Yes, it is next to the bus stop and opposite a café.", "es": "Sí, está al lado de la parada y enfrente de un café.", "de": "Ja, sie ist neben der Bushaltestelle und gegenüber von einem Café."}'::jsonb,
        '{"character": "Tourist", "text": "Great. Thank you for your help.", "es": "Perfecto. Gracias por su ayuda.", "de": "Super. Danke für Ihre Hilfe."}'::jsonb,
        '{"character": "Stranger", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La turista pregunta por una farmacia.", "p_de": "Die Touristin fragt nach einer Apotheke.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La primera indicación es girar en la rotonda.", "p_de": "Die erste Anweisung ist, am Kreisverkehr abzubiegen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Hay que tomar la segunda calle a la derecha.", "p_de": "Man muss die zweite Straße rechts nehmen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La farmacia está lejos de la parada de autobús.", "p_de": "Die Apotheke ist weit von der Bushaltestelle entfernt.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La farmacia está enfrente de un café.", "p_de": "Die Apotheke liegt gegenüber von einem Café.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué lugar busca la turista?", "p_de": "Welchen Ort sucht die Touristin?", "s": {"type": "multiple_choice", "options": ["The pharmacy", "The cinema", "The station"], "answer": 0}}'::jsonb,
        '{"p": "¿Hasta dónde va recto?", "p_de": "Bis wohin geht sie geradeaus?", "s": {"type": "multiple_choice", "options": ["To the roundabout", "To the bridge", "To the square"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué calle toma?", "p_de": "Welche Straße nimmt sie?", "s": {"type": "multiple_choice", "options": ["The second street on the right", "The first street on the left", "The third street on the left"], "answer": 0}}'::jsonb,
        '{"p": "¿Junto a qué está la farmacia?", "p_de": "Neben was ist die Apotheke?", "s": {"type": "multiple_choice", "options": ["The bus stop", "The bank", "The bakery"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hay enfrente de la farmacia?", "p_de": "Was ist gegenüber der Apotheke?", "s": {"type": "multiple_choice", "options": ["A café", "A school", "A hotel"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1630 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1630 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1630, 'en', 'dialogue', 'Viajes y Transporte', '[{"name": "Tourist", "gender": "female", "avatarURL": "https://example.com/avatars/tourist.png"}, {"name": "Stranger", "gender": "male", "avatarURL": "https://example.com/avatars/stranger.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', '¿Dónde está la farmacia?', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Wo ist die Apotheke?', '');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (
            v_line_id,
            'es',
            jsonb_build_array(
                jsonb_build_object(
                    'translations',
                    jsonb_build_array(
                        jsonb_build_object('languageCode', 'es', 'translation', line->>'es')
                    )
                )
            )
        );

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES (
            v_line_id,
            'de',
            jsonb_build_array(
                jsonb_build_object(
                    'translations',
                    jsonb_build_array(
                        jsonb_build_object('languageCode', 'de', 'translation', line->>'de')
                    )
                )
            )
        );

        v_line_order := v_line_order + 1;
    END LOOP;

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'es', ex->>'p', ex->'s');
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
