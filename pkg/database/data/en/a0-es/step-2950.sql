-- ============================================================
-- Seed: A0 English Path – STEP 2950 – Reading – find out train times
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "El primer tren sale a las 07:15.", "de": "Der erste Zug fährt um 07:15 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tren rápido sale del andén 1.", "de": "Der Schnellzug fährt von Bahnsteig 1 ab.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El tren rápido llega a Greenhill a las 08:20.", "de": "Der Schnellzug kommt um 08:20 Uhr in Greenhill an.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El tren de las 08:05 lleva diez minutos de retraso.", "de": "Der Zug um 08:05 hat zehn Minuten Verspätung.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La oficina de billetes abre a las 07:00.", "de": "Das Fahrkartenbüro öffnet um 07:00 Uhr.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El mostrador de información cierra a las 09:00.", "de": "Der Informationsschalter schließt um 09:00 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El último tren de la mañana sale a las 08:50.", "de": "Der letzte Zug am Morgen fährt um 08:50 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El primer tren es un tren local.", "de": "Der erste Zug ist ein Nahverkehrszug.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Desde qué andén sale el primer tren?", "de": "Von welchem Bahnsteig fährt der erste Zug?", "s_es": {"type": "multiple_choice", "options": ["Andén 1", "Andén 2", "Andén 3"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bahnsteig 1", "Bahnsteig 2", "Bahnsteig 3"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora sale el tren rápido?", "de": "Um wie viel Uhr fährt der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["07:40", "07:15", "08:50"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["07:40", "07:15", "08:50"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué dos paradas se detiene el primer tren?", "de": "An welchen zwei Stationen hält der erste Zug?", "s_es": {"type": "multiple_choice", "options": ["Mill Road y East Park", "Blue Island y West Airport", "River Town y City Market"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Mill Road und East Park", "Blue Island und West Airport", "River Town und City Market"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto retraso tiene el tren de las 08:05?", "de": "Wie viel Verspätung hat der Zug um 08:05?", "s_es": {"type": "multiple_choice", "options": ["10 minutos", "20 minutos", "No tiene retraso"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["10 Minuten", "20 Minuten", "Keine Verspätung"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora sale el último tren de la mañana?", "de": "Um wie viel Uhr fährt der letzte Zug am Morgen?", "s_es": {"type": "multiple_choice", "options": ["08:50", "08:05", "09:15"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["08:50", "08:05", "09:15"], "answer": 0}}'::jsonb,
        '{"es": "¿Desde qué andén sale el último tren de la mañana?", "de": "Von welchem Bahnsteig fährt der letzte Zug am Morgen?", "s_es": {"type": "multiple_choice", "options": ["Andén 2", "Andén 1", "Andén 4"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Bahnsteig 2", "Bahnsteig 1", "Bahnsteig 4"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora abre la oficina de billetes?", "de": "Um wie viel Uhr öffnet das Fahrkartenbüro?", "s_es": {"type": "multiple_choice", "options": ["06:45", "07:00", "08:00"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["06:45", "07:00", "08:00"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuál es el tren rápido?", "de": "Welcher Zug ist der Schnellzug?", "s_es": {"type": "multiple_choice", "options": ["El de las 07:40", "El de las 07:15", "El de las 08:05"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Der um 07:40 Uhr", "Der um 07:15 Uhr", "Der um 08:05 Uhr"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 2950 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 2950 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 2950, 'en', 'reading', 'transport', $content$
North Street Station.
Morning trains to Greenhill.
The first train is at 07:15 from platform 1. It is a local train and stops at Mill Road and East Park. The fast train is at 07:40 from platform 3. It arrives in Greenhill at 08:20.

Another local train leaves at 08:05 from platform 1. Today this train is ten minutes late. The ticket office opens at 06:45, and the information desk closes at 09:00. If you need the last morning train, it leaves at 08:50 from platform 2.

$content$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee horarios de trenes de la mañana', 'Lee un cartel sencillo con salidas, andenes y retrasos de la mañana.'),
        (v_reading_id, 'de', 'Lies morgendliche Zugzeiten', 'Lies einen einfachen Aushang mit Abfahrten, Bahnsteigen und Verspätungen am Morgen.');

    FOREACH ex IN ARRAY v_exercises LOOP
        INSERT INTO exercise (target_uuid, grammar_rule_uuid)
        VALUES (v_reading_id, NULL)
        RETURNING uuid INTO v_ex_id;

        INSERT INTO exercise_translation (exercise_uuid, language, prompt, specifics)
        VALUES
            (v_ex_id, 'es', ex->>'es', ex->'s_es'),
            (v_ex_id, 'de', ex->>'de', ex->'s_de');
    END LOOP;
END;
$seed$;
