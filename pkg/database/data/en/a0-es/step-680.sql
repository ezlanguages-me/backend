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
        '{"p": "¿Cuál es el destino del vuelo EZ330?", "p_de": "Was ist das Ziel von Flug EZ330?", "s": {"type": "multiple_choice", "options": ["Roma", "París", "Londres"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puerta tiene el vuelo a Madrid?", "p_de": "Welches Gate hat der Flug nach Madrid?", "s": {"type": "multiple_choice", "options": ["A1", "B4", "C2"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué vuelo está embarcando?", "p_de": "Welcher Flug befindet sich im Boarding?", "s": {"type": "multiple_choice", "options": ["El vuelo a Roma", "El vuelo a Viena", "El vuelo a Berlín"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuánto retraso tiene el vuelo a Lisboa?", "p_de": "Wie viel Verspätung hat der Flug nach Lissabon?", "s": {"type": "multiple_choice", "options": ["30 minutos", "15 minutos", "45 minutos"], "answer": 0}}'::jsonb,
        '{"p": "¿A qué hora sale el vuelo a Londres?", "p_de": "Um wie viel Uhr geht der Flug nach London?", "s": {"type": "multiple_choice", "options": ["A las 12:10", "A las 11:25", "A las 10:20"], "answer": 0}}'::jsonb,
        '{"p": "¿Cuál es el estado del vuelo a Berlín?", "p_de": "Wie ist der Status des Flugs nach Berlin?", "s": {"type": "multiple_choice", "options": ["En hora", "Cancelado", "Última llamada"], "answer": 0}}'::jsonb,
        '{"p": "¿Qué puerta tiene el vuelo a Viena?", "p_de": "Welches Gate hat der Flug nach Wien?", "s": {"type": "multiple_choice", "options": ["B2", "A5", "C4"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;

    DELETE FROM reading WHERE step_order = 680 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 680, 'en', 'reading', 'travel', 'Airport departures\n\nEZ101 Madrid 08:15 Gate A1 On time\nEZ202 Lisbon 09:40 Gate B4 Delayed 30 minutes\nEZ330 Rome 10:05 Gate C2 Boarding\nEZ415 Paris 10:20 Gate A3 Last call\nEZ550 Berlin 11:00 Gate B1 On time\nEZ602 Dublin 11:25 Gate C4 Cancelled\nEZ710 London 12:10 Gate A5 On time\nEZ811 Vienna 12:45 Gate B2 Delayed 45 minutes')
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'es', 'Pantalla de salidas');

    INSERT INTO reading_translation (reading_uuid, language, title)
    VALUES (v_reading_id, 'de', 'Abflugtafel');

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
