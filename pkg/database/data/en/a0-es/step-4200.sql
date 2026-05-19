-- ============================================================
-- Seed: A0 English Path – STEP 4200 – Dialogue – deal with predictable requests from a visitor (Servicios Laborales)
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
        '{"character": "Visitor", "text": "Excuse me. Could I use a meeting room for an hour?", "es": "Perdone. ¿Podría usar una sala de reuniones durante una hora?", "de": "Entschuldigung. Könnte ich eine Stunde lang einen Besprechungsraum nutzen?"}'::jsonb,
    '{"character": "Agent", "text": "Of course. Room 2 is free until 3 PM. Shall I book it for you?", "es": "Por supuesto. La sala 2 está libre hasta las 3. ¿Se la reservo?", "de": "Natürlich. Raum 2 ist bis 15 Uhr frei. Soll ich ihn für Sie buchen?"}'::jsonb,
    '{"character": "Visitor", "text": "Yes, please. Also, do you have Wi-Fi access for guests?", "es": "Sí, por favor. Además, ¿tienen acceso wifi para visitantes?", "de": "Ja, bitte. Haben Sie außerdem WLAN-Zugang für Besucher?"}'::jsonb,
    '{"character": "Agent", "text": "Yes. The guest Wi-Fi password is on the card on the table.", "es": "Sí. La contraseña del wifi de invitados está en la tarjeta sobre la mesa.", "de": "Ja. Das Gast-WLAN-Passwort steht auf der Karte auf dem Tisch."}'::jsonb,
    '{"character": "Visitor", "text": "Could I also get a coffee?", "es": "¿También podría tomar un café?", "de": "Könnte ich auch einen Kaffee bekommen?"}'::jsonb,
    '{"character": "Agent", "text": "Certainly. I will bring a coffee to the room in a few minutes.", "es": "Claro. Llevaré un café a la sala en unos minutos.", "de": "Natürlich. Ich bringe in ein paar Minuten einen Kaffee ins Zimmer."}'::jsonb,
    '{"character": "Visitor", "text": "Thank you. Is there a printer I could use?", "es": "Gracias. ¿Hay una impresora que pueda usar?", "de": "Danke. Gibt es einen Drucker, den ich benutzen könnte?"}'::jsonb,
    '{"character": "Agent", "text": "There is a printer in the copy room next to Room 2. I will show you.", "es": "Hay una impresora en la sala de copias junto a la sala 2. Le mostraré.", "de": "Es gibt einen Drucker im Kopiererraum neben Raum 2. Ich zeige es Ihnen."}'::jsonb,
    '{"character": "Visitor", "text": "That is very kind. Thank you for all your help.", "es": "Es muy amable. Gracias por toda su ayuda.", "de": "Das ist sehr freundlich. Danke für Ihre ganze Hilfe."}'::jsonb,
    '{"character": "Agent", "text": "You are very welcome. Let me know if you need anything else.", "es": "De nada. Dígame si necesita algo más.", "de": "Bitte sehr. Sagen Sie mir, wenn Sie noch etwas brauchen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La sala 2 está libre hasta las 3 PM.", "p_de": "Raum 2 ist bis 15 Uhr frei.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "No hay wifi para visitantes.", "p_de": "Es gibt kein WLAN für Besucher.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La contraseña del wifi está en una tarjeta sobre la mesa.", "p_de": "Das WLAN-Passwort steht auf einer Karte auf dem Tisch.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La impresora está en la planta baja.", "p_de": "Der Drucker befindet sich im Erdgeschoss.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El agente lleva el café a la sala de reuniones.", "p_de": "Der Mitarbeiter bringt den Kaffee in den Besprechungsraum.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Qué sala queda libre hasta las 3 PM?", "p_de": "Welcher Raum ist bis 15 Uhr frei?", "s_es": {"type": "multiple_choice", "options": ["Room 2", "Room 1", "Room 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Raum 2", "Raum 1", "Raum 3"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde está la contraseña del wifi?", "p_de": "Wo steht das WLAN-Passwort?", "s_es": {"type": "multiple_choice", "options": ["On the card on the table", "On the wall", "At reception"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Auf der Karte auf dem Tisch", "An der Wand", "An der Rezeption"], "answer": 0}}'::jsonb,
    '{"p": "¿Cuándo lleva el agente el café?", "p_de": "Wann bringt der Mitarbeiter den Kaffee?", "s_es": {"type": "multiple_choice", "options": ["In a few minutes", "After lunch", "At 3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In ein paar Minuten", "Nach dem Mittagessen", "Um 15 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Dónde está la impresora?", "p_de": "Wo ist der Drucker?", "s_es": {"type": "multiple_choice", "options": ["In the copy room next to Room 2", "On the third floor", "In Room 1"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Im Kopiererraum neben Raum 2", "Im dritten Stock", "In Raum 1"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué hace el agente al final?", "p_de": "Was macht der Mitarbeiter am Ende?", "s_es": {"type": "multiple_choice", "options": ["Offers further help", "Asks the visitor to leave", "Books a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bietet weitere Hilfe an", "Bittet den Besucher zu gehen", "Bestellt ein Taxi"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 4200 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue');
    DELETE FROM dialogue WHERE step_order = 4200 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 4200, 'en', 'dialogue', 'professional', '[{"name": "Visitor", "gender": "male", "avatarURL": "https://example.com/avatars/visitor.png"}, {"name": "Agent", "gender": "female", "avatarURL": "https://example.com/avatars/agent.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Atiende peticiones predecibles de un visitante', 'Practica respuestas a peticiones típicas de visitantes: sala, wifi, café e impresora.'),
        (v_dialogue_id, 'de', 'Bearbeite vorhersehbare Anfragen eines Besuchers', 'Übe Antworten auf typische Besucheranfragen: Raum, WLAN, Kaffee und Drucker.');
    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text') RETURNING uuid INTO v_line_uuid;
        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_uuid, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_uuid, 'de', jsonb_build_object('translation', line->>'de'));
        v_line_order := v_line_order + 1;
    END LOOP;
    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
