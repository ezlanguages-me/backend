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
        '{"p": "Ben quiere que le devuelvas la llamada esta tarde después de las 7.", "p_de": "Ben möchte, dass du ihn heute Abend nach 19 Uhr zurückrufst.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "La reunión del colegio es el viernes a las 3 PM.", "p_de": "Das Schultreffen ist am Freitag um 15 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El taxi es a las 9 AM.", "p_de": "Das Taxi ist um 9 Uhr.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El taxi espera delante de recepción.", "p_de": "Das Taxi wartet vor der Rezeption.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "Lisa dice que la esperes en el aeropuerto.", "p_de": "Lisa sagt, dass du am Flughafen warten sollst.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "Ben llama antes de las 7 PM.", "p_de": "Ben ruft vor 19 Uhr an.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿A qué hora llega Lisa?", "p_de": "Um wie viel Uhr kommt Lisa an?", "s": {"type": "multiple_choice", "options": ["A las 4:30", "A las 5:30", "A las 3:00"], "answer": 0}}'::jsonb,
        '{"p": "¿Quién pide que le devuelvas la llamada?", "p_de": "Wer bittet um einen Rückruf?", "s": {"type": "multiple_choice", "options": ["Lisa", "Ben", "La recepción del hotel"], "answer": 1}}'::jsonb,
        '{"p": "¿Cuándo es la reunión del colegio?", "p_de": "Wann ist das Schultreffen?", "s": {"type": "multiple_choice", "options": ["El jueves a las 3 PM", "El viernes a las 5 PM", "El viernes a las 3 PM"], "answer": 2}}'::jsonb,
        '{"p": "¿Dónde debes encontrarte con Lisa?", "p_de": "Wo sollst du Lisa treffen?", "s": {"type": "multiple_choice", "options": ["En la estación", "En el gimnasio", "En la piscina"], "answer": 0}}'::jsonb,
        '{"p": "¿Dónde espera el taxi?", "p_de": "Wo wartet das Taxi?", "s": {"type": "multiple_choice", "options": ["En el comedor", "Delante de recepción", "En la puerta C4"], "answer": 1}}'::jsonb,
        '{"p": "¿Cuándo debes llamar a Ben?", "p_de": "Wann sollst du Ben anrufen?", "s": {"type": "multiple_choice", "options": ["Mañana por la mañana", "Al mediodía", "Esta tarde después de las 7"], "answer": 2}}'::jsonb,
        '{"p": "¿Quién envía el mensaje sobre la reunión?", "p_de": "Wer schickt die Nachricht über das Treffen?", "s": {"type": "multiple_choice", "options": ["La oficina del colegio", "Ben", "El conductor del taxi"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora es el taxi?", "p_de": "Um wie viel Uhr ist das Taxi?", "s": {"type": "multiple_choice", "options": ["A las 9 AM", "A las 8 AM", "A las 6 AM"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 690 AND path_uuid = v_path_id
    );
    DELETE FROM reading WHERE step_order = 690 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (
        v_path_id,
        690,
        'en',
        'reading',
        'communication',
        $reading_690$
Phone messages for Emma

Emma comes home in the evening and finds four short phone messages written in a notebook by the door. The first message is from Lisa, recorded at 6:15 PM. Lisa says, “We are arriving tomorrow at 4:30 by train. Please meet us at the station.” The second message is from Ben at 7:05 PM. He says, “Please call me back this evening after 7. I have your keys.” The third message is from the school office at 8:10 AM. The note says that the meeting is on Friday at 3 PM in Room 2. The fourth message is from the hotel desk at 9:00 PM. A staff member reminds Emma that her taxi is at 8 AM in front of reception. Emma copies the details onto a sticky note so she does not forget the arrival time, the school meeting, the call to Ben, and the early taxi. She puts the note next to the door and sets an alarm on her phone for the next morning.
$reading_690$
    )RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Mensajes de teléfono');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Einfache Telefonnachrichten');

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
