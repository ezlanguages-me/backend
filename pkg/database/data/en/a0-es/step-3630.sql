-- ============================================================
-- Seed: A0 English Path – STEP 3630 – Dialogue – deal with hotel problems (Alojamiento)
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
        '{"character": "Guest", "text": "Excuse me. I am in room 214, and the shower is cold.", "es": "Perdón. Estoy en la habitación 214 y la ducha está fría.", "de": "Entschuldigung. Ich bin in Zimmer 214, und die Dusche ist kalt."}'::jsonb,
    '{"character": "Receptionist", "text": "I am sorry about that. I can send maintenance in twenty minutes.", "es": "Lo siento. Puedo enviar al servicio técnico en veinte minutos.", "de": "Das tut mir leid. Ich kann in zwanzig Minuten die Technik schicken."}'::jsonb,
    '{"character": "Guest", "text": "Thank you. I also need two clean towels, please.", "es": "Gracias. También necesito dos toallas limpias, por favor.", "de": "Danke. Ich brauche auch zwei saubere Handtücher, bitte."}'::jsonb,
    '{"character": "Receptionist", "text": "No problem. We can bring them now.", "es": "No hay problema. Podemos llevarlas ahora.", "de": "Kein Problem. Wir können sie jetzt bringen."}'::jsonb,
    '{"character": "Guest", "text": "If the shower still does not work, can I change rooms?", "es": "Si la ducha sigue sin funcionar, ¿puedo cambiar de habitación?", "de": "Wenn die Dusche immer noch nicht funktioniert, kann ich dann das Zimmer wechseln?"}'::jsonb,
    '{"character": "Receptionist", "text": "Yes, we have room 310 available.", "es": "Sí, tenemos disponible la habitación 310.", "de": "Ja, wir haben Zimmer 310 frei."}'::jsonb,
    '{"character": "Guest", "text": "That is good. Please call me first.", "es": "Está bien. Llámeme primero, por favor.", "de": "Das ist gut. Bitte rufen Sie mich zuerst an."}'::jsonb,
    '{"character": "Receptionist", "text": "Of course. We will call before we move you.", "es": "Claro. La llamaremos antes de cambiarla.", "de": "Natürlich. Wir rufen Sie an, bevor wir Sie umziehen."}'::jsonb,
    '{"character": "Guest", "text": "Thank you for your help.", "es": "Gracias por su ayuda.", "de": "Danke für Ihre Hilfe."}'::jsonb,
    '{"character": "Receptionist", "text": "You are welcome.", "es": "De nada.", "de": "Gern geschehen."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La huésped está en la habitación 214.", "p_de": "Der Gast ist in Zimmer 214.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "El problema es que el aire acondicionado hace ruido.", "p_de": "Das Problem ist, dass die Klimaanlage laut ist.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "La recepción puede enviar mantenimiento en veinte minutos.", "p_de": "Die Rezeption kann in zwanzig Minuten die Technik schicken.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "La huésped pide dos toallas limpias.", "p_de": "Der Gast bittet um zwei saubere Handtücher.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
    '{"p": "No hay otra habitación disponible.", "p_de": "Es ist kein anderes Zimmer verfügbar.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
    '{"p": "¿Qué problema tiene la huésped?", "p_de": "Welches Problem hat der Gast?", "s_es": {"type": "multiple_choice", "options": ["The shower is cold", "The TV is broken", "The window is open"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Dusche ist kalt", "Der Fernseher ist kaputt", "Das Fenster ist offen"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué envía la recepcionista?", "p_de": "Wen schickt die Rezeptionistin?", "s_es": {"type": "multiple_choice", "options": ["Maintenance", "A taxi", "The manager"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Die Technik", "Ein Taxi", "Den Manager"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué más pide la huésped?", "p_de": "Worum bittet der Gast zusätzlich?", "s_es": {"type": "multiple_choice", "options": ["Two clean towels", "A late breakfast", "A city map"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zwei saubere Handtücher", "Ein spätes Frühstück", "Einen Stadtplan"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué habitación alternativa ofrece la recepcionista?", "p_de": "Welches andere Zimmer bietet die Rezeptionistin an?", "s_es": {"type": "multiple_choice", "options": ["Room 310", "Room 201", "Room 410"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zimmer 310", "Zimmer 201", "Zimmer 410"], "answer": 0}}'::jsonb,
    '{"p": "¿Qué quiere la huésped antes de cambiar de habitación?", "p_de": "Was möchte der Gast vor dem Zimmerwechsel?", "s_es": {"type": "multiple_choice", "options": ["A phone call first", "A free dinner", "A written letter"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zuerst einen Anruf", "Ein kostenloses Abendessen", "Einen Brief"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM dialogue WHERE step_order = 3630 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue'
    );
    DELETE FROM dialogue WHERE step_order = 3630 AND path_uuid = v_path_id AND source_language = 'en' AND type = 'dialogue';
    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 3630, 'en', 'dialogue', 'accommodation', '[{"name": "Guest", "gender": "female", "avatarURL": "https://example.com/avatars/guest.png"}, {"name": "Receptionist", "gender": "female", "avatarURL": "https://example.com/avatars/receptionist.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;
    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Resuelve problemas en un hotel', 'Practica cómo explicar un problema en la habitación y recibir una solución simple.'),
        (v_dialogue_id, 'de', 'Löse Probleme im Hotel', 'Übe, wie man ein Zimmerproblem erklärt und eine einfache Lösung bekommt.');
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
