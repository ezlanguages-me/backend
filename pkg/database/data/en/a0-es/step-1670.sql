-- ============================================================
-- Seed: A0 English Path – STEP 1670 – Dialogue – give and understand straightforward directions (Viajes y Transporte)
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
        '{"character": "Passenger", "text": "Hello. I need to go to West Stadium. Which bus do I take?", "es": "Hola. Necesito ir al West Stadium. ¿Qué autobús tomo?", "de": "Hallo. Ich muss zum West Stadium. Welchen Bus nehme ich?"}'::jsonb,
        '{"character": "Clerk", "text": "Take bus 8 from stand B to City Square.", "es": "Tome el autobús 8 desde el andén B hasta City Square.", "de": "Nehmen Sie Bus 8 von Steig B bis City Square."}'::jsonb,
        '{"character": "Passenger", "text": "Do I stay on bus 8?", "es": "¿Me quedo en el autobús 8?", "de": "Bleibe ich im Bus 8?"}'::jsonb,
        '{"character": "Clerk", "text": "No. At City Square, change to bus 14.", "es": "No. En City Square cambie al autobús 14.", "de": "Nein. Am City Square steigen Sie in Bus 14 um."}'::jsonb,
        '{"character": "Passenger", "text": "How often is bus 14?", "es": "¿Cada cuánto pasa el autobús 14?", "de": "Wie oft fährt Bus 14?"}'::jsonb,
        '{"character": "Clerk", "text": "Every ten minutes.", "es": "Cada diez minutos.", "de": "Alle zehn Minuten."}'::jsonb,
        '{"character": "Passenger", "text": "Where do I get off?", "es": "¿Dónde me bajo?", "de": "Wo steige ich aus?"}'::jsonb,
        '{"character": "Clerk", "text": "Get off at East Gate. The stadium is across the street.", "es": "Bájese en East Gate. El estadio está al otro lado de la calle.", "de": "Steigen Sie am East Gate aus. Das Stadion ist auf der anderen Straßenseite."}'::jsonb,
        '{"character": "Passenger", "text": "Perfect. Thank you.", "es": "Perfecto. Gracias.", "de": "Perfekt. Danke."}'::jsonb,
        '{"character": "Clerk", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El pasajero quiere ir a West Stadium.", "p_de": "Der Fahrgast möchte zum West Stadium.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Primero toma el autobús 14.", "p_de": "Zuerst nimmt er Bus 14.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El autobús 8 sale del andén B.", "p_de": "Bus 8 fährt von Steig B ab.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "En City Square hay que cambiar de autobús.", "p_de": "Am City Square muss man umsteigen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El estadio está al otro lado de la calle desde East Gate.", "p_de": "Das Stadion ist von East Gate aus auf der anderen Straßenseite.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué autobús toma primero?", "p_de": "Welchen Bus nimmt er zuerst?", "s": {"type": "multiple_choice", "options": ["Bus 8", "Bus 14", "Bus 18"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde cambia de autobús?", "p_de": "Wo steigt er um?", "s": {"type": "multiple_choice", "options": ["At City Square", "At West Stadium", "At Central Station"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué autobús cambia?", "p_de": "In welchen Bus steigt er um?", "s": {"type": "multiple_choice", "options": ["Bus 14", "Bus 4", "Bus 40"], "answer": 0}}'::jsonb,
        '{"p": "¿Cada cuánto pasa el autobús 14?", "p_de": "Wie oft fährt Bus 14?", "s": {"type": "multiple_choice", "options": ["Every ten minutes", "Every twenty minutes", "Every hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se baja?", "p_de": "Wo steigt er aus?", "s": {"type": "multiple_choice", "options": ["At East Gate", "At North Gate", "At Museum Lane"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1670 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1670 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1670, 'en', 'dialogue', 'Viajes y Transporte', '[{"name": "Passenger", "gender": "neutral", "avatarURL": "https://example.com/avatars/passenger.png"}, {"name": "Clerk", "gender": "female", "avatarURL": "https://example.com/avatars/clerk.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', '¿Qué autobús va al estadio?', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Welcher Bus fährt zum Stadion?', '');

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
