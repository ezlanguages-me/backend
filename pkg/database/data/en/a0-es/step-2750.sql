-- ============================================================
-- Seed: A0 English Path – STEP 2750 – Dialogue – Habla sobre el alta y los cuidados
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
        '{"character": "Nurse", "text": "You can go home this afternoon.", "es": "Puede irse a casa esta tarde.", "de": "Sie können heute Nachmittag nach Hause gehen."}'::jsonb,
        '{"character": "Patient", "text": "What do I need to do at home?", "es": "¿Qué tengo que hacer en casa?", "de": "Was muss ich zu Hause tun?"}'::jsonb,
        '{"character": "Nurse", "text": "Rest for two days and keep the bandage dry.", "es": "Descanse dos días y mantenga el vendaje seco.", "de": "Ruhen Sie zwei Tage und halten Sie den Verband trocken."}'::jsonb,
        '{"character": "Patient", "text": "Can I drive today?", "es": "¿Puedo conducir hoy?", "de": "Kann ich heute fahren?"}'::jsonb,
        '{"character": "Nurse", "text": "No, not today. And do not carry heavy bags.", "es": "No, hoy no. Y no lleve bolsas pesadas.", "de": "Nein, heute nicht. Und tragen Sie keine schweren Taschen."}'::jsonb,
        '{"character": "Patient", "text": "What can I eat tonight?", "es": "¿Qué puedo comer esta noche?", "de": "Was kann ich heute Abend essen?"}'::jsonb,
        '{"character": "Nurse", "text": "Light food is fine.", "es": "La comida ligera está bien.", "de": "Leichte Kost ist in Ordnung."}'::jsonb,
        '{"character": "Patient", "text": "When do I come back?", "es": "¿Cuándo vuelvo?", "de": "Wann komme ich zurück?"}'::jsonb,
        '{"character": "Nurse", "text": "Next Wednesday, and call us if you have bleeding or strong pain.", "es": "El próximo miércoles, y llámenos si tiene sangrado o dolor fuerte.", "de": "Nächsten Mittwoch, und rufen Sie uns an, wenn Sie Blutung oder starke Schmerzen haben."}'::jsonb,
        '{"character": "Patient", "text": "Thank you. I understand.", "es": "Gracias. Lo entiendo.", "de": "Danke. Ich verstehe."}'::jsonb
    ];
    v_exercises JSONB[] := ARRAY[
        '{"p": "La enfermera dice que el paciente puede irse a casa esta tarde.", "p_de": "Die Krankenschwester sagt, dass der Patient heute Nachmittag nach Hause gehen kann.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe descansar dos días y mantener el vendaje seco.", "p_de": "Er soll zwei Tage ruhen und den Verband trocken halten.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Puede conducir hoy y llevar bolsas pesadas.", "p_de": "Er kann heute fahren und schwere Taschen tragen.", "s": {"type": "true_false", "answer": false}, "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Puede comer comida ligera por la noche.", "p_de": "Er kann am Abend leichte Kost essen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Debe volver el próximo miércoles y llamar si hay sangrado o dolor fuerte.", "p_de": "Er soll nächsten Mittwoch zurückkommen und bei Blutung oder starken Schmerzen anrufen.", "s": {"type": "true_false", "answer": true}, "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿Qué pregunta hace el paciente sobre hoy?", "p_de": "Welche Frage stellt der Patient über heute?", "s": {"type": "multiple_choice", "options": ["Can I drive today?", "Can I run today?", "Can I swim today?"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Can I drive today?", "Can I run today?", "Can I swim today?"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Can I drive today?", "Can I run today?", "Can I swim today?"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué no debe llevar?", "p_de": "Was soll er nicht tragen?", "s": {"type": "multiple_choice", "options": ["Heavy bags", "A jacket", "A card"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Heavy bags", "A jacket", "A card"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Heavy bags", "A jacket", "A card"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puede comer esta noche?", "p_de": "Was kann er heute Abend essen?", "s": {"type": "multiple_choice", "options": ["Light food", "Only cake", "Nothing at all"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Light food", "Only cake", "Nothing at all"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Light food", "Only cake", "Nothing at all"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo vuelve?", "p_de": "Wann kommt er zurück?", "s": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow morning", "In one hour"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow morning", "In one hour"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Next Wednesday", "Tomorrow morning", "In one hour"], "answer": 0}}'::jsonb,
        '{"p": "¿Por qué debe llamar?", "p_de": "Warum soll er anrufen?", "s": {"type": "multiple_choice", "options": ["Because of bleeding or strong pain", "Because of a bus delay", "Because of bad weather"], "answer": 0}, "s_es": {"type": "multiple_choice", "options": ["Because of bleeding or strong pain", "Because of a bus delay", "Because of bad weather"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Because of bleeding or strong pain", "Because of a bus delay", "Because of bad weather"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM dialogue WHERE step_order = 2750 AND path_uuid = v_path_id);
    DELETE FROM dialogue WHERE step_order = 2750 AND path_uuid = v_path_id;

    INSERT INTO dialogue (path_uuid, step_order, source_language, type, category, characters)
    VALUES (v_path_id, 2750, 'en', 'dialogue', 'health', '[{"name": "Patient", "gender": "neutral", "avatarURL": "https://example.com/avatars/patient.png"}, {"name": "Nurse", "gender": "female", "avatarURL": "https://example.com/avatars/nurse.png"}]'::jsonb)
    RETURNING uuid INTO v_dialogue_id;

    INSERT INTO dialogue_translation (dialogue_uuid, language, title, description)
    VALUES
        (v_dialogue_id, 'es', 'Habla sobre el alta y los cuidados', 'Lee un diálogo simple sobre las instrucciones de alta después de una pequeña operación.'),
        (v_dialogue_id, 'de', 'Sprich über Entlassung und Pflege', 'Lies einen einfachen Dialog über die Entlassungsanweisungen nach einer kleinen Operation.');

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
        INSERT INTO exercise (target_uuid, grammar_rule_uuid) VALUES (v_dialogue_id, NULL) RETURNING uuid INTO v_ex_id;
        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics) VALUES
            (v_ex_id, 'es', ex->>'p', ex->'s_es'),
            (v_ex_id, 'de', ex->>'p_de', ex->'s_de');
    END LOOP;
END;
$seed$;
