-- ============================================================
-- Seed: A0 English Path – STEP 1710 – Dialogue – go to a travel information centre (Viajes y Transporte)
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
        '{"character": "Traveller", "text": "Hello. How do I get from Central Station to Harbor Hotel?", "es": "Hola. ¿Cómo voy desde Central Station hasta el Harbor Hotel?", "de": "Hallo. Wie komme ich vom Central Station zum Harbor Hotel?"}'::jsonb,
        '{"character": "Assistant", "text": "Take tram 3 from stop A.", "es": "Tome el tranvía 3 desde la parada A.", "de": "Nehmen Sie die Straßenbahn 3 von Haltestelle A."}'::jsonb,
        '{"character": "Traveller", "text": "Where do I get off?", "es": "¿Dónde me bajo?", "de": "Wo steige ich aus?"}'::jsonb,
        '{"character": "Assistant", "text": "Get off at Old Port after four stops.", "es": "Bájese en Old Port después de cuatro paradas.", "de": "Steigen Sie nach vier Haltestellen am Old Port aus."}'::jsonb,
        '{"character": "Traveller", "text": "Is the hotel far from there?", "es": "¿Está lejos el hotel desde allí?", "de": "Ist das Hotel von dort weit entfernt?"}'::jsonb,
        '{"character": "Assistant", "text": "No. Walk straight for two minutes. The hotel is beside the tourist office.", "es": "No. Camine recto durante dos minutos. El hotel está al lado de la oficina de turismo.", "de": "Nein. Gehen Sie zwei Minuten geradeaus. Das Hotel ist neben dem Tourismusbüro."}'::jsonb,
        '{"character": "Traveller", "text": "Can I buy the tram ticket here?", "es": "¿Puedo comprar aquí el billete del tranvía?", "de": "Kann ich das Straßenbahnticket hier kaufen?"}'::jsonb,
        '{"character": "Assistant", "text": "Yes, here or at the machine near stop A.", "es": "Sí, aquí o en la máquina cerca de la parada A.", "de": "Ja, hier oder am Automaten bei Haltestelle A."}'::jsonb,
        '{"character": "Traveller", "text": "Perfect, thank you.", "es": "Perfecto, gracias.", "de": "Perfekt, danke."}'::jsonb,
        '{"character": "Assistant", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La viajera quiere ir al Harbor Hotel.", "p_de": "Die Reisende möchte zum Harbor Hotel.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe tomar el tranvía 3 desde la parada A.", "p_de": "Sie soll die Straßenbahn 3 von Haltestelle A nehmen.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Tiene que bajar después de dos paradas.", "p_de": "Sie muss nach zwei Haltestellen aussteigen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El hotel está junto a la oficina de turismo.", "p_de": "Das Hotel ist neben dem Tourismusbüro.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El billete solo se puede comprar en la máquina.", "p_de": "Das Ticket kann man nur am Automaten kaufen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué tranvía toma?", "p_de": "Welche Straßenbahn nimmt sie?", "s": {"type": "multiple_choice", "options": ["Tram 3", "Tram 4", "Bus 3"], "answer": 0}}'::jsonb,
        '{"p": "¿Desde qué parada sale?", "p_de": "Von welcher Haltestelle fährt sie ab?", "s": {"type": "multiple_choice", "options": ["Stop A", "Stop B", "Desk 2"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde se baja?", "p_de": "Wo steigt sie aus?", "s": {"type": "multiple_choice", "options": ["At Old Port", "At Harbor Hotel", "At Central Station"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto camina hasta el hotel?", "p_de": "Wie lange geht sie zu Fuß bis zum Hotel?", "s": {"type": "multiple_choice", "options": ["Two minutes", "Ten minutes", "Twenty minutes"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde puede comprar el billete?", "p_de": "Wo kann sie das Ticket kaufen?", "s": {"type": "multiple_choice", "options": ["Here or at the machine near stop A", "Only on the tram", "Only at the hotel"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 1710 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 1710 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 1710, 'en', 'dialogue', 'Viajes y Transporte', '[{"name": "Traveller", "gender": "female", "avatarURL": "https://example.com/avatars/traveller.png"}, {"name": "Assistant", "gender": "male", "avatarURL": "https://example.com/avatars/assistant.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Preguntar cómo ir desde la estación al hotel', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Am Bahnhof nach dem Weg zum Hotel fragen', '');

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
