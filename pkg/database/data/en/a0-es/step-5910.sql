-- ============================================================
-- Seed: A0 English Path – STEP 5910 – Reading – Alojamiento
-- Source language: Spanish
-- ============================================================
DO $seed$
DECLARE
    v_path_id UUID;
    v_reading_id UUID;
    v_ex_id UUID;
    ex JSONB;
    v_exercises JSONB[] := ARRAY[
        '{"es": "La reserva es para Maria Ruiz.", "de": "Die Buchung ist für Maria Ruiz.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La habitación es individual.", "de": "Das Zimmer ist ein Einzelzimmer.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "La habitación está en la segunda planta.", "de": "Das Zimmer ist im zweiten Stock.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La llegada es el lunes 14 de julio.", "de": "Die Ankunft ist am Montag, 14. Juli.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "La salida es el miércoles 16 de julio.", "de": "Die Abreise ist am Mittwoch, 16. Juli.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El check-in empieza a las 2 PM.", "de": "Der Check-in beginnt um 14 Uhr.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "El desayuno no está incluido.", "de": "Das Frühstück ist nicht inbegriffen.", "s_es": {"type": "true_false", "answer": false}, "s_de": {"type": "true_false", "answer": false}}'::jsonb,
        '{"es": "El aparcamiento cuesta £8 por noche.", "de": "Der Parkplatz kostet 8 Pfund pro Nacht.", "s_es": {"type": "true_false", "answer": true}, "s_de": {"type": "true_false", "answer": true}}'::jsonb,
        '{"es": "¿Quién es el huésped?", "de": "Wer ist der Gast?", "s_es": {"type": "multiple_choice", "options": ["Maria Ruiz", "Anna Brown", "Luke Green"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Maria Ruiz", "Anna Brown", "Luke Green"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué tipo de habitación tiene?", "de": "Welche Zimmerart hat sie?", "s_es": {"type": "multiple_choice", "options": ["Twin room", "Single room", "Family room"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweibettzimmer", "Einzelzimmer", "Familienzimmer"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora empieza el check-in?", "de": "Wann beginnt der Check-in?", "s_es": {"type": "multiple_choice", "options": ["2 PM", "11 AM", "8 AM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["14 Uhr", "11 Uhr", "8 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué servicio está incluido?", "de": "Welche Leistung ist inbegriffen?", "s_es": {"type": "multiple_choice", "options": ["Breakfast", "Parking", "Laundry"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Frühstück", "Parkplatz", "Wäscheservice"], "answer": 0}}'::jsonb,
        '{"es": "¿Cuánto cuesta el aparcamiento por noche?", "de": "Wie viel kostet der Parkplatz pro Nacht?", "s_es": {"type": "multiple_choice", "options": ["£8", "£5", "£12"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["8 Pfund", "5 Pfund", "12 Pfund"], "answer": 0}}'::jsonb,
        '{"es": "¿Qué debe hacer si llega tarde?", "de": "Was soll man tun, wenn man spät ankommt?", "s_es": {"type": "multiple_choice", "options": ["Call reception after 8 PM", "Wait outside all night", "Email the cleaner"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Nach 20 Uhr die Rezeption anrufen", "Die ganze Nacht draußen warten", "Dem Reinigungspersonal schreiben"], "answer": 0}}'::jsonb,
        '{"es": "¿A qué hora es la salida?", "de": "Wann ist der Check-out?", "s_es": {"type": "multiple_choice", "options": ["11 AM", "12 PM", "2 PM"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["11 Uhr", "12 Uhr", "14 Uhr"], "answer": 0}}'::jsonb,
        '{"es": "¿En qué piso está la habitación?", "de": "In welchem Stock ist das Zimmer?", "s_es": {"type": "multiple_choice", "options": ["Second floor", "First floor", "Fourth floor"], "answer": 0}, "s_de": {"type": "multiple_choice", "options": ["Zweiter Stock", "Erster Stock", "Vierter Stock"], "answer": 0}}'::jsonb
    ];
BEGIN
    SELECT uuid INTO v_path_id FROM path WHERE source_language = 'en' LIMIT 1;
    DELETE FROM exercise WHERE target_uuid IN (SELECT uuid FROM reading WHERE step_order = 5910 AND path_uuid = v_path_id);
    DELETE FROM reading WHERE step_order = 5910 AND path_uuid = v_path_id;

    INSERT INTO reading (path_uuid, step_order, source_language, type, category, content)
    VALUES (v_path_id, 5910, 'en', 'reading', 'Alojamiento', $reading$
Riverside Hotel booking confirmation

Guest name: Maria Ruiz
Room: Twin room, second floor
Arrival date: Monday, 14 July
Departure date: Wednesday, 16 July
Check-in time: from 2 PM
Check-out time: by 11 AM
Breakfast: included
Wi-Fi: free in all rooms
Parking: available for £8 per night
Late arrival: please call reception after 8 PM
$reading$)
    RETURNING uuid INTO v_reading_id;

    INSERT INTO reading_translation (reading_uuid, language, title, description)
    VALUES
        (v_reading_id, 'es', 'Lee la confirmación de reserva del hotel', 'Lee una confirmación con fechas, tipo de habitación y servicios incluidos.'),
        (v_reading_id, 'de', 'Lies die Hotelbuchungsbestätigung', 'Lies eine Bestätigung mit Daten, Zimmerart und enthaltenen Leistungen.');

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

