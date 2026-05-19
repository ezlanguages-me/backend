-- ============================================================
-- Seed: A0 English Path – STEP 2420 – Dialogue – complain effectively about most situations that are likely to arise in a restaurant (Restauración)
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
        '{"character": "Guest", "text": "Excuse me, we have several problems with our table.", "es": "Perdone, tenemos varios problemas en nuestra mesa.", "de": "Entschuldigung, wir haben mehrere Probleme an unserem Tisch."}'::jsonb,
        '{"character": "Manager", "text": "I am sorry. Please tell me.", "es": "Lo siento. Por favor, dígame.", "de": "Es tut mir leid. Bitte sagen Sie es mir."}'::jsonb,
        '{"character": "Guest", "text": "We waited a long time, my pasta is wrong, and the bill has extra drinks.", "es": "Hemos esperado mucho, mi pasta está mal y la cuenta tiene bebidas de más.", "de": "Wir haben lange gewartet, meine Pasta ist falsch, und die Rechnung hat zusätzliche Getränke."}'::jsonb,
        '{"character": "Manager", "text": "I will replace the pasta and correct the bill.", "es": "Cambiaré la pasta y corregiré la cuenta.", "de": "Ich werde die Pasta ersetzen und die Rechnung korrigieren."}'::jsonb,
        '{"character": "Guest", "text": "Thank you. My soup is also cold.", "es": "Gracias. Mi sopa también está fría.", "de": "Danke. Meine Suppe ist auch kalt."}'::jsonb,
        '{"character": "Manager", "text": "I will bring a new soup and offer dessert on the house.", "es": "Traeré una sopa nueva y ofreceré el postre por cuenta de la casa.", "de": "Ich bringe eine neue Suppe und biete ein Dessert aufs Haus an."}'::jsonb,
        '{"character": "Guest", "text": "That sounds fair.", "es": "Eso suena justo.", "de": "Das klingt fair."}'::jsonb,
        '{"character": "Manager", "text": "Again, I am sorry for the trouble.", "es": "De nuevo, lo siento por las molestias.", "de": "Noch einmal, es tut mir leid wegen der Umstände."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La clienta dice que tienen varios problemas.", "p_de": "Die Gästin sagt, dass sie mehrere Probleme haben.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gerente no quiere escuchar la queja.", "p_de": "Der Manager will die Beschwerde nicht hören.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "La pasta es incorrecta y la cuenta tiene bebidas extra.", "p_de": "Die Pasta ist falsch und die Rechnung hat extra Getränke.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La sopa también está fría.", "p_de": "Die Suppe ist ebenfalls kalt.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El gerente ofrece postre por cuenta de la casa.", "p_de": "Der Manager bietet Dessert aufs Haus an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué tres problemas menciona la clienta primero?", "p_de": "Welche drei Probleme nennt die Gästin zuerst?", "s": {"type": "multiple_choice", "options": ["A long wait, wrong pasta, and extra drinks on the bill", "Only cold coffee", "No table, no waiter, no music"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué promete hacer el gerente con la pasta?", "p_de": "Was verspricht der Manager mit der Pasta zu tun?", "s": {"type": "multiple_choice", "options": ["Replace it", "Pack it to go", "Charge double"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué hará con la cuenta?", "p_de": "Was wird er mit der Rechnung tun?", "s": {"type": "multiple_choice", "options": ["Correct it", "Ignore it", "Send it by post"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué problema añade después la clienta?", "p_de": "Welches Problem fügt die Gästin später hinzu?", "s": {"type": "multiple_choice", "options": ["The soup is cold", "The chair is broken", "The lights are off"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué solución extra ofrece el gerente?", "p_de": "Welche zusätzliche Lösung bietet der Manager an?", "s": {"type": "multiple_choice", "options": ["A new soup and dessert on the house", "A taxi and hotel room", "Nothing else"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2420 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2420 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2420, 'en', 'dialogue', 'Restauración', '[{"name": "Guest", "gender": "female", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Manager", "gender": "male", "avatarURL": "https://example.com/avatars/manager.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'es', 'Presentar una reclamación completa y llegar a una solución', '');
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description) VALUES (v_dialogue_id, 'de', 'Eine vollständige Beschwerde vorbringen und lösen', '');

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
