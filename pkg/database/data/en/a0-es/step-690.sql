-- ============================================================
-- Seed: A0 English Path – STEP 690 – Reading – understand simple phone messages, e.g. We're arriving tomorrow at half past four (Comunicación Telefónica)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "Lisa llega mañana.", "p_de": "Lisa kommt morgen an.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Lisa llega a las 5:30.", "p_de": "Lisa kommt um 17:30 Uhr an.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Ben quiere que le devuelvas la llamada esta tarde.", "p_de": "Ben möchte, dass du ihn heute Abend zurückrufst.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión del colegio es el viernes a las 3 PM.", "p_de": "Das Schultreffen ist am Freitag um 15 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El taxi es a las 9 AM.", "p_de": "Das Taxi ist um 9 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El taxi espera delante de recepción.", "p_de": "Das Taxi wartet vor der Rezeption.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Lisa dice que la esperes en la estación.", "p_de": "Lisa sagt, dass du sie am Bahnhof treffen sollst.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Ben tiene tus llaves.", "p_de": "Ben hat deine Schlüssel.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "¿A qué hora llega Lisa?", "p_de": "Um wie viel Uhr kommt Lisa an?", "s": {"type": "multiple_choice", "options": ["A las 4:30", "A las 5:30", "A las 3:00"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién pide que le devuelvas la llamada?", "p_de": "Wer bittet um einen Rückruf?", "s": {"type": "multiple_choice", "options": ["Ben", "Lisa", "La recepción del hotel"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo es la reunión del colegio?", "p_de": "Wann ist das Schultreffen?", "s": {"type": "multiple_choice", "options": ["El viernes a las 3 PM", "El jueves a las 3 PM", "El viernes a las 5 PM"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde debes encontrarte con Lisa?", "p_de": "Wo sollst du Lisa treffen?", "s": {"type": "multiple_choice", "options": ["En la estación", "En el gimnasio", "En la piscina"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde espera el taxi?", "p_de": "Wo wartet das Taxi?", "s": {"type": "multiple_choice", "options": ["Delante de recepción", "En el comedor", "En la puerta C4"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuándo debes llamar a Ben?", "p_de": "Wann sollst du Ben anrufen?", "s": {"type": "multiple_choice", "options": ["Esta tarde después de las 7", "Mañana por la mañana", "Al mediodía"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién envía el mensaje sobre la reunión?", "p_de": "Wer schickt die Nachricht über das Treffen?", "s": {"type": "multiple_choice", "options": ["La oficina del colegio", "Ben", "El conductor del taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es el taxi?", "p_de": "Um wie viel Uhr ist das Taxi?", "s": {"type": "multiple_choice", "options": ["A las 8 AM", "A las 9 AM", "A las 6 AM"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM reading WHERE step_order = 690 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 690, 'en', 'reading', 'communication', 'Phone messages for Emma\n\n1) Lisa - 6:15 PM: We''re arriving tomorrow at 4:30 by train. Please meet us at the station.\n\n2) Ben - 7:05 PM: Please call me back this evening after 7. I have your keys.\n\n3) School Office - 8:10 AM: The meeting is on Friday at 3 PM in Room 2.\n\n4) Hotel Desk - 9:00 PM: Your taxi is at 8 AM in front of reception.')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Mensajes de teléfono');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Telefonnachrichten');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'es', ex->>'p', ex->'s');

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES (v_ex_id, 'de', ex->>'p_de', ex->'s');
    END LOOP;
END;
$seed$;
