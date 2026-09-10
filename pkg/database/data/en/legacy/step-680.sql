-- ============================================================
-- Seed: A0 English Path – STEP 680 – Reading – understand timetables, flight arrival and departure screens, etc (Viajes y Transporte)
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"p": "El vuelo EZ202 a Lisboa está retrasado.", "p_de": "Der Flug EZ202 nach Lissabon hat Verspätung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El vuelo a Roma sale por la puerta A1.", "p_de": "Der Flug nach Rom geht von Gate A1 ab.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El vuelo a París está en última llamada.", "p_de": "Der Flug nach Paris ist im letzten Aufruf.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El vuelo a Dublín está en hora.", "p_de": "Der Flug nach Dublin ist pünktlich.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El vuelo a Londres sale a las 12:10.", "p_de": "Der Flug nach London geht um 12:10 Uhr.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El vuelo a Madrid sale por la puerta B4.", "p_de": "Der Flug nach Madrid geht von Gate B4 ab.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "El vuelo a Viena tiene 45 minutos de retraso.", "p_de": "Der Flug nach Wien hat 45 Minuten Verspätung.", "s": {"type": "true_false", "answer": true}}'::jsonb,
        '{"p": "El vuelo a Berlín está cancelado.", "p_de": "Der Flug nach Berlin ist gestrichen.", "s": {"type": "true_false", "answer": false}}'::jsonb,
        '{"p": "¿Qué vuelo está cancelado?", "p_de": "Welcher Flug ist gestrichen?", "s": {"type": "multiple_choice", "options": ["El vuelo EZ602 a Dublín", "El vuelo EZ101 a Madrid", "El vuelo EZ550 a Berlín"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el destino del vuelo EZ330?", "p_de": "Was ist das Ziel von Flug EZ330?", "s": {"type": "multiple_choice", "options": ["París", "Roma", "Londres"], "answer": 1}}'::jsonb,
        '{"p": "¿Qué puerta tiene el vuelo a Madrid?", "p_de": "Welches Gate hat der Flug nach Madrid?", "s": {"type": "multiple_choice", "options": ["B4", "C2", "A1"], "answer": 2}}'::jsonb,
        '{"p": "¿Qué vuelo está embarcando?", "p_de": "Welcher Flug befindet sich im Boarding?", "s": {"type": "multiple_choice", "options": ["El vuelo a Roma", "El vuelo a Viena", "El vuelo a Berlín"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto retraso tiene el vuelo a Lisboa?", "p_de": "Wie viel Verspätung hat der Flug nach Lissabon?", "s": {"type": "multiple_choice", "options": ["15 minutos", "30 minutos", "45 minutos"], "answer": 1}}'::jsonb,
        '{"p": "¿A qué hora sale el vuelo a Londres?", "p_de": "Um wie viel Uhr geht der Flug nach London?", "s": {"type": "multiple_choice", "options": ["A las 11:25", "A las 10:20", "A las 12:10"], "answer": 2}}'::jsonb,
        '{"p": "¿Cuál es el estado del vuelo a Berlín?", "p_de": "Wie ist der Status des Flugs nach Berlin?", "s": {"type": "multiple_choice", "options": ["En hora", "Cancelado", "Última llamada"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puerta tiene el vuelo a Viena?", "p_de": "Welches Gate hat der Flug nach Wien?", "s": {"type": "multiple_choice", "options": ["A5", "B2", "C4"], "answer": 1}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM exercise WHERE target_uuid IN (
        SELECT uuid FROM reading WHERE step_order = 680 AND path_uuid = v_path_id
    );
    DELETE FROM reading WHERE step_order = 680 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (
        v_path_id,
        680,
        'en',
        'reading',
        'travel',
        $reading_680$
Airport departures board

The screen below shows late-morning departures in Terminal A. Passengers should always check the flight number, destination, departure time, gate, and status before they walk to security or the boarding area. Some flights are on time, but others are delayed or cancelled, so the information can change quickly. EZ101 to Madrid leaves at 08:15 from Gate A1 and is on time. EZ202 to Lisbon leaves at 09:40 from Gate B4 and is delayed by 30 minutes. EZ330 to Rome leaves at 10:05 from Gate C2 and is now boarding. EZ415 to Paris leaves at 10:20 from Gate A3 and is in last call, so passengers should go quickly to the gate. EZ550 to Berlin leaves at 11:00 from Gate B1 and is on time. EZ602 to Dublin at 11:25 from Gate C4 is cancelled. EZ710 to London leaves at 12:10 from Gate A5 and is on time. EZ811 to Vienna leaves at 12:45 from Gate B2 and is delayed by 45 minutes. The airport asks travellers to listen for announcements and keep boarding passes ready.
$reading_680$
    )RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Pantalla de salidas del aeropuerto');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Abflugtafel am Flughafen');

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
