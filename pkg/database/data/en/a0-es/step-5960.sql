-- ============================================================
-- Seed: A0 English Path – STEP 5960 – Dialogue – Alojamiento
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
        '{"character": "Guest", "text": "Hello. Can you tell me about the hotel services?", "es": "Hola. ¿Puede hablarme de los servicios del hotel?", "de": "Hallo. Können Sie mir die Hotelservices erklären?"}'::jsonb,
        '{"character": "Receptionist", "text": "Of course. Breakfast is in the lounge from 7 AM to 10 AM.", "es": "Claro. El desayuno es en el salón de 7 AM a 10 AM.", "de": "Natürlich. Frühstück gibt es in der Lounge von 7 bis 10 Uhr."}'::jsonb,
        '{"character": "Guest", "text": "Is there a gym?", "es": "¿Hay gimnasio?", "de": "Gibt es einen Fitnessraum?"}'::jsonb,
        '{"character": "Receptionist", "text": "Yes. The gym is on the third floor and opens at 6 AM.", "es": "Sí. El gimnasio está en la tercera planta y abre a las 6 AM.", "de": "Ja. Der Fitnessraum ist im dritten Stock und öffnet um 6 Uhr."}'::jsonb,
        '{"character": "Guest", "text": "Can I get an extra towel?", "es": "¿Puedo conseguir una toalla extra?", "de": "Kann ich ein zusätzliches Handtuch bekommen?"}'::jsonb,
        '{"character": "Receptionist", "text": "Yes. I can send one to your room.", "es": "Sí. Puedo enviar una a su habitación.", "de": "Ja. Ich kann eines auf Ihr Zimmer schicken."}'::jsonb,
        '{"character": "Guest", "text": "What time is late checkout?", "es": "¿A qué hora es la salida tardía?", "de": "Wie spät ist der späte Check-out?"}'::jsonb,
        '{"character": "Receptionist", "text": "Late checkout is until 1 PM, if the room is available.", "es": "La salida tardía es hasta la 1 PM, si la habitación está disponible.", "de": "Später Check-out ist bis 13 Uhr, wenn das Zimmer verfügbar ist."}'::jsonb,
        '{"character": "Guest", "text": "Thank you. That is very helpful.", "es": "Gracias. Eso ayuda mucho.", "de": "Danke. Das ist sehr hilfreich."}'::jsonb,
        '{"character": "Receptionist", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"es": "El desayuno se sirve en el salón.", "de": "Frühstück wird in der Lounge serviert.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El gimnasio está en la tercera planta.", "de": "Der Fitnessraum ist im dritten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El gimnasio abre a las 8 AM.", "de": "Der Fitnessraum öffnet um 8 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La recepción puede enviar una toalla extra a la habitación.", "de": "Die Rezeption kann ein zusätzliches Handtuch ins Zimmer schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La salida tardía es hasta la 1 PM si hay disponibilidad.", "de": "Später Check-out ist bis 13 Uhr möglich, wenn das Zimmer frei ist.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Dónde se sirve el desayuno?", "de": "Wo wird Frühstück serviert?", "s_es": {"type": "multiple_choice", "options": ["In the lounge", "In the gym", "At the car park"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["In der Lounge", "Im Fitnessraum", "Auf dem Parkplatz"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora abre el gimnasio?", "de": "Wann öffnet der Fitnessraum?", "s_es": {"type": "multiple_choice", "options": ["6 AM", "7 AM", "8 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["6 Uhr", "7 Uhr", "8 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué puede enviar la recepción?", "de": "Was kann die Rezeption schicken?", "s_es": {"type": "multiple_choice", "options": ["An extra towel", "A bus ticket", "A dinner menu"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Ein zusätzliches Handtuch", "Ein Busticket", "Eine Speisekarte"], "answer": 0}}'::jsonb,
        '{"es": "¿Hasta qué hora es la salida tardía?", "de": "Bis wann ist der späte Check-out?", "s_es": {"type": "multiple_choice", "options": ["1 PM", "11 AM", "3 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["13 Uhr", "11 Uhr", "15 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿De qué habla el huésped al principio?", "de": "Worüber spricht der Gast am Anfang?", "s_es": {"type": "multiple_choice", "options": ["Hotel services", "Train tickets", "Homework"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Hotelservices", "Zugtickets", "Hausaufgaben"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 5960 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 5960 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 5960, 'en', 'dialogue', 'Alojamiento', '[{"name": "Staff", "gender": "neutral", "avatarURL": "https://example.com/avatars/staff.png"}, {"name": "Learner", "gender": "neutral", "avatarURL": "https://example.com/avatars/learner.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Pregunta por los servicios del hotel', 'Lee un diálogo en el que un huésped pregunta por desayuno, gimnasio y salida tardía.'),
        (v_dialogue_id, 'de', 'Frag nach Hotelservices', 'Lies einen Dialog, in dem ein Gast nach Frühstück, Fitnessraum und spätem Check-out fragt.');

    FOREACH line IN ARRAY v_lines LOOP
        INSERT INTO dialogue_lines (dialogue_uuid, line_order, character_name, text)
        VALUES (v_dialogue_id, v_line_order, line->>'character', line->>'text')
        RETURNING uuid INTO v_line_id;

        INSERT INTO dialogue_lines_translation (dialogue_line_uuid, language, meaning)
        VALUES
            (v_line_id, 'es', jsonb_build_object('translation', line->>'es')),
            (v_line_id, 'de', jsonb_build_object('translation', line->>'de'));

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
