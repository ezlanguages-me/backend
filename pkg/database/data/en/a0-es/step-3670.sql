-- ============================================================
-- Seed: A0 English Path – STEP 3670 – Dialogue – negotiate room price (Alojamiento)
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
        '{"character": "Guest", "text": "Hello. I want a room for three nights.", "es": "Hola. Quiero una habitación para tres noches.", "de": "Hallo. Ich möchte ein Zimmer für drei Nächte."}'::jsonb,
    '{"character": "Receptionist", "text": "The standard rate is £110 per night.", "es": "La tarifa estándar es de £110 por noche.", "de": "Der Standardpreis ist £110 pro Nacht."}'::jsonb,
    '{"character": "Guest", "text": "That is a little high. Do you have a cheaper option?", "es": "Eso es un poco caro. ¿Tiene una opción más barata?", "de": "Das ist etwas teuer. Haben Sie eine günstigere Option?"}'::jsonb,
    '{"character": "Receptionist", "text": "I can offer £102 per night with breakfast, or £95 without breakfast.", "es": "Puedo ofrecer £102 por noche con desayuno o £95 sin desayuno.", "de": "Ich kann £102 pro Nacht mit Frühstück oder £95 ohne Frühstück anbieten."}'::jsonb,
    '{"character": "Guest", "text": "Is Wi-Fi included at £95?", "es": "¿Está incluido el wifi por £95?", "de": "Ist WLAN bei £95 inklusive?"}'::jsonb,
    '{"character": "Receptionist", "text": "Yes, Wi-Fi is always included.", "es": "Sí, el wifi siempre está incluido.", "de": "Ja, WLAN ist immer inklusive."}'::jsonb,
    '{"character": "Guest", "text": "Okay. Can you make it £95 and add late check-out?", "es": "Vale. ¿Puede dejarlo en £95 y añadir late check-out?", "de": "Okay. Können Sie es bei £95 lassen und einen späten Check-out hinzufügen?"}'::jsonb,
    '{"character": "Receptionist", "text": "Yes, late check-out until 1 PM is fine.", "es": "Sí, el late check-out hasta la 1 PM está bien.", "de": "Ja, später Check-out bis 13 Uhr ist in Ordnung."}'::jsonb,
    '{"character": "Guest", "text": "Great. I will take it.", "es": "Perfecto. Me lo quedo.", "de": "Gut. Ich nehme es."}'::jsonb,
    '{"character": "Receptionist", "text": "Excellent. I will confirm the booking now.", "es": "Excelente. Confirmaré la reserva ahora.", "de": "Ausgezeichnet. Ich bestätige die Buchung jetzt."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "El huésped quiere una habitación para tres noches.", "p_de": "Der Gast möchte ein Zimmer für drei Nächte.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La tarifa estándar es de £95 por noche.", "p_de": "Der Standardpreis ist £95 pro Nacht.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La recepcionista ofrece £102 con desayuno.", "p_de": "Die Rezeptionistin bietet £102 mit Frühstück an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El wifi no está incluido en la opción barata.", "p_de": "WLAN ist in der günstigeren Option nicht enthalten.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "El late check-out es hasta la 1 PM.", "p_de": "Der späte Check-out geht bis 13 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "¿Cuál es la tarifa estándar?", "p_de": "Wie hoch ist der Standardpreis?", "s_es": {"type": "multiple_choice", "options": ["£110 per night", "£102 per night", "£95 total"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£110 pro Nacht", "£102 pro Nacht", "£95 insgesamt"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué opción incluye desayuno?", "p_de": "Welche Option enthält Frühstück?", "s_es": {"type": "multiple_choice", "options": ["£102 per night", "£95 per night", "The standard rate only on Monday"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["£102 pro Nacht", "£95 pro Nacht", "Nur der Standardpreis am Montag"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué pregunta el huésped sobre la opción de £95?", "p_de": "Was fragt der Gast zur £95-Option?", "s_es": {"type": "multiple_choice", "options": ["If Wi-Fi is included", "If dinner is free", "If pets are allowed"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ob WLAN enthalten ist", "Ob das Abendessen gratis ist", "Ob Haustiere erlaubt sind"], "answer": 0}}'::jsonb,
    '{"p": "¿Hasta qué hora es el late check-out?", "p_de": "Bis wann gilt der späte Check-out?", "s_es": {"type": "multiple_choice", "options": ["Until 1 PM", "Until 11 AM", "Until 3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bis 13 Uhr", "Bis 11 Uhr", "Bis 15 Uhr"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué hace la recepcionista al final?", "p_de": "Was macht die Rezeptionistin am Ende?", "s_es": {"type": "multiple_choice", "options": ["She confirms the booking", "She cancels the room", "She calls a taxi"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Sie bestätigt die Buchung", "Sie storniert das Zimmer", "Sie ruft ein Taxi"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue WHERE step_order = 3670 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue'
    );
    DELETE FROM dialogue WHERE step_order = 3670 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3670, 'en', 'dialogue', 'accommodation', '[{"name": "Guest", "gender": "male", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Negocia el precio de una habitación', 'Practica una conversación sencilla para pedir un precio mejor y confirmar lo que incluye.'),
        (v_dialogue_id, 'de', 'Verhandle den Zimmerpreis', 'Übe ein einfaches Gespräch, um einen besseren Preis zu bekommen und zu klären, was enthalten ist.');
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
